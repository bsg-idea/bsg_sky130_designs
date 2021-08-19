set_units -time ns
create_clock [get_ports clk_i]  -name CLK  -period 320  -waveform {0 160}
