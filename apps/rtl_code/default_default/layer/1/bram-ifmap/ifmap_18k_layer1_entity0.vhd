library UNISIM;
use UNISIM.vcomponents.all;
library UNIMACRO;
use unimacro.Vcomponents.all;


-- BRAM_SINGLE_MACRO: Single Port RAM
--                    7 Series
-- Xilinx HDL Language Template, version 2021.2

-- Note -  This Unimacro model assumes the port directions to be "downto".
--         Simulation of this model with "to" in the port directions could lead to erroneous results.

---------------------------------------------------------------------
--  READ_WIDTH | BRAM_SIZE | READ Depth  | ADDR Width |            --
-- WRITE_WIDTH |           | WRITE Depth |            |  WE Width  --
-- ============|===========|=============|============|============--
--    37-72    |  "36Kb"   |      512    |    9-bit   |    8-bit   --
--    19-36    |  "36Kb"   |     1024    |   10-bit   |    4-bit   --
--    19-36    |  "18Kb"   |      512    |    9-bit   |    4-bit   --
--    10-18    |  "36Kb"   |     2048    |   11-bit   |    2-bit   --
--    10-18    |  "18Kb"   |     1024    |   10-bit   |    2-bit   --
--     5-9     |  "36Kb"   |     4096    |   12-bit   |    1-bit   --
--     5-9     |  "18Kb"   |     2048    |   11-bit   |    1-bit   --
--     3-4     |  "36Kb"   |     8192    |   13-bit   |    1-bit   --
--     3-4     |  "18Kb"   |     4096    |   12-bit   |    1-bit   --
--       2     |  "36Kb"   |    16384    |   14-bit   |    1-bit   --
--       2     |  "18Kb"   |     8192    |   13-bit   |    1-bit   --
--       1     |  "36Kb"   |    32768    |   15-bit   |    1-bit   --
--       1     |  "18Kb"   |    16384    |   14-bit   |    1-bit   --
---------------------------------------------------------------------

