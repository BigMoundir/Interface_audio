Entity Clock_generator is 
    PORT(
        GCLK : IN std_logic;
        LRCK, SCLK, MCLK: OUT std_logic;
    )
End Clock_generator