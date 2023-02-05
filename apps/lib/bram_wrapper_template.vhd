library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use IEEE.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;

use work.util_package.all;


entity bram_wrapper is
    generic (
        DEVICE : string := "7SERIES";
        N_BRAM : integer := 0
        );


  port (reset   : in std_logic;
        clock   : in std_logic;
        chip_en : in std_logic;
        wr_en   : in std_logic;
        data_in : in std_logic_vector(INPUT_SIZE-1 downto 0);
        address : in std_logic_vector(ADDRESS_SIZE-1 downto 0);

        data_av  : out std_logic;
        data_out : out std_logic_vector(INPUT_SIZE-1 downto 0);

        n_read  : out std_logic_vector(31 downto 0);
        n_write : out std_logic_vector(31 downto 0)
        );
end bram_wrapper;

architecture a1 of bram_wrapper is

signal data_valid    : std_logic;
signal bram_chip_en  : std_logic_vector(N_BRAM - 1 downto 0);
signal bram_wr_en    : std_logic_vector(N_BRAM - 1 downto 0);
signal bram_data_out : std_logic_vector(INPUT_SIZE-1 downto 0);

begin

  bram_chip_en(0) <= '1' when chip_en and (16000*0 <= address and address < 16000*1);
  bram_chip_en(1) <= '1' when chip_en and (16000*1 <= address and address < 16000*2);
  bram_chip_en(2) <= '1' when chip_en and (16000*2 <= address and address < 16000*3);

  -- code to imitate data_av in simulation
  process(reset, clock)
  begin
    if reset = '1' then
        data_valid <= '0';
    elsif rising_edge(clock) then
        data_valid <= chip_en;
        data_av <= data_valid;
    end if;
  end process;

  LOOP_MEM : for i in 0 to N_BRAM generate
    BRAM_SINGLE_INST: entity work.bram_single
    generic map (
      N_BRAM => i
    )
    port map(
      CLK  => clock,
      RST  => reset,
      EN   => chip_en,
      WE   => wr_en,
      DI   => data_in,
      ADDR => address,
      DO   => data_out
      );

  end generate; 

end a1;
