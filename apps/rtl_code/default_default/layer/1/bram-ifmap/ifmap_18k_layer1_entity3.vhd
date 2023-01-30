-- https://docs.xilinx.com/r/en-US/ug953-vivado-7series-libraries/BRAM_SINGLE_MACRO

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

entity ifmap_18k_layer1_entity3 is
    generic (
        DEVICE: string := "7SERIES"
        );
  
    port (
        RST  : in std_logic;
        CLK  : in std_logic;
        EN   : in std_logic;
        WE   : in std_logic_vector(2-1 downto 0);;
        DI   : in std_logic_vector(16-1 downto 0);
        ADDR : in std_logic_vector(10-1 downto 0);
        DO   : out std_logic_vector(16-1 downto 0)
    );
  end ifmap_18k_layer1_entity3;

  architecture a1 of bram is

    begin

    BRAM_SINGLE_MACRO_inst : BRAM_SINGLE_MACRO
    generic map (
       BRAM_SIZE => "18Kb",             -- Target BRAM, "18Kb" or "36Kb"
       DEVICE => DEVICE,                -- Target Device: "VIRTEX5", "7SERIES", "VIRTEX6, "SPARTAN6"
       DO_REG => 0,                     -- Optional output register (0 or 1)
       INIT => X"000000000000000000",   -- Initial values on output port
       INIT_FILE => "NONE",
       WRITE_WIDTH => INPUT_SIZE, -- 0, -- Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
       READ_WIDTH => INPUT_SIZE, -- 0,  -- Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
       SRVAL => X"000000000000000000",  -- Set/Reset value for port output
       WRITE_MODE => "WRITE_FIRST",     -- "WRITE_FIRST", "READ_FIRST" or "NO_CHANGE"
       -- The following INIT_xx declarations specify the initial contents of the RAM
       INIT_00 => X"001100000000000000000000001e0030003e0000000000000000001c00240001",
       INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000002",
       INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_04 => X"00000000000000000000000000000000000000000000001300000000002f0036",
       INIT_05 => X"00330035003500300039003b0036002b00200020002500280027003000380036",
       INIT_06 => X"003900330042003b003900230002000200060006001100270030001300360039",
       INIT_07 => X"0037003d001e0000000000000004000000010000001700150000003200370040",
       INIT_08 => X"0012001e00000000000000170000000000000000000000120034001000440033",
       INIT_09 => X"0025000600000000001000090000000000000000000f00310038000b000d002b",
       INIT_0A => X"0008000b0000002a00000000000000000000002c0007003d000e0011002e0017",
       INIT_0B => X"0008000300130000000000000000000400190000002500000022002e000a0000",
       INIT_0C => X"0013000f00000000000200000015001100090000001c00000000000c0000002c",
       INIT_0D => X"000000000000000000210016000e00140000000300000000001f000600050000",
       INIT_0E => X"00000000001e00280005001400150000002c0006001100170000000000000000",
       INIT_0F => X"0000000000000000000000000032003c00000000000000000000000000000000",
       INIT_10 => X"00000000000000000000004f0000000000000000000000000000000000000000",
       INIT_11 => X"0000000000000000002800000000000000000000000000000000000000000000",
       INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000027",
       INIT_13 => X"002200230029002c00200028002b002f00320029001d001e0029002e00280024",
       INIT_14 => X"0024002c0021000e00430030002e00050021002900190015002c003f00020028",
       INIT_15 => X"0029002a00200028002400100000001c000c0032001a000b005c0000002e0024",
       INIT_16 => X"0038000c002700250019000000230018001a00260000002c0005004100000013",
       INIT_17 => X"0027002a002400250000001400380012002b001a002400000037002f00000000",
       INIT_18 => X"00160025004300000034002a0007001d002000110024000e0046000000000015",
       INIT_19 => X"001c00390000002b0028000d00000025000b000600290034000200000035000b",
       INIT_1A => X"001800000011002c00000011000d000d0000003f000000340000000e001b0000",
       INIT_1B => X"003f0005002b00000000001a0000000000390000002a00140000001d002c000f",
       INIT_1C => X"002f000f00000010002f000000000038000000290032000000050027002b000f",
       INIT_1D => X"0008000800110021000000000000000000520005000000000000000700030000",
       INIT_1E => X"0000000000030014000000000022002e00000006000200050001000000000002",
       INIT_1F => X"000000000009000000000022000d000000090006000000000001000000000000",
       INIT_20 => X"00150013000000000004001400000000000000000000000c000000000012001a",
       INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",

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
