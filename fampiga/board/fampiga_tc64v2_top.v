// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
// CREATED		"Mon Feb 18 22:56:40 2019"

module fampiga_top(
	clk8,
	mmc_wp,
	mmc_cd_n,
	freeze_n,
	usart_tx,
	usart_clk,
	usart_rts,
	usart_cts,
	spi_miso,
	romlh_n,
	ioef_n,
	dotclock_n,
	phi2_n,
	mux_q,
	mux_clk,
	sd_ldqm,
	sd_udqm,
	sd_we_n,
	sd_ras_n,
	sd_cas_n,
	sd_ba_0,
	sd_ba_1,
	sigmaL,
	sigmaR,
	nHSync,
	nVSync,
	sd_clk,
	blu,
	grn,
	mux,
	mux_d,
	red,
	sd_addr,
	sd_data
);


input wire	clk8;
input wire	mmc_wp;
input wire	mmc_cd_n;
input wire	freeze_n;
input wire	usart_tx;
input wire	usart_clk;
input wire	usart_rts;
input wire	usart_cts;
input wire	spi_miso;
input wire	romlh_n;
input wire	ioef_n;
input wire	dotclock_n;
input wire	phi2_n;
input wire	[3:0] mux_q;
output wire	mux_clk;
output wire	sd_ldqm;
output wire	sd_udqm;
output wire	sd_we_n;
output wire	sd_ras_n;
output wire	sd_cas_n;
output wire	sd_ba_0;
output wire	sd_ba_1;
output wire	sigmaL;
output wire	sigmaR;
output wire	nHSync;
output wire	nVSync;
output wire	sd_clk;
output wire	[4:0] blu;
output wire	[4:0] grn;
output wire	[3:0] mux;
output wire	[3:0] mux_d;
output wire	[4:0] red;
output wire	[12:0] sd_addr;
inout wire	[15:0] sd_data;

