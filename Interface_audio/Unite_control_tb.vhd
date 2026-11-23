-- testbench de l'UC
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Unite_control_tb IS
END Unite_control_tb;

ARCHITECTURE test of Unite_control_tb is

    component Unite_control
    PORT(
        ADC_OE, PU_OE : IN std_logic;
        PU_LOAD, DAC_LOAD : OUT std_logic;
        clk,rst : IN std_logic
    );
    end component;

    SIGNAL ADC_OE : std_logic;
    SIGNAL PU_OE : std_logic;
    SIGNAL PU_LOAD: std_logic;
    SIGNAL DAC_LOAD : std_logic;
    SIGNAL clk : std_logic;
    SIGNAL rst : std_logic;


BEGIN

    -- branchage Unite_control
    comp_UC : Unite_control
    port map(
            ADC_OE => ADC_OE,
            PU_OE => PU_OE,
            PU_LOAD => PU_LOAD,
            DAC_LOAD => DAC_LOAD,
            clk => clk,
            rst => rst
    );

        
    gene_clk : PROCESS
    BEGIN
        clk <= '1'; wait for 5 ns;
        clk <= '0'; wait for 5 ns;
    END PROCESS gene_clk;  

    reset : PROCESS
    BEGIN
        rst <= '0'; wait for 18 ns; -- reset asynchrone
        rst <= '1'; wait for 180 ns;
        rst <= '0'; wait for 18 ns;
        for i in 1 to 500 loop 
            wait until rising_edge(clk);    
        end loop;
        wait for 3 ns;
    END PROCESS reset;   

    traitement_test : PROCESS
    BEGIN
        ADC_OE <= '0';
        PU_OE<='0';
        for i in 1 to 5 loop -- up pendant 35 T
            wait until rising_edge(clk);    
        end loop;
    
        wait for 3 ns;
        ADC_OE <= '0';
        PU_OE<='1';
        for i in 1 to 3 loop -- up pendant 35 T
            wait until rising_edge(clk);    
        end loop;

        wait for 3 ns;
        ADC_OE <= '1';
        PU_OE<='0';
        for i in 1 to 3 loop -- up pendant 35 T
            wait until rising_edge(clk);    
        end loop;

        wait for 3 ns;
        ADC_OE <= '1';
        PU_OE<='1';
        for i in 1 to 3 loop -- up pendant 35 T
            wait until rising_edge(clk);    
        end loop;

       wait for 3 ns;
        ADC_OE <= '0';
        PU_OE<='0';
        for i in 1 to 3 loop -- up pendant 35 T
            wait until rising_edge(clk);    
        end loop;
    END PROCESS traitement_test;  


END test;
