---------------------------------------------------
---project Interface audio
--- Yassine gaspard mathéo
----------------------------------------------------
-- MASTER 1
-- UNIVERSITE DE RENNES 1
-- S. CRAND
----------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity clock_generator is
Port ( 
    reset      : in  std_logic;
    clk_100MHz : in  std_logic;          
    clk_lrck   : out std_logic;
    clkm_clk   : out std_logic;
    clks_clk   : out std_logic
);
end clock_generator;

architecture Behavioral of clock_generator is
    signal count_div255 : integer := 0;   signal clk_255_int : std_logic := '0';  -- 392.16 kHz
    signal count_div32  : integer := 0;   signal clk_32_int  : std_logic := '0';  -- 3.125 MHz
    signal count_div8   : integer := 0;   signal clk_8_int   : std_logic := '0';  -- 12.5 MHz
begin

clk_lrck <= clk_255_int;   -- 392.16 kHz
clks_clk <= clk_32_int;    -- 3.125 MHz
clkm_clk <= clk_8_int;     -- 12.5 MHz

    -- diviseur par 255
    divise_255: process(clk_100MHz, reset)
    begin
        if reset = '1' then
            count_div255 <= 0;
            clk_255_int  <= '0';
        elsif rising_edge(clk_100MHz) then
            if (count_div255 < 254) then
                count_div255 <= count_div255 + 1;
            else
                count_div255 <= 0;
            end if;
            if (count_div255 < 127) then
                clk_255_int <= '0';
            else
                clk_255_int <= '1';
            end if;
        end if;
    end process divise_255;

    -- diviseur par 32
    divise_32: process(clk_100MHz, reset)
    begin
        if reset = '1' then
            count_div32 <= 0;
            clk_32_int  <= '0';
        elsif rising_edge(clk_100MHz) then
            if (count_div32 < 31) then
                count_div32 <= count_div32 + 1;
            else
                count_div32 <= 0;
            end if;
            if (count_div32 < 16) then
                clk_32_int <= '0';
            else
                clk_32_int <= '1';
            end if;
        end if;
    end process divise_32;

    -- diviseur par 8
    divise_8: process(clk_100MHz, reset)
    begin
        if reset = '1' then
            count_div8 <= 0;
            clk_8_int  <= '0';
        elsif rising_edge(clk_100MHz) then
            if (count_div8 < 7) then
                count_div8 <= count_div8 + 1;
            else
                count_div8 <= 0;
            end if;
            if (count_div8 < 4) then
                clk_8_int <= '0';
            else
                clk_8_int <= '1';
            end if;
        end if;
    end process divise_8;

end Behavioral;