wire	[31:0] ad;
wire	[31:0] addr;
wire	amiser_rxd;
wire	amiser_txd;
wire	[8:0] ascan;
wire	[3:0] B;
wire	[1:0] ba;
wire	breset;
wire	[5:0] c64joya;
wire	[5:0] c64joyb;
wire	c_28m;
wire	c_7m;
wire	[31:0] cad;
wire	cdma;
wire	clds;
wire	[15:0] cout;
wire	[1:0] cpu;
wire	cpuena;
wire	[5:0] cpustate;
wire	[3:0] cs;
wire	cuds;
wire	[15:0] cwr;
wire	cwrd;
wire	[15:0] dout;
wire	[1:0] dqm;
wire	[15:0] drd;
wire	dtack;
wire	ena7RDreg;
wire	ena7WRreg;
wire	enaWRreg;
wire	[2:0] fastramcfg;
wire	floppyled;
wire	g;
wire	[3:0] GR;
wire	[2:0] IPL;
wire	[5:0] joyA;
wire	[5:0] joyB;
wire	[5:0] joyC;
wire	[5:0] joyD;
wire	kbc;
wire	kbci;
wire	kbd;
wire	kbdi;
wire	locked;
wire	memce;
wire	[5:0] memcfg;
wire	mmc_clk;
wire	msc;
wire	msci;
wire	msd;
wire	msdi;
wire	pwled;
wire	[3:0] R;
wire	[21:1] ra;
wire	scandoubler;
wire	sd_do;
wire	sdreset;
wire	[7:0] Spi_CS;
wire	[1:0] state;
wire	sysclk;
wire	turbochipram;
wire	v;
wire	zena;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[5:0] SYNTHESIZED_WIRE_7;
wire	[5:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_15;
wire	[15:0] SYNTHESIZED_WIRE_38;
wire	[15:0] SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	[15:0] SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	[0:1] SYNTHESIZED_WIRE_29;
wire	[15:0] SYNTHESIZED_WIRE_30;
wire	[0:2] SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;

assign	SYNTHESIZED_WIRE_28 = 1;
assign	SYNTHESIZED_WIRE_29 = 0;
assign	SYNTHESIZED_WIRE_31 = 1;
wire	[1:0] GDFX_TEMP_SIGNAL_0;
wire	[23:1] GDFX_TEMP_SIGNAL_1;
wire	[2:0] GDFX_TEMP_SIGNAL_2;


assign	GDFX_TEMP_SIGNAL_0 = {pwled,floppyled};
assign	GDFX_TEMP_SIGNAL_1 = {g,g,ra[21:1]};
assign	GDFX_TEMP_SIGNAL_2 = {memce,state[1:0]};


palclk	b2v_inst(
	.inclk0(clk8),
	.c0(sd_clk),
	.c1(sysclk),
	.c2(c_28m),
	.c3(c_7m),
	.locked(SYNTHESIZED_WIRE_18));


Minimig1	b2v_inst1(
	._cpu_as(SYNTHESIZED_WIRE_0),
	._cpu_uds(SYNTHESIZED_WIRE_1),
	._cpu_lds(SYNTHESIZED_WIRE_2),
	.cpu_r_w(SYNTHESIZED_WIRE_3),
	.clk(c_7m),
	.clk28m(c_28m),
	.rxd(amiser_rxd),
	
	._15khz(scandoubler),
	.kbddat(kbd),
	.kbdclk(kbc),
	.msdat(msd),
	.msclk(msc),
	.direct_sdi(spi_miso),
	.sdi(sd_do),
	.sck(mmc_clk),
	.cpurst(SYNTHESIZED_WIRE_4),
	.locked(sdreset),
	.sysclock(sysclk),
	.sdo(SYNTHESIZED_WIRE_15),
	._joy1(joyA),
	._joy2(joyB),
	._joy3(joyC),
	._joy4(joyD),
	._scs(Spi_CS[6:4]),
	.ascancode(ascan),
	.cpu_address(ad[23:1]),
	.cpu_wrdata(cwr),
	.ramdata_in(dout),
	._cpu_dtack(dtack),
	._cpu_reset(SYNTHESIZED_WIRE_34),
	._ram_bhe(SYNTHESIZED_WIRE_21),
	._ram_ble(SYNTHESIZED_WIRE_22),
	._ram_we(SYNTHESIZED_WIRE_23),
	._ram_oe(SYNTHESIZED_WIRE_24),
	.txd(amiser_txd),
	
	.pwrled(pwled),
	.msdato(msdi),
	.msclko(msci),
	.kbddato(kbdi),
	.kbdclko(kbci),
	._hsync(SYNTHESIZED_WIRE_10),
	._vsync(SYNTHESIZED_WIRE_9),
	.left(sigmaL),
	.right(sigmaR),
	
	.floppyled(floppyled),
	
	
	
	._cpu_ipl(IPL),
	
	.blue(B),
	.cpu_config(cpu),
	.cpu_data(drd),
	.green(GR),
	
	.ram_address(ra),
	.ram_data(SYNTHESIZED_WIRE_25),
	.red(R));
	defparam	b2v_inst1.NTSC = 0;



chameleon_cdtv_remote	b2v_inst11(
	.clk(sysclk),
	.ena_1mhz(SYNTHESIZED_WIRE_5),
	.ir(SYNTHESIZED_WIRE_6),
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	.joystick_a(SYNTHESIZED_WIRE_7),
	.joystick_b(SYNTHESIZED_WIRE_8));


assign	joyA = SYNTHESIZED_WIRE_7 & c64joya;

assign	joyB = SYNTHESIZED_WIRE_8 & c64joyb;



assign	nVSync =  ~SYNTHESIZED_WIRE_9;

assign	nHSync =  ~SYNTHESIZED_WIRE_10;

assign	SYNTHESIZED_WIRE_4 = ~(SYNTHESIZED_WIRE_35 & SYNTHESIZED_WIRE_12);



cfide	b2v_inst3(
	.sysclk(sysclk),
	.n_reset(sdreset),
	.cpuena_in(zena),
	.lds(SYNTHESIZED_WIRE_36),
	.uds(SYNTHESIZED_WIRE_37),
	.sd_di(SYNTHESIZED_WIRE_15),
	.sd_dimm(spi_miso),
	.enaWRreg(enaWRreg),
	.kb_clki(kbci),
	.kb_datai(kbdi),
	.ms_clki(msci),
	.ms_datai(msdi),
	
	.amiser_txd(amiser_txd),
	.usart_clk(usart_clk),
	.usart_rts(usart_rts),
	.phi2_n(phi2_n),
	.dotclock_n(dotclock_n),
	.io_ef_n(ioef_n),
	.rom_lh_n(romlh_n),
	.freeze_n(freeze_n),
	.menu_n(usart_cts),
	.addr(addr[23:0]),
	.cpudata_in(SYNTHESIZED_WIRE_38),
	.led(GDFX_TEMP_SIGNAL_0),
	.memdata_in(SYNTHESIZED_WIRE_17),
	.mux_q(mux_q),
	.state(state),
	.mux_clk(mux_clk),
	.memce(memce),
	.cpuena(SYNTHESIZED_WIRE_33),
	
	.sd_clk(mmc_clk),
	.sd_do(sd_do),
	.kb_clk(kbc),
	.kb_data(kbd),
	.ms_clk(msc),
	.ms_data(msd),
	.nreset(breset),
	.ir(SYNTHESIZED_WIRE_6),
	.ena1MHz(SYNTHESIZED_WIRE_5),
	.amiser_rxd(amiser_rxd),
	.turbochipram(turbochipram),
	.scandoubler(scandoubler),
	.cpudata(SYNTHESIZED_WIRE_30),
	.fastramsize(fastramcfg),
	.joystick1(c64joya),
	.joystick2(c64joyb),
	.joystick3(joyC),
	.joystick4(joyD),
	.mux(mux),
	.mux_d(mux_d),
	.sd_cs(Spi_CS));



assign	locked = SYNTHESIZED_WIRE_18 & breset;


sdram	b2v_inst5(
	.sysclk(sysclk),
	.reset_in(locked),
	.hostL(SYNTHESIZED_WIRE_36),
	.hostU(SYNTHESIZED_WIRE_37),
	.cpuU(cuds),
	.cpuL(clds),
	.cpu_dma(cdma),
	.chipU(SYNTHESIZED_WIRE_21),
	.chipL(SYNTHESIZED_WIRE_22),
	.chipRW(SYNTHESIZED_WIRE_23),
	.chip_dma(SYNTHESIZED_WIRE_24),
	.c_7m(c_7m),
	.chipAddr(GDFX_TEMP_SIGNAL_1),
	.chipWR(SYNTHESIZED_WIRE_25),
	.cpuAddr(cad[24:1]),
	.cpustate(cpustate),
	.cpuWR(cwr),
	.hostAddr(addr[23:0]),
	.hostState(GDFX_TEMP_SIGNAL_2),
	.hostWR(SYNTHESIZED_WIRE_38),
	.sdata(sd_data),
	.sd_we(sd_we_n),
	.sd_ras(sd_ras_n),
	.sd_cas(sd_cas_n),
	.hostena(zena),
	.cpuena(cpuena),
	.reset_out(sdreset),
	
	.enaWRreg(enaWRreg),
	.ena7RDreg(ena7RDreg),
	.ena7WRreg(ena7WRreg),
	.ba(ba),
	.chipRD(dout),
	.cpuRD(cout),
	.dqm(dqm),
	.hostRD(SYNTHESIZED_WIRE_17),
	
	.sdaddr(sd_addr)
	);


TG68KdotC_Kernel	b2v_inst6(
	.clk(sysclk),
	.nReset(sdreset),
	.clkena_in(SYNTHESIZED_WIRE_27),
	.IPL_autovector(SYNTHESIZED_WIRE_28),
	.CPU(SYNTHESIZED_WIRE_29),
	.data_in(SYNTHESIZED_WIRE_30),
	.IPL(SYNTHESIZED_WIRE_31),
	
	.nUDS(SYNTHESIZED_WIRE_37),
	.nLDS(SYNTHESIZED_WIRE_36),
	
	
	.addr(addr),
	.busstate(state),
	.data_write(SYNTHESIZED_WIRE_38)
	
	);
	defparam	b2v_inst6.BitField = 0;
	defparam	b2v_inst6.DIV_Mode = 0;
	defparam	b2v_inst6.extAddr_Mode = 0;
	defparam	b2v_inst6.MUL_Mode = 0;
	defparam	b2v_inst6.SR_Read = 0;
	defparam	b2v_inst6.VBR_Stackframe = 0;


TG68K	b2v_inst7(
	.clk(sysclk),
	.reset(SYNTHESIZED_WIRE_35),
	.clkena_in(v),
	.dtack(dtack),
	.vpa(v),
	.ein(v),
	.ena7RDreg(ena7RDreg),
	.ena7WRreg(ena7WRreg),
	.enaWRreg(enaWRreg),
	.ramready(cpuena),
	.turbochipram(turbochipram),
	.cpu(cpu),
	.data_read(drd),
	.fastramcfg(fastramcfg),
	.fromram(cout),
	.IPL(IPL),
	.as(SYNTHESIZED_WIRE_0),
	.uds(SYNTHESIZED_WIRE_1),
	.lds(SYNTHESIZED_WIRE_2),
	.rw(SYNTHESIZED_WIRE_3),
	
	
	
	.nResetOut(SYNTHESIZED_WIRE_12),
	
	.cpuDMA(cdma),
	.ramlds(clds),
	.ramuds(cuds),
	.addr(ad),
	.cpustate(cpustate),
	.data_write(cwr),
	.ramaddr(cad));

assign	SYNTHESIZED_WIRE_27 = SYNTHESIZED_WIRE_33 & enaWRreg;

assign	SYNTHESIZED_WIRE_35 = SYNTHESIZED_WIRE_34 & sdreset;

assign	sd_ldqm = dqm[0];
assign	sd_udqm = dqm[1];
assign	sd_ba_0 = ba[0];
assign	sd_ba_1 = ba[1];
assign	blu[4:1] = B;
assign	blu[0] = g;
assign	grn[4:1] = GR;
assign	grn[0] = g;
assign	red[4:1] = R;
assign	red[0] = g;
assign	ascan = 9'b111111111;
assign	g = 0;
assign	v = 1;

endmodule
