entity Archi is 
PORT(
    SD_OUT : IN std_logic_vector(47 downto 0);
    SD_IN : OUT std_logic_vector(47 downto 0);
    GCLK,RST : IN std_logic;
)
END Archi

ARCHITECTURE structural of Archi is 

Component ADC_driver 
    PORT(
        SD_OUT : IN std_logic_vector(47 downto 0);
        LRCK, SCLK, MCLK: IN std_logic;
        rst:IN std_logic;
        left, right: OUT std_logic_vector(23 downto 0);
        OE : OUT std_logic;
    )
END Component

Component DAC_driver 
    PORT(
        SD_IN : OUT std_logic_vector(47 downto 0);
        LRCK, SCLK, MCLK: IN std_logic;
        rst:IN std_logic;
        left, right: IN std_logic_vector(23 downto 0);
        LOAD : IN std_logic;
    )
END Component

Component Unite_traitement
    PORT(
        left_IN, right_IN: IN std_logic_vector(23 downto 0);
        left_OUT, right_OUT: OUT std_logic_vector(23 downto 0);
        OE : OUT std_logic;
        LOAD : IN std_logic;
        clk,rst : IN std_logic;
    )
END Component

Component Unite_control
    PORT(
        ADC_OE, PU_OE : IN std_logic;
        PU_LOAD, DAC_LOAD : OUT std_logic;
        clk,rst : IN std_logic;
    )
END Component

Component Clock_generator
    PORT(
        GCLK : IN std_logic;
        LRCK, SCLK, MCLK: OUT std_logic;
    )
END Component


SIGNAL left_adc_driver_to_unite_traitement, right_adc_driver_to_unite_traitement :std_logic_vector(23 downto 0);
SIGNAL left_unite_traitement_to_dac_driver, right_unite_traitement_to_dac_driver :std_logic_vector(23 downto 0);
SIGNAL OE_adc, OE_PU, LOAD_DAC, LOAD_PU : std_logic ;
SIGNAL SCLK,MCLK,LRCK,GCLK: std_logic ;
SIGNAL SD_IN,SD_OUT: std_logic_vector(47 downto 0);

begin
    ADC_driver : ADC_driver
        PORT MAP(
            SD_OUT => SD_OUT,
            LRCK => LRCK,
            SCLK => SCLK, 
            MCLK => MCLK,
            rst => RST,
            left => left_adc_driver_to_unite_traitement,
            right => right_adc_driver_to_unite_traitement,
            OE => OE_adc
        )
       
    DAC_driver : DAC_driver
        PORT MAP(
            SD_IN => SD_IN,
            LRCK => LRCK,
            SCLK => SCLK, 
            MCLK => MCLK,
            rst => RST,
            left => left_unite_traitement_to_dac_driver,
            right => right_unite_traitement_to_dac_driver,
            LOAD => LOAD_DAC
        )

    Unite_tratement : Unite_traitement
        PORT MAP(
            left_IN => left_adc_driver_to_unite_traitement, 
            right_IN =>right_adc_driver_to_unite_traitement,
            left_OUT => left_unite_traitement_to_dac_driver, 
            right_OUT => right_unite_traitement_to_dac_driver,
            OE => OE_PU,
            LOAD => LOAD_PU,
            clk => SCLK,
            rst => RST,
        )

    Unite_control : Unite_control
        PORT MAP(
            ADC_OE =>OE_adc , 
            PU_OE => OE_PU,
            PU_LOAD => LOAD_PU, 
            DAC_LOAD => LOAD_DAC,
            clk => SCLK,
            rst => RST,
        )

    Clock_generator : Clock_generator
        PORT MAP(
            GCLK => GCLK , 
            LRCK => LRCK,
            SCLK => SCLK, 
            MCLK => MCLK,
        )

    


    