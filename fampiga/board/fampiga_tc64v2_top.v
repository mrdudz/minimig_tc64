
module fampiga_tc64v2_top
(
	clk50m,
	phi2_n,
	dotclk_n,
	usart_cts,
	freeze_btn,
	reset_btn,
	iec_present,
	ps2iec_sel,
	ps2iec,
	ser_out_clk,
	ser_out_dat,
	ser_out_rclk,
	iec_clk_out,
	iec_srq_out,
	iec_atn_out,
	iec_dat_out,
	flash_cs,
	rtc_cs,
	mmc_cs,
	mmc_cd,
	mmc_wp,
	spi_clk,
	spi_miso,
	spi_mosi,
	clock_ior,
	clock_iow,
	reset_in,
	ioef,
	romlh,
	dma_out,
	game_out,
	exrom_out,
	irq_in,
	irq_out,
	nmi_in,
	nmi_out,
	ba_in,
	rw_in,
	rw_out,
	sa_dir,
	sa_oe,
	sa15_out,
	low_a,
	sd_dir,
	sd_oe,
	low_d,
	ram_clk,
	ram_ldqm,
	ram_udqm,
	ram_ras,
	ram_cas,
	ram_we,
	ram_ba,
	ram_a,
	ram_d,
	ir_data,
	usart_clk,
	usart_rts,
	usart_rx,
	usart_tx,
	red,
	grn,
	blu,
	hsync_n,
	vsync_n,
	sigma_l,
	sigma_r
);

	input wire clk50m;
	input wire phi2_n;
input wire dotclk_n;
	input wire usart_cts;
	input wire freeze_btn;
	input wire reset_btn;
	input wire iec_present;
	output wire ps2iec_sel;
	input [3:0] ps2iec;
	output wire ser_out_clk;
	output wire ser_out_dat;
	output wire ser_out_rclk;
	output wire iec_clk_out;
	output wire iec_srq_out;
	output wire iec_atn_out;
	output wire iec_dat_out;
	output wire flash_cs;
	output wire rtc_cs;
	output wire mmc_cs;
	input wire mmc_cd;
	input wire mmc_wp;
	output wire spi_clk;
	input wire spi_miso;
	output wire spi_mosi;
	output wire clock_ior;
	output wire clock_iow;
	input wire reset_in;
	input wire ioef;
	input wire romlh;
	output wire dma_out;
	output wire game_out;
	output wire exrom_out;
	input wire irq_in;
	output wire irq_out;
	input wire nmi_in;
	output wire nmi_out;
	input wire ba_in;
	input wire rw_in;
	output wire rw_out;
	output wire sa_dir;
	output wire sa_oe;
	output wire sa15_out;
	inout [15:0] low_a;
	output wire sd_dir;
	output wire sd_oe;
	inout [7:0] low_d;
	output wire ram_clk;
	output wire ram_ldqm;
	output wire ram_udqm;
	output wire ram_ras;
	output wire ram_cas;
	output wire ram_we;
	output [1:0] ram_ba;
	output [12:0] ram_a;
	inout [15:0] ram_d;
	input wire ir_data;
	input wire usart_clk;
	input wire usart_rts;
	output wire usart_rx;
	input wire usart_tx;
	output [4:0] red;
	output [4:0] grn;
	output [4:0] blu;
	output wire hsync_n;
	output wire vsync_n;
	output wire sigma_l;
	output wire sigma_r;

assign mmc_cs = Spi_CS[1];

// Unused outputs

assign iec_clk_out = 1'b0;
assign iec_atn_out = 1'b0;
assign iec_dat_out = 1'b0;
assign iec_srq_out = 1'b0;
assign irq_out = 1'b0;
assign nmi_out = 1'b0;

assign flash_cs = 1'b1;
assign rtc_cs = 1'b0;

wire reconfigure;

wire	[31:0] ad;
wire	[31:0] addr;
wire	amiser_rxd;
wire	amiser_txd;
wire txd;
wire	[8:0] ascan;
wire	[3:0] B;
wire	[1:0] ba;
wire	master_reset_n;
//wire	[5:0] c64joya;
//wire	[5:0] c64joyb;
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
wire	ena1mhz;
wire	[5:0] cdtv_joya;
wire	[5:0] cdtv_joyb;
wire	vsync;
wire	hsync;
wire	maincpu_reset;
wire	SYNTHESIZED_WIRE_12;
wire	sdram_hostL;
wire	sdram_hostU;
wire	migtohost_miso;
wire	[15:0] cpide_cpudatain;
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
wire	[15:0] cfide_cpudata;
wire	[0:2] cfide_ipl;
wire	cfide_cpuena;
wire	minimig_cpu_reset;

