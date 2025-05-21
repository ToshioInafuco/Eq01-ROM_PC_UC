run_ghdl-commands:
	ghdl -a Eq01-maq_estados.vhd
	ghdl -a Eq01-ROM_PC_UC.vhd
	ghdl -a Eq01-maq_estados_tb.vhd
	ghdl -e maq_estados_tb
	ghdl -r maq_estados_tb --stop-time=300ns --wave=sim_Eq01-RegFile.ghw

rom_pc_uc:
	ghdl -a Eq01-reg16bits.vhd
	ghdl -a Eq01-pc.vhd
	ghdl -a Eq01-rom.vhd
	ghdl -a Eq01-ROM_PC_UC.vhd
	ghdl -a Eq01-Rom_Pc_UC_tb.vhd
	ghdl -e Rom_Pc_UC_tb
	ghdl -r Rom_Pc_UC_tb --stop-time=500ns --wave=Rom_Pc_UC_tb.ghw


run_pc:
	ghdl -a Eq01-reg16bits.vhd
	ghdl -a Eq01-pc.vhd
	ghdl -a Eq01-pc_tb.vhd
	ghdl -e pc_tb
	ghdl -r pc_tb --stop-time=300ns --wave=pc_tb.ghw
