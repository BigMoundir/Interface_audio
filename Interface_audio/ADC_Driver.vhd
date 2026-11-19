Entity ADC_Driver is 
PORT(
        SD_OUT : IN std_logic_vector(47 downto 0);
        LRCK, SCLK, MCLK: IN std_logic;
        rst:IN std_logic;
        left, right: OUT std_logic_vector(23 downto 0);
        OE : OUT std_logic;
)
END ADC_Driver