library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use IEEE.std_logic_arith.all;


entity pe is
  generic (N_FILTER       : integer := 16;
           N_CHANNEL      : integer := 3;
           X_SIZE         : integer := 32;
           FILTER_WIDTH   : integer := 3;
           CONVS_PER_LINE : integer := 15;
           MEM_SIZE       : integer := 12;
           INPUT_SIZE     : integer := 8;
           CARRY_SIZE     : integer := 4;
           SHIFT          : integer := 8;
           LAT            : integer := 2
           );
  port (
    clock : in std_logic;
    reset : in std_logic;
    p_start_conv : in std_logic;
    p_end_conv : out std_logic;
    p_iwght_ce : in std_logic;
    p_iwght_we : in std_logic;
    p_iwght_valid : out std_logic;
    p_ifmap_ce : in std_logic;
    p_ifmap_we : in std_logic;
    p_ifmap_valid : out std_logic;
    p_ofmap_ce : in std_logic;
    p_ofmap_we : in std_logic;
    p_ofmap_valid : out std_logic;
    p_address : in std_logic_vector(MEM_SIZE-1 downto 0);
    p_value_in : in std_logic_vector((INPUT_SIZE*2)-1 downto 0); -- tem q ser a mesma configuração do p_value_out
    p_value_out : out std_logic_vector(((INPUT_SIZE*2)+CARRY_SIZE)-1 downto 0)
  );
end pe;

architecture a1 of pe is

  signal start_conv, end_conv, debug : std_logic;

  signal iwght_valid, ifmap_valid, ofmap_valid : std_logic;

  signal iwght_ce, ifmap_ce, ofmap_ce, ofmap_we : std_logic; 

  signal mem_iwght_ce, mem_ifmap_ce, mem_ofmap_ce, mem_ofmap_we : std_logic; 

  signal iwght_address, ifmap_address, ofmap_address : std_logic_vector(MEM_SIZE-1 downto 0);

  signal mem_iwght_address, mem_ifmap_address, mem_ofmap_address : std_logic_vector(MEM_SIZE-1 downto 0);

  signal iwght_value, ifmap_value : std_logic_vector((INPUT_SIZE*2)-1 downto 0);

  signal ofmap_in, ofmap_out : std_logic_vector(((INPUT_SIZE*2)+CARRY_SIZE)-1 downto 0);

  signal mem_ofmap_in, mem_ofmap_out : std_logic_vector(((INPUT_SIZE*2)+CARRY_SIZE)-1 downto 0);

  signal iwght_n_read, iwght_n_write, ifmap_n_read, ifmap_n_write, ofmap_n_read, ofmap_n_write : std_logic_vector(31 downto 0);

begin
  mem_iwght_ce <= '1' when p_iwght_ce ='1' or iwght_ce = '1' else '0';
  mem_ifmap_ce <= '1' when p_ifmap_ce ='1' or ifmap_ce = '1' else '0';
  mem_ofmap_ce <= '1' when p_ofmap_ce ='1' or ofmap_ce = '1' else '0';
  mem_ofmap_we <= '1' when p_ofmap_we ='1' or ofmap_we = '1' else '0';

  mem_iwght_address <= p_address when p_iwght_ce = '1' else iwght_address;
  mem_ifmap_address <= p_address when p_ifmap_ce = '1' else ifmap_address;
  mem_ofmap_address <= p_address when p_ofmap_ce = '1' else ofmap_address;

  --ifmap_in <= p_value_in when p_ofmap_we = '1' else conv_ofmap_out;

  p_iwght_valid <= iwght_valid;
  p_ifmap_valid <= ifmap_valid;
  p_ofmap_valid <= ofmap_valid;
  p_end_conv <= end_conv;
  p_value_out <= ofmap_out;

  --conv_ofmap_in <= ofmap_out;
  start_conv <= p_start_conv ;


  IWGHT : entity work.memory
    generic map(
      ROM => "no", 
      INPUT_SIZE => INPUT_SIZE*2, 
      ADDRESS_SIZE => MEM_SIZE, 
      DATA_AV_LATENCY => LAT
      )
    port map(
      clock    => clock,
      reset    => reset,
      chip_en  => mem_iwght_ce,
      wr_en    => p_iwght_we,
      data_in  => p_value_in,
      address  => mem_iwght_address,
      data_av  => iwght_valid,
      data_out => iwght_value,
      n_read   => iwght_n_read,
      n_write  => iwght_n_write
      );

  IFMAP : entity work.memory
    generic map(
      ROM => "no",
      INPUT_SIZE => INPUT_SIZE*2,
      ADDRESS_SIZE => MEM_SIZE,
      DATA_AV_LATENCY => LAT
      )
    port map(
      clock    => clock,
      reset    => reset,
      chip_en  => mem_ifmap_ce,
      wr_en    => p_ifmap_we,
      data_in  => p_value_in,
      address  => mem_ifmap_address,
      data_av  => ifmap_valid,
      data_out => ifmap_value,
      n_read   => ifmap_n_read,
      n_write  => ifmap_n_write
      );

  OFMAP : entity work.memory
    generic map(
      ROM => "no",
      INPUT_SIZE => ((INPUT_SIZE*2)+CARRY_SIZE),
      ADDRESS_SIZE => MEM_SIZE,
      DATA_AV_LATENCY => LAT
      )
    port map(
      clock    => clock,
      reset    => reset,
      chip_en  => mem_ofmap_ce,
      wr_en    => mem_ofmap_we,
      data_in  => mem_ofmap_in,
      address  => mem_ofmap_address,
      data_av  => ofmap_valid,
      data_out => mem_ofmap_out,
      n_read   => ofmap_n_read,
      n_write  => ofmap_n_write
      );

  CONV : entity work.convolution
    generic map(
      N_FILTER       => N_FILTER,
      N_CHANNEL      => N_CHANNEL,
      X_SIZE         => X_SIZE,
      FILTER_WIDTH   => FILTER_WIDTH,
      CONVS_PER_LINE => CONVS_PER_LINE,
      MEM_SIZE       => MEM_SIZE,
      INPUT_SIZE     => INPUT_SIZE,
      SHIFT          => SHIFT,
      CARRY_SIZE     => CARRY_SIZE
      )
    port map(
      clock         => clock,
      reset         => reset,

      start_conv    => start_conv,
      end_conv      => end_conv,
      debug         => debug,

      iwght_valid   => iwght_valid,
      iwght_value   => iwght_value,
      iwght_address => iwght_address,
      iwght_ce      => iwght_ce,

      ifmap_valid   => ifmap_valid,
      ifmap_value   => ifmap_value,
      ifmap_address => ifmap_address,
      ifmap_ce      => ifmap_ce,

      ofmap_valid   => ofmap_valid,
      ofmap_in      => ofmap_in,
      ofmap_out     => ofmap_out,
      ofmap_address => ofmap_address,
      ofmap_we      => ofmap_we,
      ofmap_ce      => ofmap_ce
      );

end a1;
