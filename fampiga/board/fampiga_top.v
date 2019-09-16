
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
wire	ena1mhz;
wire	cdtv_ir;
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
assign	cfide_ipl = 1;
wire	[1:0] led;
wire	[23:1] GDFX_TEMP_SIGNAL_1;
wire	[2:0] GDFX_TEMP_SIGNAL_2;


assign	led = {pwled,floppyled};
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
	.ena_1mhz(ena1mhz),
	.ir(cdtv_ir),
	.joystick_a(cdtv_joya),
	.joystick_b(cdtv_joyb));


assign	joyA = cdtv_joya & joystick1;
assign	joyB = cdtv_joyb & joystick2;

assign	nVSync =  ~vsync;
assign	nHSync =  ~hsync;
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
	.freeze_n(freeze_n),
	.menu_n(usart_cts & c64_keys[63]),
	
	.addr(addr[23:0]),
	.cpudata_in(cpide_cpudatain),
	.memdata_in(SYNTHESIZED_WIRE_17),
	.state(state),
	.memce(memce),
	.cpuena(cfide_cpuena),
	
	.sd_clk(mmc_clk),
	.sd_do(sd_do),
	.spi_raw_ack(spi_raw_ack),
	.ena1MHz(ena1mhz),
//	.amiser_rxd(amiser_rxd),
	.turbochipram(turbochipram),
	.scandoubler(scandoubler),
	.cpudata(cfide_cpudata),
	.fastramsize(fastramcfg),
	.sd_cs(Spi_CS));



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



//-----------------------------------------------------------------
//-- reconfigure chameleon
//-----------------------------------------------------------------

wire usart_rx;

chameleon_reconfigure reconf(
		.clk(sysclk),
		.reconfigure(reconfigure),
		.serial_clk(usart_clk),
		.serial_txd(usart_rx),
		.serial_cts_n(usart_rts)
	);

	
defparam myio.enable_docking_station = "TRUE";
defparam myio.enable_c64_joykeyb = "TRUE";
defparam myio.enable_c64_4player = "TRUE";
defparam myio.enable_raw_spi = "TRUE";

wire no_clock;
wire docking_station;
wire [63:0] c64_keys;
wire c64_restore_key_n;
wire c64_nmi_n;
wire [5:0] c64_joy1;
wire [5:0] c64_joy2;
wire [5:0] joystick1;
wire [5:0] joystick2;
wire [5:0] joystick3;
wire [5:0] joystick4;
wire button_reset_n;

wire spi_raw_ack;

chameleon_io myio(
		.clk(sysclk),	// present
		.clk_mux(sysclk), // present
		.ena_1mhz(ena1mhz), // present
		.reset(~sdreset), // present, but inverted
		
		.no_clock(no_clock),  // output
		.docking_station(docking_station), // output
		
	// Chameleon FPGA pins
		// C64 Clocks
		.phi2_n(phi2_n),
		.dotclock_n(dotclock_n), 
		// C64 cartridge control lines
		.io_ef_n(ioef_n),
		.rom_lh_n(romlh_n),
		// SPI bus
		.spi_miso(spi_miso),  // present
//		-- CPLD multiplexer
		.mux_clk(mux_clk),  // present
		.mux(mux),  // present
		.mux_d(mux_d),  // present
		.mux_q(mux_q),  // present
		
		.to_usb_rx(usart_rx),

	// SPI raw signals (enable_raw_spi must be set to true)
		.mmc_cs_n(Spi_CS[1]),
		.spi_raw_clk(mmc_clk),
		.spi_raw_mosi(sd_do),
		.spi_raw_ack(spi_raw_ack),

	// LEDs
		.led_green(led[0]), //  -- present
		.led_red(led[1]), // -- present
		.ir(cdtv_ir), // -- present
	
	// PS/2 Keyboard
		.ps2_keyboard_clk_out(kbci), // present
		.ps2_keyboard_dat_out(kbdi), // present
		.ps2_keyboard_clk_in(kbc), // present
		.ps2_keyboard_dat_in(kbd), // present

	// PS/2 Mouse
		.ps2_mouse_clk_out(msci), // present
		.ps2_mouse_dat_out(msdi), // present
		.ps2_mouse_clk_in(msc), // present
		.ps2_mouse_dat_in(msd), // present

	// Buttons
		.button_reset_n(button_reset_n), // present (nreset)

	// Joysticks
		.joystick1(c64_joy1),
		.joystick2(c64_joy2),
		.joystick3(joystick3), 
		.joystick4(joystick4),

	// Keyboards
		.keys(c64_keys),	//-- how to map?  Array, readable in software?
		.restore_key_n(c64_restore_key_n),
		.c64_nmi_n(c64_nmi_n),
		.midi_txd(amiser_txd),
		.midi_rxd(amiser_rxd)
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
			.button(~button_reset_n),
			.nreset(master_reset_n)
		);


endmodule
