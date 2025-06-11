rom_pc_uc:  
	ghdl -a Eq01-reg16bits.vhd
	ghdl -a Eq01-pc.vhd
	ghdl -a Eq01-maq_estados.vhd
	ghdl -a Eq01-rom.vhd
	ghdl -a Eq01-ROM_PC_UC.vhd
	ghdl -a Eq01-Rom_Pc_UC_tb.vhd
	ghdl -e Rom_Pc_UC_tb
	ghdl -r Rom_Pc_UC_tb --stop-time=1000ns --wave=Rom_Pc_UC_tb.ghw
