#include "fpga.h"
#include "fdd.h"
#include "hdd.h"

extern void *heap_low;

#define CYCLE_LFSR {lfsr<<=1; if(lfsr&0x400000) lfsr|=1; if(lfsr&0x200000) lfsr^=1;}

#define LFSRSEED 12467

#define CMD_HDRID 0xAACA
#define SPI(x) (*(volatile unsigned char *)0xda4000=x,*(volatile unsigned char *)0xda4000)
#define EnableFpga()  *(volatile unsigned short *)0xda4004=0x10
#define DisableFpga() *(volatile unsigned short *)0xda4004=0x11

static char *hex(int val, char *buf)
{
	int c;
	int i;
	int nz=1;
	if(val)
	{
		for(i=0;i<8;++i)
		{
			c=(val>>28)&0xf;
			val<<=4;
			if(c)
				nz=1;	// Non-zero?  Start printing then.
			if(c>9)
				c+='A'-10;
			else
				c+='0';
			if(nz)	// If we've encountered only zeroes so far we don't print.
				*buf++=c;
		}
	}
	return(buf);
}

// print message on the boot screen
char BootPrint(const char *text)
{
    unsigned char c1, c2, c3, c4;
    unsigned char cmd;
    const char *p;
    unsigned char n;

    p = text;
    n = 0;
    while (*p++ != 0)
        n++; // calculating string length

    cmd = 1;
    while (1)
    {
        EnableFpga();
        c1 = SPI(0x10); // track read command
        c2 = SPI(0x01); // disk present
        SPI(0);
        SPI(0);
        c3 = SPI(0);
        c4 = SPI(0);

        if (c1 & CMD_RDTRK)
        {
            if (cmd)
            { // command phase
                if (c3 == 0x80 && c4 == 0x06) // command packet size must be 12 bytes
                {
                    cmd = 0;
                    SPI(CMD_HDRID >> 8); // command header
                    SPI(CMD_HDRID & 0xFF);
                    SPI(0x00); // cmd: 0x0001 = print text
                    SPI(0x01);
                    // data packet size in bytes
                    SPI(0x00);
                    SPI(0x00);
                    SPI(0x00);
                    SPI(n+2); // +2 because only even byte count is possible to send and we have to send termination zero byte
                    // don't care
                    SPI(0x00);
                    SPI(0x00);
                    SPI(0x00);
                    SPI(0x00);
                }
                else
                    break;
            }
            else
            { // data phase
                if (c3 == 0x80 && c4 == ((n + 2) >> 1))
                {
                    p = text;
                    n = c4 << 1;
                    while (n--)
                    {
                        c4 = *p;
                        SPI(c4);
                        if (c4) // if current character is not zero go to next one
                            p++;
                    }
                    DisableFpga();
                    return 1;
                }
                else
                    break;
            }
        }
        DisableFpga();
    }
    DisableFpga();
    return 0;
}

char textbuf[64]="Error at xxxxxxxx, xxxxxxxx, xxxxxxxx";
char textbuf2[64]="Writing xxxxxxxx longwords starting at xxxxxxxx";

int lfsrcheck(volatile int *base,unsigned int size)
{
	int counter=size;
	int goodreads=0;
	int badreads=0;
	// Shift left 20 bits to convert to megabytes, then 2 bits right since we're dealing with longwords

	hex(size,&textbuf2[8]);
	*hex((int)base,&textbuf2[39])=0;
	BootPrint(textbuf2);

	unsigned int lfsr=LFSRSEED;
	while(--counter)
	{
		base[counter]=lfsr;
		CYCLE_LFSR;
	}
	counter=size;
	lfsr=LFSRSEED;
	while(--counter)
	{
		if(base[counter]==lfsr)
			++goodreads;
		else
		{
			++badreads;
			hex(4*(((int)base)+size),&textbuf[9]);
			hex(base[size],&textbuf[19]);
			*hex(lfsr,&textbuf[29])=0;
			BootPrint(textbuf);
		}
		CYCLE_LFSR;
	}
	return(badreads==0);
}


void c_entry(void)
{
	char *base;
	int size;
	BootPrint("Memory checker\n");
	base=(char *)(&heap_low);
	size=(512*1024)-(int)base;
	if(lfsrcheck((int *)base,size/4-1))
		BootPrint("Passed");
	else
		BootPrint("Failed");
	while(1);
}

