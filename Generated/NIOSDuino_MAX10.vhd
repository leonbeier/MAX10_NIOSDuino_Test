  
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all; 

      
ENTITY NIOSDuino_MAX10 IS

PORT (
  --#IOVoltagePins
  CLK : IN STD_LOGIC;
  
  Reset         : IN STD_LOGIC;
  sdram_addr    : OUT STD_LOGIC_VECTOR (11 downto 0);
  sdram_ba      : OUT STD_LOGIC_VECTOR (1 downto 0);
  sdram_cas_n   : OUT STD_LOGIC;
  sdram_ras_n   : OUT STD_LOGIC;
  sdram_we_n    : OUT STD_LOGIC;
  sdram_dq      : INOUT STD_LOGIC_VECTOR (15 downto 0);
  sdram_dqm     : OUT STD_LOGIC_VECTOR (1 downto 0);
  sdram_cke     : OUT STD_LOGIC;
  sdram_cs_n    : OUT STD_LOGIC;
  sdram_clk_clk : OUT STD_LOGIC;
  pio_export    : INOUT STD_LOGIC_VECTOR (15 downto 0);
  pwm_out       : OUT STD_LOGIC_VECTOR (3 downto 0);
  uart_rxd      : IN STD_LOGIC;
  uart_txd      : OUT STD_LOGIC;
  i2c_sda       : INOUT STD_LOGIC;
  i2c_scl       : INOUT STD_LOGIC;
  spi_MISO      : IN STD_LOGIC;
  spi_MOSI      : OUT STD_LOGIC;
  spi_SCLK      : OUT STD_LOGIC

);
END NIOSDuino_MAX10;

ARCHITECTURE BEHAVIORAL OF NIOSDuino_MAX10 IS
  COMPONENT NIOSDuino_Processor IS
  
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
  END COMPONENT;
  
BEGIN

  --#SetIOVoltage
  NIOSDuino_Processor1 : NIOSDuino_Processor  PORT MAP (
    CLK => CLK,
    Reset         => Reset,
    sdram_addr    => sdram_addr,
    sdram_ba      => sdram_ba,
    sdram_cas_n   => sdram_cas_n,
    sdram_cke     => sdram_cke,
    sdram_cs_n    => sdram_cs_n,
    sdram_dq      => sdram_dq,
    sdram_dqm     => sdram_dqm,
    sdram_ras_n   => sdram_ras_n,
    sdram_we_n    => sdram_we_n,
    sdram_clk_clk => sdram_clk_clk,
    pio_export    => pio_export,
    pwm_out       => pwm_out,
    uart_rxd      => uart_rxd,
    uart_txd      => uart_txd,
    i2c_sda       => i2c_sda,
    i2c_scl       => i2c_scl,
    spi_MISO      => spi_MISO,
    spi_MOSI      => spi_MOSI,
    spi_SCLK      => spi_SCLK
  );
  
END BEHAVIORAL;