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

entity gold_18k_layer2_entity0 is
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
  end gold_18k_layer2_entity0;

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
       INIT_00 => X"00a0001200400104005100bc01010000000000470000001c0000000000ba0000",
       INIT_01 => X"0000000000000031000000000092000000000000000000000000000000000000",
       INIT_02 => X"000000000000000001040000000000020000000000000000000000a800000038",
       INIT_03 => X"0000000000000000000000020000000000000000000000000000005300370000",
       INIT_04 => X"0000000000000000000000000000000000000000000f00000000000000000000",
       INIT_05 => X"000000a8017a013400370113008200b7003500000000002d00790000014d0062",
       INIT_06 => X"00000000000000000000007e001000350000006a000000d10000000000000000",
       INIT_07 => X"00b000b0000000a00033007700d2008100c600000000000800a9005700000065",
       INIT_08 => X"00c8000000a1003c00000058007a00000000000000060000005c000000000000",
       INIT_09 => X"0000002c00e6000000770048000000ff00240000000000190000003600000000",
       INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_0B => X"00000000005d004d00b5006c00aa00000000000000000000003f0000001b0030",
       INIT_0C => X"0015000000000000011900b300000012000000aa000000bd00b6002600000000",
       INIT_0D => X"0028000000000000000000000000000000000000000000000000000000000000",
       INIT_0E => X"000000c001240144014f00d00068001700000040000000000009005700160000",
       INIT_0F => X"00cf005d00000000000000000000000000000000000000000000000000000000",
       INIT_10 => X"0000000000000000000000a8000100b8001e0028009600900015006300000000",
       INIT_11 => X"00000000000000000000000000000000000000000000000000000000011b009e",
       INIT_12 => X"00000000006c0000000000000000007900f80043000400ff0067001200110000",
       INIT_13 => X"0000001c00000069004100000086004e0031000000000091006c005100170026",
       INIT_14 => X"0046000000b000fd00e0000000780000001000000000000000000000005900ab",
       INIT_15 => X"00c100fb00ef006a008f00db003b00530014001000000000007b004600ab0062",
       INIT_16 => X"005a013c00a2006d008c007a01230051009700a10000000000000000003c0000",
       INIT_17 => X"000700000000000000000000000001040000000000000000001e004f00a2012f",
       INIT_18 => X"008c00000000015b013a0161008300a1007201380012000000000088007000dc",
       INIT_19 => X"00e000ad013e00cd00ae00000000000000000000000000000000000000c8001f",
       INIT_1A => X"00bf0046004b004e001b00260000001e0073013b009f0036001e000600aa00a5",
       INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_1D => X"0000000000000000006a0043007601010066007c000000000000000000000000",
       INIT_1E => X"000000000000000000000000000000590069000000310000000000000000003d",
       INIT_1F => X"0000000000100031007200ed000000000000000000000000000000000070012c",
       INIT_20 => X"017f00d0000000000000000000320000006700080039002100de006d00440076",
       INIT_21 => X"0084014100eb00000000000000000000000000000000000000b20078006e003f",
       INIT_22 => X"007f009200000000000000000000001c01910000001e00340087014800000000",
       INIT_23 => X"0000000000000000000000000058004a0046000000000000000000f300d700c5",
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
