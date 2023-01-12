library ieee;
library std;

use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_textio.all;

use std.textio.all;

use work.gold_package.all;


entity tb is
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
end tb;

architecture a1 of tb is
  signal clock, reset, start_conv, debug : std_logic := '0';

  signal ofmap_valid, ofmap_ce, ofmap_we, end_conv : std_logic := '0';

  signal ofmap_address : std_logic_vector(MEM_SIZE-1 downto 0);

  signal ofmap_out, ofmap_in : std_logic_vector(((INPUT_SIZE*2)+CARRY_SIZE)-1 downto 0);

  signal ofmap_n_read, ofmap_n_write : std_logic_vector(31 downto 0);

begin



  PE0 : entity pe0.pe
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

      p_start_conv    => start_conv,
      p_end_conv      => end_conv,
      p_debug         => debug,
      config          => '0',

      p_iwght_ce      => '0',
      p_iwght_we      => '0',
      p_iwght_valid   => (others => '0'),

      p_ifmap_ce      => '0',
      p_ifmap_we      => '0',
      p_ifmap_valid   => (others => '0'),

      p_ofmap_we      => ofmap_we,
      p_ofmap_ce      => ofmap_ce,
      p_ofmap_valid   => ofmap_valid,

      p_address_in    => (others => '0'),
      p_value_in      => value_in,
      p_address_out   => address_out,
      p_value_out     => value_out
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
      chip_en  => ofmap_ce,
      wr_en    => ofmap_we,
      data_in  => value_out,
      address  => address_out,
      data_av  => ofmap_valid,
      data_out => value_in,
      n_read   => ofmap_n_read,
      n_write  => ofmap_n_write
      );

  clock <= not clock after 0.5 ns;

  reset <= '1', '0' after 2.5 ns;

  start_conv <= '0', '1' after 2.5 ns, '0' after 3.5 ns;

  process(clock)

    -- convolution counter
    variable cont_conv : integer := 0;

  begin

    for i in 0 to (CONVS_PER_LINE*CONVS_PER_LINE*N_FILTER) loop
      ofmap_ce <= '1';
      address <= CONV_STD_LOGIC_VECTOR(i, INPUT_SIZE);
      wait until rising_edge(ofmap_valid);
        if value_out /= CONV_STD_LOGIC_VECTOR(gold(CONV_INTEGER(unsigned(address))), (INPUT_SIZE*2)) then
          report "end of simulation with error!";
          report "number of convolutions executed: " & integer'image(cont_conv);
          report "idx: " & integer'image(CONV_INTEGER(unsigned(address)));
          report "expected value: " & integer'image(gold(CONV_INTEGER(unsigned(address))));

          if (INPUT_SIZE*2)+CARRY_SIZE > 32 then
            report "obtained value: " & integer'image(CONV_INTEGER(value_out(31 downto 0)));
          else
            report "obtained value: " & integer'image(CONV_INTEGER(value_out));
          end if;

          assert false severity failure;
        end if;
        cont_conv := cont_conv + 1;
    end loop;

    report "number of convolutions: " & integer'image(cont_conv);
    report "end of simulation without error!" severity failure;
  end process;

end a1;