assign	SYNTHESIZED_WIRE_28 = 1;
assign	SYNTHESIZED_WIRE_29 = 0;
assign	cfide_ipl = 3'b111;

wire	[23:1] GDFX_TEMP_SIGNAL_1;
wire	[2:0] GDFX_TEMP_SIGNAL_2;


assign	GDFX_TEMP_SIGNAL_1 = {g,g,ra[21:1]};
assign	GDFX_TEMP_SIGNAL_2 = {memce,state[1:0]};


palclk_v2	b2v_inst(
	.inclk0(clk50m),
	.c0(ram_clk),
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
	.sck(spi_clk),
	.cpurst(SYNTHESIZED_WIRE_4),
	.locked(sdreset),
	.sysclock(sysclk),
	.sdo(migtohost_miso),
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
	._cpu_reset(minimig_cpu_reset),
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
	._hsync(hsync),
	._vsync(vsync),
	.left(sigma_l),
	.right(sigma_r),
	
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

wire key_power;

// Synchronise IR input
reg ir_d;
reg ir;
always @(posedge sysclk)
begin
	ir_d<=ir_data;
	ir<=ir_d;
end

chameleon_cdtv_remote	b2v_inst11(
	.clk(sysclk),
	.ena_1mhz(ena1mhz),
	.ir(ir),
	.key_power(key_power),
	.joystick_a(cdtv_joya),
	.joystick_b(cdtv_joyb));

assign	joyA = {cdtv_joya[5:4],cdtv_joya[0],cdtv_joya[1],cdtv_joya[2],cdtv_joya[3]}
						& joystick1;
assign	joyB = {cdtv_joyb[5:4],cdtv_joyb[0],cdtv_joyb[1],cdtv_joyb[2],cdtv_joyb[3]}
						& joystick2;

assign	vsync_n =  ~vsync;
assign	hsync_n =  ~hsync;
assign	SYNTHESIZED_WIRE_4 = ~(maincpu_reset & SYNTHESIZED_WIRE_12);

cfide	b2v_inst3(
	.sysclk(sysclk),
	.n_reset(sdreset),
	.cpuena_in(zena),
	.lds(sdram_hostL),
	.uds(sdram_hostU),
	.sd_di(migtohost_miso),
	.sd_dimm(spi_miso),
	.enaWRreg(enaWRreg),
	.TxD(txd),
//	.amiser_txd(amiser_txd),
	.reconfigure(reconfigure),
	.freeze_n(freeze_btn),
	.menu_n(usart_cts & c64_keys[63] & ~key_power),
	
	.addr(addr[23:0]),
	.cpudata_in(cpide_cpudatain),
	.memdata_in(SYNTHESIZED_WIRE_17),
	.state(state),
	.memce(memce),
	.cpuena(cfide_cpuena),
	
	.sd_clk(spi_clk),
	.sd_do(sd_do),
	.spi_raw_ack(1'b1),
	.ena1MHz(ena1mhz),
//	.amiser_rxd(amiser_rxd),
	.turbochipram(turbochipram),
	.scandoubler(scandoubler),
	.cpudata(cfide_cpudata),
	.fastramsize(fastramcfg),
	.sd_cs(Spi_CS));

assign spi_mosi = sd_do;

assign	locked = SYNTHESIZED_WIRE_18 & master_reset_n;


sdram	b2v_inst5(
	.sysclk(sysclk),
	.reset_in(locked),
	.hostL(sdram_hostL),
	.hostU(sdram_hostU),
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
	.hostWR(cpide_cpudatain),
	.sdata(ram_d),
	.sd_we(ram_we),
	.sd_ras(ram_ras),
	.sd_cas(ram_cas),
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
	
	.sdaddr(ram_a)
	);


TG68KdotC_Kernel	b2v_inst6(
	.clk(sysclk),
	.nReset(sdreset),
	.clkena_in(SYNTHESIZED_WIRE_27),
	.IPL_autovector(SYNTHESIZED_WIRE_28),
	.CPU(SYNTHESIZED_WIRE_29),
	.data_in(cfide_cpudata),
	.IPL(cfide_ipl),
	
	.nUDS(sdram_hostU),
	.nLDS(sdram_hostL),
	
	
	.addr(addr),
	.busstate(state),
	.data_write(cpide_cpudatain)
	
	);
	defparam	b2v_inst6.BitField = 0;
	defparam	b2v_inst6.DIV_Mode = 0;
	defparam	b2v_inst6.extAddr_Mode = 0;
	defparam	b2v_inst6.MUL_Mode = 0;
	defparam	b2v_inst6.SR_Read = 0;
	defparam	b2v_inst6.VBR_Stackframe = 0;


TG68K	b2v_inst7(
	.clk(sysclk),
	.reset(maincpu_reset),
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

assign	SYNTHESIZED_WIRE_27 = cfide_cpuena & enaWRreg;

assign	maincpu_reset = minimig_cpu_reset & sdreset;

assign	ram_ldqm = dqm[0];
assign	ram_udqm = dqm[1];
assign	ram_ba[0] = ba[0];
assign	ram_ba[1] = ba[1];
assign	blu[4:1] = B;
assign	blu[0] = g;
assign	grn[4:1] = GR;
assign	grn[0] = g;
assign	red[4:1] = R;
assign	red[0] = g;
assign	ascan = 9'b111111111;
assign	g = 0;
assign	v = 1;


//-----------------------------------------------------------------
//-- reconfigure chameleon
//-----------------------------------------------------------------

chameleon_reconfigure reconf(
		.clk(sysclk),
		.reconfigure(reconfigure),
		.serial_clk(usart_clk),
		.serial_txd(usart_rx),
		.serial_cts_n(usart_rts)
	);

	wire iec_clk_in;
	wire iec_srq_in;
	wire iec_atn_in;
	wire iec_dat_in;

// PS2IEC multiplexer

	chameleon2_io_ps2iec ps2iecmux
	(
		.clk(sysclk),

		.ps2iec_sel(ps2iec_sel),
		.ps2iec(ps2iec),

		.ps2_mouse_clk(msc),
		.ps2_mouse_dat(msd),
		.ps2_keyboard_clk(kbc),
		.ps2_keyboard_dat(kbd),

		.iec_clk(iec_clk_in),
		.iec_srq(iec_srq_in),
		.iec_atn(iec_atn_in),
		.iec_dat(iec_dat_in)
	);


// LED, PS2 and reset shiftregister

	chameleon2_io_shiftreg ledps2resetshiftreg
	(
		.clk(sysclk),

		.ser_out_clk(ser_out_clk),
		.ser_out_dat(ser_out_dat),
		.ser_out_rclk(ser_out_rclk),

		.reset_c64(1'b0),
		.reset_iec(1'b0),
		.ps2_mouse_clk(msci),
		.ps2_mouse_dat(msdi),
		.ps2_keyboard_clk(kbci),
		.ps2_keyboard_dat(kbdi),
		.led_green(pwled),
		.led_red(floppyled)
	);

	
defparam myio.enable_docking_station = "TRUE";
defparam myio.enable_cdtv_remote = "FALSE";
defparam myio.enable_c64_joykeyb = "TRUE";
defparam myio.enable_c64_4player = "TRUE";

wire no_clock;
wire docking_station;
wire [63:0] c64_keys;
wire c64_restore_key_n;
wire [5:0] c64_joy1;
wire [5:0] c64_joy2;
wire [5:0] joystick1;
wire [5:0] joystick2;
wire [5:0] joystick3;
wire [5:0] joystick4;

chameleon2_io myio(
		.clk(sysclk),	// present
		.ena_1mhz(ena1mhz), // present
		.reset(~sdreset), // present, but inverted
		
		.no_clock(no_clock),  // output
		.docking_station(docking_station), // output
		
	// Chameleon FPGA pins
		// C64 Clocks
		.phi2_n(phi2_n),
		.dotclock_n(dotclk_n), 
		// C64 cartridge control lines

//		.ir_data(ir_data),
		.clock_ior(clock_ior),
		.clock_iow(clock_iow),

		.ioef(ioef),
		.romlh(romlh),

		.dma_out(dma_out),
		.game_out(game_out),
		.exrom_out(exrom_out),

		.ba_in(ba_in),
		.rw_out(rw_out),

		.sa_dir(sa_dir),
		.sa_oe(sa_oe),
		.sa15_out(sa15_out),
		.low_a(low_a),

		.sd_dir(sd_dir),
		.sd_oe(sd_oe),
		.low_d(low_d),
		
	// Joysticks
		.joystick1(c64_joy1),
		.joystick2(c64_joy2),
		.joystick3(joystick3), 
		.joystick4(joystick4),

	// Keyboards
		.keys(c64_keys),	//-- how to map?  Array, readable in software?
		.restore_key_n(c64_restore_key_n),
		.midi_rxd(amiser_rxd),
		.midi_txd(amiser_txd)
	// 
	);

// Reverse order of direction signals.
assign joystick1={c64_joy1[5:4],c64_joy1[0],c64_joy1[1],c64_joy1[2],c64_joy1[3]};
assign joystick2={c64_joy2[5:4],c64_joy2[0],c64_joy2[1],c64_joy2[2],c64_joy2[3]};

// Reset circuit

defparam myReset.resetCycles=131071;

	gen_reset myReset(
			.clk(sysclk),
			.enable(1'b1),
			.button(~reset_btn),
			.nreset(master_reset_n)
		);


endmodule
