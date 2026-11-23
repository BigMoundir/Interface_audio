library IEEE;
use IEEE.std_logic_1164.all;

Entity DAC_driver is
    PORT(
        DAC_SDIN : OUT std_logic_vector(47 downto 0);
        OE : OUT std_logic;
        DAC_LRCK, DAC_SCLK: IN std_logic;
        RESET:IN std_logic;
        SDATAL_DAC, SDATAR_DAC: IN std_logic_vector(23 downto 0);
        DAC_LOAD : IN std_logic
    );
END DAC_driver;

ARCHITECTURE behavioral OF DAC_driver IS
BEGIN
    PROCESS(clk, RESET)
    BEGIN
        IF RESET = '1' THEN
            DAC_SDIN <= (others => '0');
            OE <= '0';
        ELSIF rising_edge(clk) AND clk = '1' THEN
            IF THEN

            ELSIF  THEN

            ELSE 
                DAC_SDIN <= (others => '0');
                OE <= '0';
            END IF;
        END IF;
    END PROCESS;
END behavioral;
