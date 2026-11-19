Entity DAC_driver is
    PORT(
        SD_IN : OUT std_logic_vector(47 downto 0);
        LRCK, SCLK, MCLK: IN std_logic;
        rst:IN std_logic;
        left, right: IN std_logic_vector(23 downto 0);
        LOAD : IN std_logic;
    )
END DAC_driver