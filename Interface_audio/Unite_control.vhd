Entity Unite_control is
    PORT(
        ADC_OE, PU_OE : IN std_logic;
        PU_LOAD, DAC_LOAD : OUT std_logic;
        clk,rst : IN std_logic;
    )
END Unite_control