entity ifmap_18k_layer1_entity0 is
    generic (
        DEVICE: string := "7SERIES"
        );
  
    port (reset   : in std_logic;
          clock   : in std_logic;
          chip_en : in std_logic;
          wr_en   : in std_logic_vector(2-1 downto 0);;
          data_in : in std_logic_vector(INPUT_SIZE-1 downto 0);
          address : in std_logic_vector(10-1 downto 0);
  
          data_av  : out std_logic;
          data_out : out std_logic_vector(INPUT_SIZE-1 downto 0);
  
          n_read  : out std_logic_vector(31 downto 0);
          n_write : out std_logic_vector(31 downto 0)
          );
  end ifmap_18k_layer1_entity0;

  architecture a1 of bram is

    begin

    BRAM_SINGLE_MACRO_inst : BRAM_SINGLE_MACRO
    generic map (
       BRAM_SIZE => "18Kb",             -- Target BRAM, "18Kb" or "36Kb"
       DEVICE => DEVICE,             -- Target Device: "VIRTEX5", "7SERIES", "VIRTEX6, "SPARTAN6"
       DO_REG => 0,                     -- Optional output register (0 or 1)
       INIT => X"000000000000000000",   -- Initial values on output port
       INIT_FILE => "NONE",
       WRITE_WIDTH => INPUT_SIZE, -- 0, -- Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
       READ_WIDTH => INPUT_SIZE, -- 0,  -- Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
       SRVAL => X"000000000000000000",  -- Set/Reset value for port output
       WRITE_MODE => "WRITE_FIRST",     -- "WRITE_FIRST", "READ_FIRST" or "NO_CHANGE"
       -- The following INIT_xx declarations specify the initial contents of the RAM
       INIT_00 => X"00120012000f00140017000d000f001d001d000a000000010006000c00150016",
       INIT_01 => X"0012000f00130013000400080003000000040000000000000005000b0000000b",
       INIT_02 => X"0013001b0012001b0020001e000000000000000000000000000100010000000c",
       INIT_03 => X"0019000b00110000000000000000000000000000000000000000000000030003",
       INIT_04 => X"0000000000000000000000000000000000000000000000000000000400000000",
       INIT_05 => X"0000000000000000000000000001000000000000000000000004001c00000000",
       INIT_06 => X"0000000000000000000000000000000000000000000000000002000000000000",
       INIT_07 => X"0000000000000000000000000000000b000000000000000000000000000b0000",
       INIT_08 => X"000000000000000b000000000000000000000000000000000000000000000000",
       INIT_09 => X"0000000000000000000000080000000000000000000000000000000000000000",
       INIT_0A => X"0000000000000000000000000000000000000000000b00000000000000000000",
       INIT_0B => X"0000000000000000000000000000000000200000000000000000000000000000",
       INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_13 => X"000b000000000000000000000000000000000000000000000000000000000000",
       INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_15 => X"00000000000000000000000000000000000000000000000000000000000d0000",
       INIT_16 => X"0000000000000000000400070000000000000000000000060000000000000000",
       INIT_17 => X"0000000000010000000000000000000000000000000000000000000000000000",
       INIT_18 => X"000000000000000f001a000f003f000a0000000000000032003a003800250020",
       INIT_19 => X"00220029002500270020002c003a00000000001e001d001d00200020001f0024",
       INIT_1A => X"001e0022002800210030002f002f000e000f00210019001d00220023002f0033",
       INIT_1B => X"00340028003a0029003300310041002a0030002a001f0017001c0021002d001a",
       INIT_1C => X"001c002900000000000000000000000000000000000000000000000000000000",
       INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_1E => X"0000000000000000000000000000000000030018000e00060000000000000000",
       INIT_1F => X"000b0000000000000000000200010000001b000000060000000000000000001e",
       INIT_20 => X"0000000000110014000500030000001d00100000000800000003000f00170000",
       INIT_21 => X"0000001a000a000600040000004400030000000b000000020017000b00000000",
       INIT_22 => X"000c001e000b00000000003700000004000a0011000200200014000600000006",
       INIT_23 => X"002d000000000000002000000000001100080000001d00280004001100080000",
       INIT_24 => X"0000000b000b0000001000000006000000000018002400000027000e00090012",
       INIT_25 => X"00120015000000000000000c00000000002b002300000058000d0028002d0011",
       INIT_26 => X"00000000001b0022001f000b0000003600230012004500000007001f0021001a",
       INIT_27 => X"001e00220028002e002f002f002a00380033002500000027002500240024002a",
       INIT_28 => X"002f0036002f002e003a002c002e005200000013002b0026002a002a002f002e",
       INIT_29 => X"002f002a00450028002b0033002c00190019002800230024002e0031002d002e",
       INIT_2A => X"0043003a001f0000000000000000000000000000000000000002000a00000000",
       INIT_2B => X"000000000000000000000000000000000010000800170000001f001c00030000",
       INIT_2C => X"0000002a00000000000000000000002b0011000000000042002d003f00000000",
       INIT_2D => X"0071000000000000000e00000028002c00250000005a0026003b002a0000006c",
       INIT_2E => X"00050023000000340024005d0048003c0000002f0052001e003e000000590031",
       INIT_2F => X"003700000000002c0061003e006000000073005c001200310025004800730015",
       INIT_30 => X"003800000000005a004a006a0000007500470012000c0037004d006500280031",
       INIT_31 => X"00000006008b003800460000004f0050000600250013006800420084000b002a",
       INIT_32 => X"0013002e002c000000290016005b000400000000004a003a009f000000640018",
       INIT_33 => X"0000004d0030003b005a001700000000000c000f003c009400000093004c0020",
       INIT_34 => X"007100830041001a001d002300200031001d002b004e000000d80073003a003c",
       INIT_35 => X"00470038003d003c003e0040004f005f00120000008200af00420049003f003e",
       INIT_36 => X"00390038004000500048003d006a0045000000cb005a0039004d0042003c0041",
       INIT_37 => X"0048004d004e0038007b0076004b003e00540048003500430044003800440055",
       INIT_38 => X"003a001a006f0080000000000008000800060003000500000004000000000000",
       INIT_39 => X"0000000600050007000a000c0007000a0049001a000000000000002400060000",
       INIT_3A => X"0000000400000000000400040007000000000000000d001a0015000700170000",
       INIT_3B => X"00000028002500090005000d00000037001b0005000000000000000000010000",
       INIT_3C => X"0026005a0013000b008000560006000e0000000000250025000f001800000000",
       INIT_3D => X"00000008000000000000002a001a001f003a0000000000000009002700060007",
       INIT_3E => X"00000004000000210000000a000900110000000b00000017001d00150007001c",
       INIT_3F => X"00100019001600000000000000000000000000000000000000100004000b0004",

       -- The next set of INITP_xx are for the parity bits
       INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",

    port map (
       DO => DO,      -- Output data, width defined by READ_WIDTH parameter
       ADDR => ADDR,  -- Input address, width defined by read/write port depth
       CLK => CLK,    -- 1-bit input clock
       DI => DI,      -- Input data port, width defined by WRITE_WIDTH parameter
       EN => EN,      -- 1-bit input RAM enable
       REGCE => REGCE, -- 1-bit input output register enable
       RST => RST,    -- 1-bit input reset
       WE => WE       -- Input write enable, width defined by write port depth
    );


-- End of BRAM_SINGLE_MACRO_inst instantiation
