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

entity ifmap_18k_layer0_entity8 is
    generic (
        BRAM_SIZE: string := 18Kb;
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
  end ifmap_18k_layer0_entity8;

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
       INIT_00 => X"00de00da00c200ba00de00ec00ee00f100f300f500f400eb00f000f100f200f5",
       INIT_01 => X"00e300f000f500f800f900f300f300f300f500eb00ef00f700f100ea00f300f6",
       INIT_02 => X"00e500e200c900b800df00f000f000ee00f300f700f500e800f300f500f500f8",
       INIT_03 => X"00e600ef00f300fb00fb00ee00ee00f400f800ec00f300fc00f000ec00fa00fb",
       INIT_04 => X"00e100de00c700b500db00ee00ef00e400eb00f400ec00e400eb00ef00ee00f7",
       INIT_05 => X"00e500ec00f100f600ec00d700e800ef00f800eb00f200fc00f100e800fb00f7",
       INIT_06 => X"00de00d800c200b300d600e400eb00e100e500ef00e600dd00e100ec00e600f7",
       INIT_07 => X"00e600ea00f000ee00ba00b000e500f100f800e900ef00fb00ee00e400f800f3",
       INIT_08 => X"00df00d900c100ac00d200dd00e700d900da00eb00e100d700db00e800d600ee",
       INIT_09 => X"00e500e300ee00e400b000b200e500ef00f700e700ea00f500e700e800f600f0",
       INIT_0A => X"00dc00d500bf00a400ce00d500e100d500d600e600da00d600d600e300c800ce",
       INIT_0B => X"00d000ce00ed00cf008200ad00e600e900f400e100db00e800dd00e700f200e6",
       INIT_0C => X"00d400ca00b9009600c400c900d900d000d300db00d000d300d400dd00b900af",
       INIT_0D => X"00bb00bd00d200c50089009d00b800bb00dd00dc00ce00da00d100db00e700d8",
       INIT_0E => X"00d300c900b3009300c500cc00ce00cb00d000d200c600cd00ce00ce00c000cb",
       INIT_0F => X"00b3009b007a006a0064005e00580049006f00b700ca00d700c600b900ce00c1",
       INIT_10 => X"00b300ad00a0008c00aa00af00a100b300bb00b800b400bd00c300b900ba00c4",
       INIT_11 => X"009f008900800080007e007e0080005a0058007c009e00ac009c008900b0009f",
       INIT_12 => X"007b007e007b0070007200720072008000860086008900900098009200a000a7",
       INIT_13 => X"0093008b0090008c0082008300780068009500830096008d006a006900800075",
       INIT_14 => X"0059006600620058006b00730068006a006b007600710073007b008600970092",
       INIT_15 => X"0080007f007f0078006f0068007a00800086006e008b00b600720075006d0070",
       INIT_16 => X"00580068006e006a008e00890071005e00740092007f007d009400a500a50097",
       INIT_17 => X"008e0082007f007f007b007200a500bf00b4008e006400b8008c006d006c006c",
       INIT_18 => X"006400820084006800810082006d0076009a00ab00a80097009b00a5009a008b",
       INIT_19 => X"0082007d0081008c0086008900b300c100cb00b90070009800a000540069006d",
       INIT_1A => X"00780086007e006a00710065006c00790083009100a1009f009900a1009e0095",
       INIT_1B => X"009200930091009b009600a100b600b100b500b500940076009d0050004e0060",
       INIT_1C => X"007f0080007d00720074007100730086009f00a800b000b800be00bf00be00b9",
       INIT_1D => X"00c500c400be00b800ac00ad00af00a800ab00a500a300630057004700430051",
       INIT_1E => X"00970095009a0091009900b300b800c100c900cd00cf00d000d100d200d400c8",
       INIT_1F => X"00c600c900c300ab00860087008b009b00a500a100a800710049005c005a0056",
       INIT_20 => X"00a5009f00a700b000af00b900c600c900cd00d000d200d200d200d000c900be",
       INIT_21 => X"00aa00aa00a90094006c007a008e009900a700a500a7008e009300b50098006f",
       INIT_22 => X"009d00aa00ae009d008d008f00b600ca00d000d300d100ca00bf00b500a700a2",
       INIT_23 => X"009b00a000b200a90093009d00a700a000a900a200a1009c009e009600960094",
       INIT_24 => X"00a2009400800079008a00a400b100c200c700bc00b200ab00aa00ac00ac00b0",
       INIT_25 => X"00b400a800b000b500aa00ad00af00ac00a800a500a3009600850076007d0099",
       INIT_26 => X"008f0075007f00a600bc00c500ba00b000a900a300ab00b200b900be00bf00ba",
       INIT_27 => X"00b400a500ac00b100ad00ac00af00b200a4009c008800740067005700620090",
       INIT_28 => X"00a600a500a800b000b000ae00b300aa00a400b800be00bd00b900b500a80096",
       INIT_29 => X"00810076009d00ad00ad00ad00ab00a200850070006a005f005000540056004e",
       INIT_2A => X"00a500ac00b100af00ae00b000b300b000a400ab00ab00ad00af00ab007e005e",
       INIT_2B => X"00580055008e00ac00a2009800880075006c0068005e0050004f0058003f0027",
       INIT_2C => X"007c00a600b200af00af00ad009a008b0082007e007a009a00ae00a90083006c",
       INIT_2D => X"007200720086008500790071006d006c005f0056004b00450049003b002b0026",
       INIT_2E => X"006f009600a0009f00a3009e00740064006800700073009700ac00a800950083",
       INIT_2F => X"0077006b006a006a006a006c0064005400450049004400410037002c00280025",
       INIT_30 => X"0071008a0097009a00a100a20080007700810088009000920084007200650062",
       INIT_31 => X"00650067006d006c006300500048004b0055004d003d003a0034002d00290027",
       INIT_32 => X"00740088009a00970094008f0084007c00760067005b00570056005b00630065",
       INIT_33 => X"00650063005e005200480048004a0045004e00440034003200330030002f0030",
       INIT_34 => X"00600064006a0063005c0056005200510052004f005100540057005b005e0058",
       INIT_35 => X"004d00440044004c004a00480040003b003f0036003100320031003000340030",
       INIT_36 => X"003b003900360037003c003d003e0044004e004f004f004d0048004400450042",
       INIT_37 => X"003d0047006100520041003c0038003900350031003000310032003200320023",
       INIT_38 => X"00320030002c002d0031003500350037003a003b00380038003c004200470044",
       INIT_39 => X"003b004b0068004b00350038003a003300310030003100330032003500250014",
       INIT_3A => X"002d002c00280029002c002e002e003000330039003f0041004400440044003d",
       INIT_3B => X"00320042005d003f003100380030002f002f002f003100330034002e000e0005",
       INIT_3C => X"0027002b0029002d003200360038003b003e0040004200400040003d003a0031",
       INIT_3D => X"002400350055003b00320030002f002f002e002e002d00320036001800030003",
       INIT_3E => X"002f003200340036003800380038003a003a003700350032002d0027001e0014",
       INIT_3F => X"000b002100480036002c002d002d002e002c002c002b00340025000800030007",

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
