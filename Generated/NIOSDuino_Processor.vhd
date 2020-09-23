  
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all; 


ENTITY NIOSDuino_Processor IS
PORT (
  CLK : IN STD_LOGIC;
  Reset                      : IN    STD_LOGIC;
  sdram_addr                 : OUT   STD_LOGIC_VECTOR(11 downto 0);
  sdram_ba                   : OUT   STD_LOGIC_VECTOR(1 downto 0);
  sdram_cas_n                : OUT   STD_LOGIC;
  sdram_cke                  : OUT   STD_LOGIC := '1';
  sdram_cs_n                 : OUT   STD_LOGIC := '0';
  sdram_dq                   : INOUT STD_LOGIC_VECTOR(15 downto 0) := (others => 'X');
  sdram_dqm                  : OUT   STD_LOGIC_VECTOR(1 downto 0);
  sdram_ras_n                : OUT   STD_LOGIC;
  sdram_we_n                 : OUT   STD_LOGIC;
  sdram_clk_clk              : OUT   STD_LOGIC;
  pio_export                 : INOUT STD_LOGIC_VECTOR(15 downto 0) := (others => 'X');
  pwm_out                    : OUT   STD_LOGIC_VECTOR(3 downto 0);
  uart_rxd                   : IN    STD_LOGIC := 'X';
  uart_txd                   : OUT   STD_LOGIC;
  i2c_sda                    : INOUT STD_LOGIC := 'Z';
  i2c_scl                    : INOUT STD_LOGIC := 'Z';
  spi_MISO                   : IN    STD_LOGIC := 'X';
  spi_MOSI                   : OUT   STD_LOGIC;
  spi_SCLK                   : OUT   STD_LOGIC

);
END NIOSDuino_Processor;

ARCHITECTURE BEHAVIORAL OF NIOSDuino_Processor IS

  component NIOSDuino_Core
  port (
  clk_in_clk            : in    std_logic                     := '0';             
  i2c_sda_in            : in    std_logic                     := '0';             
  i2c_scl_in            : in    std_logic                     := '0';             
  i2c_sda_oe            : out   std_logic;                                        
  i2c_scl_oe            : out   std_logic;                                        
  pio_export            : inout std_logic_vector(15 downto 0) := (others => '0'); 
  reset_reset_n         : in    std_logic                     := '1';             
  sdram_addr            : out   std_logic_vector(11 downto 0);                    
  sdram_ba              : out   std_logic_vector(1 downto 0);                     
  sdram_cas_n           : out   std_logic;                                        
  sdram_cke             : out   std_logic := '1';  
  sdram_cs_n            : out   std_logic := '0';  
  sdram_dq              : inout std_logic_vector(15 downto 0) := (others => '0'); 
  sdram_dqm             : out   std_logic_vector(1 downto 0);                     
  sdram_ras_n           : out   std_logic;                                        
  sdram_we_n            : out   std_logic;                                        
  sdram_clk_clk         : out   std_logic;                                        
  spi_MISO              : in    std_logic                     := '0';             
  spi_MOSI              : out   std_logic;                                        
  spi_SCLK              : out   std_logic;                                        
  uart_rxd              : in    std_logic                     := '0';             
  uart_txd              : out   std_logic;                                        
  pwm_out               : out   std_logic_vector(3 downto 0)                     
  );
  end component;


  SIGNAL i2c_sda_in : STD_LOGIC;
  SIGNAL i2c_scl_in : STD_LOGIC;
  SIGNAL i2c_sda_oe : STD_LOGIC;
  SIGNAL i2c_scl_oe : STD_LOGIC;
  SIGNAL reset_reset_n : STD_LOGIC;
  
BEGIN




  i2c_scl_in  <= i2c_scl;
  i2c_scl     <= '0' when i2c_scl_oe = '1' else 'Z';
  i2c_sda_in  <= i2c_sda;
  i2c_sda     <= '0' when i2c_sda_oe = '1' else 'Z';

  reset_reset_n <= Reset;

  u1: NIOSDuino_Core port map
  (
  clk_in_clk            => CLK,
  i2c_sda_in            => i2c_sda_in,
  i2c_scl_in            => i2c_scl_in,
  i2c_sda_oe            => i2c_sda_oe,
  i2c_scl_oe            => i2c_scl_oe,
  pio_export            => pio_export,
  reset_reset_n         => reset_reset_n,
  sdram_addr            => sdram_addr,
  sdram_ba              => sdram_ba,
  sdram_cas_n           => sdram_cas_n,
  sdram_cke             => sdram_cke,
  sdram_cs_n            => sdram_cs_n,
  sdram_dq              => sdram_dq,
  sdram_dqm             => sdram_dqm,
  sdram_ras_n           => sdram_ras_n,
  sdram_we_n            => sdram_we_n,
  sdram_clk_clk         => sdram_clk_clk,
  spi_MISO              => spi_MISO,
  spi_MOSI              => spi_MOSI,
  spi_SCLK              => spi_SCLK,
  uart_rxd              => uart_rxd,
  uart_txd              => uart_txd,
  pwm_out               => pwm_out
  );
  
END BEHAVIORAL;