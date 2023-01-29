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

entity gold_36k_layer2_entity0 is
    generic (
        BRAM_SIZE: string := 36Kb;
        BRAM_SIZE_ADD: integer := 8;
        DEVICE: string := 7SERIES;
        INPUT_SIZE : integer := 8;
        READ_WIDTH : integer := 0
        );
  
    port (reset   : in std_logic;
          clock   : in std_logic;
          chip_en : in std_logic;
          wr_en   : in std_logic;
          data_in : in std_logic_vector(INPUT_SIZE-1 downto 0);
          address : in std_logic_vector(BRAM_SIZE_ADD-1 downto 0);
  
          data_av  : out std_logic;
          data_out : out std_logic_vector(INPUT_SIZE-1 downto 0);
  
          n_read  : out std_logic_vector(31 downto 0);
          n_write : out std_logic_vector(31 downto 0)
          );
  end gold_36k_layer2_entity0;

  architecture a1 of bram is

    begin

    BRAM_SINGLE_MACRO_inst : BRAM_SINGLE_MACRO
    generic map (
       BRAM_SIZE => "18Kb",             -- Target BRAM, "18Kb" or "36Kb"
       DEVICE => "7SERIES",             -- Target Device: "VIRTEX5", "7SERIES", "VIRTEX6, "SPARTAN6"
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
       INIT_24 => X"0000000000000000000000000118006b000000000031000000fe003a007101a4",
       INIT_25 => X"013000b600000000000000000000000000e3000000f300000000000000000000",
       INIT_26 => X"00000000000000000000000000000000000000000000000000000169004d00c7",
       INIT_27 => X"00f500aa002a00000100007800520000000000000000007601c0000000000000",
       INIT_28 => X"00000000000000000000000000000000000000000000000000000000007d0000",
       INIT_29 => X"00000000001100000000000000000074000000c80139000600b9000000000000",
       INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_2B => X"0000000000000000000000000000005c00000000000000000000000000000000",
       INIT_2C => X"000000000000000000450000000000c300eb016c01a101d500d401b401db0149",
       INIT_2D => X"000000000000007c0083005c0000000000000000000000000000000000000000",
       INIT_2E => X"000000000000000000000000000000000079017600d100a000d4004d02030255",
       INIT_2F => X"0218022a027001b6012900000063000000000000000000590000000000000000",
       INIT_30 => X"00000000003d00da000000000000000000a8004a00dd005f014801d600220000",
       INIT_31 => X"0000000000af00000000000e0090018a00000000000000000000000000000000",
       INIT_32 => X"000000000000000000000000000000000000000000f900d4009000420137013d",
       INIT_33 => X"013800b700160000000000000000000000000000000000000000000000000000",
       INIT_34 => X"000000000000000000000145019b00b80115014f01060000002c000000000000",
       INIT_35 => X"0000000000000000000000000000000000000000000000b9016d019d0000029f",
       INIT_36 => X"00000000000000000000000000fb012100fa0000000000000000000000000000",
       INIT_37 => X"0000000000000000000000000000000000d30000000000d00083009f00000000",
       INIT_38 => X"000000000000000000000000000000000000000000000000000000000000003d",
       INIT_39 => X"000f00000000000000000000000000000000000000000000006f003800000000",
       INIT_3A => X"0034003400000000008b00000079007a018e014300a000540000000000000000",
       INIT_3B => X"0000009000e40124009a00a400c20000002800a6000000080000000000000000",
       INIT_3C => X"006f000b000000e400db00ec016e009d005f01d9000000000000000000000000",
       INIT_3D => X"00000000000000000000000000000000000000000000000000000000008b001f",
       INIT_3E => X"001c000000000000003300000000000000000000000000000000000e00000000",
       INIT_3F => X"000000000000000000000000011b0000000000000000000000000000000000c1",

       -- The next set of INIT_xx are valid when configured as 36Kb
       INIT_40 => X"009f009300000000000000000000000000f5000000dc00000000000000000000",
       INIT_41 => X"000000000000000000000000000000000000000000000000000000c500f5006f",
       INIT_42 => X"009e003c00d60000000000210000000000000000000000480260016100d3018f",
       INIT_43 => X"000200c101a300d10079008f01a4002f00000000000000000052005b007100b2",
       INIT_44 => X"0000002d006200b7009600e900dc0000010500080047006f00b001c501ed01db",
       INIT_45 => X"01b602dc01dc00000000000000000000000000fd00c000530000000000000000",
       INIT_46 => X"0000000000000000003700000000000000000000000000000000000001a700c7",
       INIT_47 => X"00c000b3006101040000000000700000004500c7016701c101ac011100e300d2",
       INIT_48 => X"00000031000000000000000000000000000000fe009f004a00000000000000ec",
       INIT_49 => X"00b3002500000000000000000000000000000000000000000000000000000000",
       INIT_4A => X"000000000000000000000000000000000000000000000000000000840000002b",
       INIT_4B => X"00c20104008b00c2009d0074013100e100b900000000000000f100f7010c0000",
       INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_4D => X"0000000000000000000000000000000000000000000000000089000000270061",
       INIT_4E => X"0000000700000000000000000072006b00900000000000000000000000000007",
       INIT_4F => X"0000000000000000001f00000000003000000000000000000000000000000000",
       INIT_50 => X"0003004300000000000000000000018b00de0179003800a000530113010d009d",
       INIT_51 => X"000000000000004e001700d70025000000dc0000000000000000000000000000",
       INIT_52 => X"000000000014002a000d000000000000000000000000009900e5007c00a000df",
       INIT_53 => X"00a600c6007300a000230015000000230000000000000018001a000000000000",
       INIT_54 => X"00000000000000360000008200730057015800180045001e0066009c008c0000",
       INIT_55 => X"00000000000000670000001c0051000000000000000000000000000000000000",
       INIT_56 => X"0000000000000000000000000009000000000000018100cf00d0000000c500d5",
       INIT_57 => X"00b100cf00620000000000000000000000000000000000000000000000000000",
       INIT_58 => X"0000000000000000000000a200b40029009f005800530094006c006a00000000",
       INIT_59 => X"000000000000000000000000000000000050002c007e000000000063000000c0",
       INIT_5A => X"000000000000008500000000000000000022000000000000006700b000180012",
       INIT_5B => X"004900300000000000000000000000000000001d005900380028000000000000",
       INIT_5C => X"001c000000000000000000000000000000000000000000000000000000000000",
       INIT_5D => X"00d6007700710000000b0010000000110000000900000000000000000008001f",
       INIT_5E => X"00000092005300a200830000009000eb005400cc0000000b0000000000000000",
       INIT_5F => X"0000009300db009000b700b700a90032004d0020000c001b0000000000000000",
       INIT_60 => X"00100084000901500123011e000000000030006c00bb00890000000000000018",
       INIT_61 => X"0000004a00000000000000000000000000000000000000000000000000a000a7",
       INIT_62 => X"0051001200670000002800a9009c00000000000000000000000000000000002e",
       INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_64 => X"0000000000000005000000000000000000480000000000000000000000000000",
       INIT_65 => X"0000000000000000000000000000000000000000000000000000007100bc0000",
       INIT_66 => X"00a500c90000005d0025000000000000002f0000000000000075003100490197",
       INIT_67 => X"0091013c005b0047007f001f0042000000410000004e013c000e000000ae006d",
       INIT_68 => X"007d00b40000011600a100010000003e0000000e00fc007d00d900fa00bb0182",
       INIT_69 => X"01020105014d000000000000000000000000003e004f000a0000000000000000",
       INIT_6A => X"000000000000000000000000000000000000001a005c000000000000019f00fc",
       INIT_6B => X"00c200e100940080010600b2007a00eb0107001100a5008e000000f5008e0074",
       INIT_6C => X"00370026000000000000000000a8014c0088000000000000000003050212002c",
       INIT_6D => X"0000006d0000000000750000010100a900000000000000000000000000000000",
       INIT_6E => X"0000000000000000001200c90054000000000000000000000000006a00000000",
       INIT_6F => X"00a001aa016a00000054006100000000000200000000000000a8000000000000",
       INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_71 => X"00000000000000e10026001b00000000009700b400440000002c000000000083",
       INIT_72 => X"0000000000000056004a00240000000000000000000000000000000000000000",
       INIT_73 => X"00000000005f001300000000000a000000440091000a0000004800a300000000",
       INIT_74 => X"000700000000000000000000000000000000000000a9016700ac00bd015501ba",
       INIT_75 => X"000c009a0079008300140002000000a200170000000000000000000000000000",
       INIT_76 => X"00000000000000000000000e0080000a00270000006e0045010700ca000900f9",
       INIT_77 => X"00cd026602bc035e0077004d000000b5005f0119000000000000000000250000",
       INIT_78 => X"0000000000000006011700c50000000000000088005f0000008f013c01250000",
       INIT_79 => X"0000000000420000001f00ff008a00b800000000000000000000000000000000",
       INIT_7A => X"0000000000a4006b000000000000000000000000009f0060009a00d900340028",
       INIT_7B => X"0168016401780000000000000000000000000000000000000000000000000000",
       INIT_7C => X"0000000000000000000000c9011b0115004000770173007e000c002300000000",
       INIT_7D => X"0000000000000000000000000000000000be00a20000000000000137021c028e",
       INIT_7E => X"0000003e004900000000000000000073008a0093005a005300ff000000000000",
       INIT_7F => X"00000000000000000000000000000000000000000000008100a701810043005b",

       -- The next set of INITP_xx are for the parity bits
       INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",

       -- The next set of INIT_xx are valid when configured as 36Kb
       INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
       INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000")
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
