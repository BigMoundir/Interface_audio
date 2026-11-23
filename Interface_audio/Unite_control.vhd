library IEEE;
use IEEE.std_logic_1164.all;

Entity Unite_control is
    PORT(
        ADC_OE, PU_OE : IN std_logic;
        PU_LOAD, DAC_LOAD : OUT std_logic;
        clk,rst : IN std_logic
    );
END Unite_control;

ARCHITECTURE behavioral OF Unite_control IS
BEGIN
    PROCESS(clk, rst)
    BEGIN
        IF rst = '1' THEN
            PU_LOAD <= '0';
            DAC_LOAD <= '0';
        ELSIF rising_edge(clk) AND clk = '1' THEN
            IF PU_OE = '0' AND ADC_OE = '1' THEN
                PU_LOAD <= '1';
                DAC_LOAD <= '0';
            ELSIF PU_OE = '1' AND ADC_OE = '0' THEN
                PU_LOAD <= '0';
                DAC_LOAD <= '1';
            ELSE 
                PU_LOAD <= '0';
                DAC_LOAD <= '0';
            END IF;
        END IF;
    END PROCESS;
END behavioral;
