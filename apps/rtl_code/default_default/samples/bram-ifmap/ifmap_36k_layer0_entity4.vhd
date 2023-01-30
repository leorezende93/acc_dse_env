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

entity ifmap_36k_layer0_entity4 is
    generic (
        DEVICE: string := "7SERIES"
        );
  
    port (reset   : in std_logic;
          clock   : in std_logic;
          chip_en : in std_logic;
          wr_en   : in std_logic;
          data_in : in std_logic_vector(INPUT_SIZE-1 downto 0);
          address : in std_logic_vector(11-1 downto 0);
  
          data_av  : out std_logic;
          data_out : out std_logic_vector(INPUT_SIZE-1 downto 0);
  
          n_read  : out std_logic_vector(31 downto 0);
          n_write : out std_logic_vector(31 downto 0)
          );
  end ifmap_36k_layer0_entity4;

  architecture a1 of bram is

    begin

    BRAM_SINGLE_MACRO_inst : BRAM_SINGLE_MACRO
    generic map (
       BRAM_SIZE => "36Kb",             -- Target BRAM, "18Kb" or "36Kb"
       DEVICE => DEVICE,             -- Target Device: "VIRTEX5", "7SERIES", "VIRTEX6, "SPARTAN6"
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

       -- The next set of INIT_xx are valid when configured as 36Kb
       INIT_40 => X"009b00a700b000be00b100a600a800a600aa00b300bb00bb00bb00bb00b800b8",
       INIT_41 => X"00b600b400b800ba00bb00bb00bc00bd00bb00bb00bc00c300c900c900ca00c0",
       INIT_42 => X"009900a300ab00bb00b3009b009a009f009f00a500ab00af00a900ab00a200a5",
       INIT_43 => X"00aa00a400a600a500a700ad00a900a800a900ad00be00ca00cc00ca00cb00bd",
       INIT_44 => X"009b00a000a800b800bb00ae00b000bc00b600b300b100be00c000c200bc00b9",
       INIT_45 => X"00c100c200c100c200c300c500c100bf00bf00c500ce00cf00d000ce00cc00bd",
       INIT_46 => X"0097009d00a600b100b400b900c700c500b600cc00cd00c600d200c500c400cb",
       INIT_47 => X"00cd00cf00d200cb00cf00d200c500cc00d000c600cc00c900d100cf00ce00c0",
       INIT_48 => X"0097009e00a800ae00b100b500bf00c400b700c200bd00b900c400b900b900ca",
       INIT_49 => X"00c700c700c800c000c300c700be00bc00c900c700c900c400ce00cc00cf00c4",
       INIT_4A => X"0094009c00a700ae00ab00ae00c400c300c000be00bd00b800bb00bd00bd00bf",
       INIT_4B => X"00be00c300bb00c600c000bc00c000c100cd00ce00cb00d100d400d000d100c4",
       INIT_4C => X"0094009900a500ae00a800b000cb00c300bc00bc00bb00be00b600c200c500c3",
       INIT_4D => X"00c400c100c800cd00c600c500c500c900c500c800c600c300c500cb00cf00c3",
       INIT_4E => X"0099009b00a300ac00ac00bc00c700d100c400be00bd00bf00c100bc00bb00c4",
       INIT_4F => X"00ca00c200c400ce00c200c900c400c800b500bb00c800c900c800c400c700bd",
       INIT_50 => X"00a0009f00a300ac00ae00b000b000be00b400af00b000b000b500aa00ac00b6",
       INIT_51 => X"00bb00b200b500bb00b100bc00b400bb00c700c400bc00bc00c500c000c200b8",
       INIT_52 => X"00ab00a700a200ac00aa00ab00b400b0009b009c0096009c009600920099009e",
       INIT_53 => X"00a600a600a4009d009d00a2009c00a600c800c700bc00bd00c500c100c200b6",
       INIT_54 => X"00af00b400a800b000ad00b100b600ae009c00a0009f009a009f00a300a800ad",
       INIT_55 => X"00aa00a400a000a200a000a800a700ac00c200c300c400c400c500bf00c100b7",
       INIT_56 => X"00b500bb00b200bb00b700aa00ae00b600b300b300b400b500b800bb00c100c1",
       INIT_57 => X"00c100c000bc00b900b800ba00c000c000bb00bc00c000bd00be00bf00c400ba",
       INIT_58 => X"00b900be00ba00ab00990084009500c100c600bf00ba00bc00bf00c100c300c4",
       INIT_59 => X"00c300c000be00bc00bc00be00c000bf00bf00c100c300c500ca00ca00cc00c1",
       INIT_5A => X"00ba00c200bc009e00840074005e006d009100b100c200c200bf00c100c400c7",
       INIT_5B => X"00c700c700c800c600c400c400c700c600c500c400c400c400c600c500c600b9",
       INIT_5C => X"00ba00c500c400c600c200b8008d005c00540068008e00b300c300c900cc00cc",
       INIT_5D => X"00cc00cc00cc00c700c200c200c200bf00bd00be00be00be00bf00be00c000b5",
       INIT_5E => X"00b800c700c600c800c500c800c900b100750054005d008000ad00ca00d000cd",
       INIT_5F => X"00ca00c800c700c700c300c400c500c300c100c300c200bf00bf00bd00be00b2",
       INIT_60 => X"00b900c900cb00d000cd00ce00d000d600af005c004c005b0069008c00b500cb",
       INIT_61 => X"00ce00ca00c500c200c100c200c200c200c200c300c100bf00c100be00be00b4",
       INIT_62 => X"00bb00cc00cf00d600d400d400d300d000cb007c004700570054005400630084",
       INIT_63 => X"00a700be00cb00cb00c300c000c500c400c200c200c000bf00c100bf00c000b7",
       INIT_64 => X"00be00cf00cf00d600d400d300d300d000d30089004800570053005400560053",
       INIT_65 => X"0059006b0083009b00a300b600cb00cc00ca00c600c200bf00c100c000bf00b6",
       INIT_66 => X"00bf00d200d100d700d500d400d400d500cc0071002f003a003f004c0057005d",
       INIT_67 => X"005a00500046003e003a004d007a009f00b400c200c900c800c800c400c400b9",
       INIT_68 => X"00bf00d000cf00d300d100d200d100d4009d00650041002500330044004a0058",
       INIT_69 => X"005b0056005500490037002e003e0048004e006b0085009e00b800c300c400ba",
       INIT_6A => X"00ba00ca00cb00d100cf00ce00d100c80095008c00970064002d003500320060",
       INIT_6B => X"009c00a00080004800620070005900420043008300a600a300ad00b700bc00b2",
       INIT_6C => X"00b900c900ca00d200d200d000d100d100d200d300d700bd00900092009400a8",
       INIT_6D => X"00ca00ce00c0009a00a300b200b1009f009c00b200bf00c200c400c100bc00b0",
       INIT_6E => X"00b000bc00c000c400c000bc00b900b700b600b200b300ad00aa00aa00ab00ad",
       INIT_6F => X"00a900a000a100a700a500a100a500aa00aa00a000980096009d00a300a4009c",
       INIT_70 => X"00720063006e006b00660061005e005d0058005500580050004d004e00530065",
       INIT_71 => X"0071006c006a006b006c006e006f0071007500770078007700780079007a007c",
       INIT_72 => X"007a006d007100750073007000720071006f0070006f006d006e006d006e006c",
       INIT_73 => X"007300700069006b006c006a00650068006a006b006d006d00670066005e0065",
       INIT_74 => X"00780061006b0070006d00680062005e005e005d005800560052004f0050004e",
       INIT_75 => X"0050004f00480045004300420041004100400041004200400043003f0035004d",
       INIT_76 => X"005b00370041004500420042003f003d00420040003c00390039003c003d003f",
       INIT_77 => X"003f00420040003a00380039003b003c003a00390038003900340031004b005c",
       INIT_78 => X"005d003c00420044004300430040004100450041003e003b003b003b003c003d",
       INIT_79 => X"0040003f003a003800370037003800380039003a003800350041005d00610051",
       INIT_7A => X"00590039003d00390039003b0039003b003c003a00380036003c003d003b003d",
       INIT_7B => X"0041003d003a0039003c003c003d003d0042003e0039004600610059003b0043",
       INIT_7C => X"0059003c003f003e003e003e003e003f003e003d0041005200540051004e0051",
       INIT_7D => X"005800540055005300500043004200400034003800560067004c0039003d004b",
       INIT_7E => X"005c003c003d003c003f00420043004100420043004100480049004900480046",
       INIT_7F => X"0049004a004b004b004b00400040003e00410056005800400039003c00400049",

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
