set_units -time ns
create_clock [get_ports clk_i]  -name CLK  -period 50 -waveform {0 25}
