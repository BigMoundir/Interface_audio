Entity Unite_traitement is
    PORT(
        left_IN, right_IN: IN std_logic_vector(23 downto 0);
        left_OUT, right_OUT: OUT std_logic_vector(23 downto 0);
        OE : OUT std_logic;
        LOAD : IN std_logic;
        clk,rst : IN std_logic;
    )
END Unite_traitement