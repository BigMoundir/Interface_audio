
----------------------------------------------------
-- MASTER 1
-- UNIVERSITE DE RENNES 1
-- S. CRAND
----------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity clock_generator is
Port ( 
reset : in std_logic;
clk_100MHz : in std_logic;          
clk_1Hz : out std_logic;
clk_10Hz : out std_logic;
clk_100Hz : out std_logic;
clk_1kHz : out std_logic;
clk_10kHz : out std_logic;
clk_100kHz : out std_logic;
clk_1MHz : out std_logic);
end clock_generator;

architecture Behavioral of clock_generator is
signal count_1MHz : integer :=0;		signal clk_1MHz_int : std_logic;
signal count_100kHz : integer :=0;	signal clk_100kHz_int : std_logic;
signal count_10kHz : integer :=0;	signal clk_10kHz_int : std_logic;
signal count_1kHz : integer :=0;		signal clk_1kHz_int : std_logic;
signal count_100Hz : integer :=0;	signal clk_100Hz_int : std_logic;
signal count_10Hz : integer :=0;	signal clk_10Hz_int : std_logic;
signal count_1Hz : integer :=0;	signal clk_1Hz_int : std_logic;
begin

-- synchronisation de l'horloge 100 Hz sur l'horloge principale
--	(celle de la carte) de 100 MHz
clk_1Mhz <= clk_1Mhz_int;
clk_100khz <= clk_100khz_int;
clk_10khz <= clk_10khz_int;
clk_1khz <= clk_1khz_int;
clk_100hz <= clk_100hz_int;
clk_10hz <= clk_10hz_int;
clk_1hz <= clk_1hz_int;
		
		
	-- diviseur par 100
   divise_100: process(clk_100MHz,reset)
	begin
		if reset = '1' then
			clk_1MHz_int <= '0';
		elsif rising_edge(clk_100MHz) then
			if (count_1MHz < 99)then 
				count_1MHz <= count_1MHz +1;
			else
				count_1MHz <= 0;
			end if;
			if (count_1MHz < 50) then
				clk_1MHz_int <= '0';
			else
				clk_1MHz_int <= '1';
			end if;
		end if;
	end process divise_100;

	-- diviseur par 10
	divise_10: process(clk_1MHz_int,reset)
	begin
		
		if reset = '1' then
			clk_100kHz_int <= '0';
		elsif rising_edge(clk_1MHz_int) then
			if (count_100kHz < 4)then 
				count_100kHz <= count_100kHz +1;
			else
				count_100kHz <= 0;
				clk_100kHz_int <= not clk_100kHz_int;
			end if;
		end if;
	end process divise_10;

	-- diviseur par 10
	process (clk_100kHz_int,reset)
	begin
		if reset = '1' then
			clk_10kHz_int <= '0';
		elsif rising_edge(clk_100kHz_int) then
			if (count_10kHz < 4)then 
				count_10kHz <= count_10kHz +1;
			else
				count_10kHz <= 0;
				clk_10kHz_int <= not clk_10kHz_int;
			end if;
		end if;
	end process;

	-- diviseur par 10
	process(clk_10kHz_int,reset)
	begin
		if reset = '1' then
			clk_1kHz_int <= '0';
		elsif rising_edge(clk_10kHz_int) then
			if (count_1kHz < 4)then 
				count_1kHz <= count_1kHz +1;
			else
				count_1kHz <= 0;
				clk_1kHz_int <= not clk_1kHz_int;
			end if;
		end if;
	end process;

	-- diviseur par 10
	process(clk_1kHz_int,reset)
	begin
		if reset = '1' then
			clk_100Hz_int <= '0';
		elsif rising_edge(clk_1kHz_int) then
			if (count_100Hz < 4)then 
				count_100Hz <= count_100Hz +1;
			else
				count_100Hz <= 0;
				clk_100Hz_int <= not clk_100Hz_int;
			end if;
		end if;
	end process;
	
	-- diviseur par 10
	process(clk_100Hz_int,reset)
	begin
		if reset = '1' then
			clk_10Hz_int <= '0';
		elsif rising_edge(clk_100Hz_int) then
			if (count_10Hz < 4)then 
				count_10Hz <= count_10Hz +1;
			else
				count_10Hz <= 0;
				clk_10Hz_int <= not clk_10Hz_int;
			end if;
		end if;
	end process;
	
	-- diviseur par 10
	process(clk_10Hz_int,reset)
	begin
		if reset = '1' then
			clk_1Hz_int <= '0';
		elsif rising_edge(clk_10Hz_int) then
			if (count_1Hz < 4)then 
				count_1Hz <= count_1Hz +1;
			else
				count_1Hz <= 0;
				clk_1Hz_int <= not clk_1Hz_int;
			end if;
		end if;
	end process;			
end Behavioral;
