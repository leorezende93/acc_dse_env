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

entity ifmap_36k_layer0_entity3 is
    generic (
        DEVICE: string := "7SERIES"
        );

    port (
        RST  : in std_logic;
        CLK  : in std_logic;
        EN   : in std_logic;
        WE   : in std_logic_vector(2-1 downto 0);;
        DI   : in std_logic_vector(16-1 downto 0);
        ADDR : in std_logic_vector(11-1 downto 0);
        DO   : out std_logic_vector(16-1 downto 0)
    );
 end ifmap_36k_layer0_entity3;

  architecture a1 of bram is

    begin

    BRAM_SINGLE_MACRO_inst : BRAM_SINGLE_MACRO
    generic map (
       BRAM_SIZE => "36Kb",             -- Target BRAM, "18Kb" or "36Kb"
       DEVICE => DEVICE,                -- Target Device: "VIRTEX5", "7SERIES", "VIRTEX6, "SPARTAN6"
       DO_REG => 0,                     -- Optional output register (0 or 1)
       INIT => X"000000000000000000",   -- Initial values on output port
       INIT_FILE => "NONE",
       WRITE_WIDTH => INPUT_SIZE, -- 0, -- Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
       READ_WIDTH => INPUT_SIZE, -- 0,  -- Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
       SRVAL => X"000000000000000000",  -- Set/Reset value for port output
       WRITE_MODE => "WRITE_FIRST",     -- "WRITE_FIRST", "READ_FIRST" or "NO_CHANGE"
       -- The following INIT_xx declarations specify the initial contents of the RAM
       INIT_00 => X"009e009e008b008400a600b600bb00c100c700cd00d100ce00da00df00e300e6",
       INIT_01 => X"00d500e200e700eb00ec00e800ea00ea00ec00e200e600ee00e800e400ed00ee",
       INIT_02 => X"00aa00ac0097008900ae00c100c500c700ce00d700d900d200e100e700e900ed",
       INIT_03 => X"00db00e400e800f200f500ea00ec00f200f100e400eb00f300e900e800f600f6",
       INIT_04 => X"00ae00b0009d008e00b500c900ce00c700d100df00da00d400e000e600e600ef",
       INIT_05 => X"00dd00e400e900ef00e800d500ec00f300f500e700ee00f800ed00e600fa00f5",
       INIT_06 => X"00b400b200a0009300ba00cb00d400cf00d600e400dd00d600dc00e700df00f0",
       INIT_07 => X"00e000e400e900e400b100ac00e600f300f800e800ee00fa00ee00e400f900f4",
       INIT_08 => X"00ba00b900a5009300bd00cc00d900cf00d300e700de00d600da00e700d300eb",
       INIT_09 => X"00e200e000e800d4009f00a800e000ed00f700e700eb00f600e800ea00f800f2",
       INIT_0A => X"00c100be00aa008e00bf00cb00db00d300d700ea00dd00d600d600e400c700cd",
       INIT_0B => X"00cf00ce00eb00c10070009e00de00e600f500e500e200f100e400e700f300eb",
       INIT_0C => X"00c400bf00ac008500bf00ca00de00d900df00eb00da00d600d700e300bc00b0",
       INIT_0D => X"00bb00ba00cd00bb0078008900ac00b700db00df00d800eb00e200e100f000eb",
       INIT_0E => X"00cc00c500ae008c00cb00da00e000e000e800ed00dc00dc00dc00dd00c900cd",
       INIT_0F => X"00ac008a006400530047003e0041003c006800b600d100e400da00d400ef00ec",
       INIT_10 => X"00af00aa009d008900b000ba00af00c500d100d400ce00d200d400c900c100c1",
       INIT_11 => X"008e00690059005b00540053005e0045004e007900a200b700ae00a300cf00c3",
       INIT_12 => X"00720073007100680069006b006f0080008b00920097009b009d009300970096",
       INIT_13 => X"00760064006300630055005600560053008b0080009a00990076006d0084007b",
       INIT_14 => X"0042004c004b00440053005a0054005a005d006a00660067006a006b0072006c",
       INIT_15 => X"005a005a005b005500480042005f00720080006e009300c7007d0067005c005e",
       INIT_16 => X"00350041004b004d006f006a00550046005d0071005f005d006c0073006b0061",
       INIT_17 => X"0062005f00620061005a0055009500bb00b30092007000cc009a005f00570055",
       INIT_18 => X"003a0056005e004a00640064004d005500780085007f006c0069006e00620057",
       INIT_19 => X"005100510057005f005f007000aa00c300d000c1007f00ad00b200500055004f",
       INIT_1A => X"004a00590057004b0052004400470050005900670076006f0065006a00690062",
       INIT_1B => X"006000620062006d0072008e00b400b800bf00c000a0008400aa0050003c0043",
       INIT_1C => X"004d004f0052004e004f004800460056006d0079008100850089008800870083",
       INIT_1D => X"0092009400920096009400a300b300b500b900b000aa0065005a00490037003b",
       INIT_1E => X"0060005e006a0068006d00830084008a00900098009b009a009b009b009e0094",
       INIT_1F => X"0096009d009c009200770082009200a900b100a800a700690045006200560048",
       INIT_20 => X"006a006500730083008100870090008f00920096009a009a009a009900970090",
       INIT_21 => X"00820086008b007f005e00750092009f00a700a300a20084009000c0009a0069",
       INIT_22 => X"005f006c0076006d005f005d0081009100950097009600900086007e007a007b",
       INIT_23 => X"007a0085009b00940083009300a2009c009d009700990095009f00a4009d0094",
       INIT_24 => X"00660059004900460056006f007b008c008f0081007800750078007e0085008d",
       INIT_25 => X"0096008e0099009f0097009d00a500a100990098009a009000830079007d0095",
       INIT_26 => X"0056003d0047006e0080008a0082007b0076006c00760084008f0098009c0099",
       INIT_27 => X"009500890091009a0099009a00a000a400980090007d0069005c004b00560084",
       INIT_28 => X"00680067006b007200730074007b007600740086008d0090008f008d00850075",
       INIT_29 => X"00620059008200960097009a0098009100750060005a00500041004700490041",
       INIT_2A => X"0063006b006f006f00720077007d007e0075007d007d008100830082005b003d",
       INIT_2B => X"0039003800730094008b00820072005f005600530049003a003c004b0033001b",
       INIT_2C => X"003e006800740072007400750066005b00540051004e0070008500820060004c",
       INIT_2D => X"00530056006b006c00600058005300510046003d0033002d0034002e001e0018",
       INIT_2E => X"00390060006a0069006b006800410035003b00400044006e0087008500730062",
       INIT_2F => X"0058004f004e00500051005000460037002c0031002d00290022001e001b0018",
       INIT_30 => X"0041005a00680069006d006d004f0049005500580062006a0062005300440041",
       INIT_31 => X"0046004a00510052004800330029002c003d0037002700230020001e001b0019",
       INIT_32 => X"00430057006900670066006300580051004c0045003b0039003a003f00420046",
       INIT_33 => X"00480044003e0036002e002f0031002c0038002e001e001c001d00190018001e",
       INIT_34 => X"0036003a0041003a00370032002d002c002e00330037003a003e0040003e003a",
       INIT_35 => X"003300260025003000310030002a002600290020001b001c001b0019001c001f",
       INIT_36 => X"001e001d001a001b001f0020002100270031003400350033002e002800260028",
       INIT_37 => X"0026002c004200370029002500240025001f001b001a001b001c001e00210017",
       INIT_38 => X"0021001f001b001c001c001e001f002000230021001e001e002200270029002d",
       INIT_39 => X"002a003400490031001e002300260020001b001a001b001d001e0026001a000d",
       INIT_3A => X"001f001e001a001a00190019001a001b001d002000250028002a00290028002a",
       INIT_3B => X"0027002e00400026001c0024001e001d001a0019001b001c0021002500090004",
       INIT_3C => X"0017001b0019001c001e002000220025002700270028002700260023001e0021",
       INIT_3D => X"001c002400390024001e001d001d001d001800180017001b0024001300040005",
       INIT_3E => X"001c001e0020002200210022002300250026002600240022001e0018000f000c",
       INIT_3F => X"00080013002d00200019001b001b001c00180015001400220019000500040007",

       -- The next set of INIT_xx are valid when configured as 36Kb
       INIT_40 => X"00be00bb00a6009e00c100d000d300d800db00dd00de00da00e500e800eb00ed",
       INIT_41 => X"00dc00e900ee00ef00f100ef00f100f100f200e700eb00f300ed00e700ef00f1",
       INIT_42 => X"00c800c700b000a000c700d900da00da00df00e500e500db00e900ee00ef00f3",
       INIT_43 => X"00e100ea00ee00f500f700ed00ef00f500f500e900ef00f800ec00e800f600f7",
       INIT_44 => X"00c900c800b300a200c900dc00df00d600dd00e900e200db00e500ea00ea00f4",
       INIT_45 => X"00e200e900ee00f300eb00d600ea00f100f700e900f000fa00ee00e500f900f4",
       INIT_46 => X"00cb00c700b300a400c900d900e100d900df00eb00e300d900dd00e800e200f4",
       INIT_47 => X"00e400e700ed00eb00b800af00e400f100f800e800ee00fa00ed00e300f700f2",
       INIT_48 => X"00cf00cc00b500a100c900d600e100d500d700ed00e200d700d900e500d400ec",
       INIT_49 => X"00e300e100ec00e100aa00ae00e000ec00f700e700eb00f600e700e700f500ef",
       INIT_4A => X"00d000cd00b7009a00c900d400e200d700da00ee00df00d700d700e500c700cd",
       INIT_4B => X"00d100d000ef00cc007c00a700e300e900f600e500e100ef00e200e600f100e8",
       INIT_4C => X"00cc00c700b3008b00c200cb00dd00d500db00e900d800d400d800e600bc00b0",
       INIT_4D => X"00be00c000d400c00081009700b700be00e000e000d600e500db00de00eb00e0",
       INIT_4E => X"00cd00c600af008a00c000cb00ce00cc00d400df00d000d200d500d800c700ce",
       INIT_4F => X"00b200950071005d0055005000500045006c00b700ce00de00d000c500dd00d4",
       INIT_50 => X"00ad00a8009a008500a500ac00a000b300be00c200bd00c300c700bf00c100c6",
       INIT_51 => X"00980079006b006c00680068006e004f0052007a009f00af00a3009500be00af",
       INIT_52 => X"0073007400720069006d006e0070007f00870088008c00930097008f009e00a1",
       INIT_53 => X"0086007700780078006c006c0066005c008f008000970091006e006a00820078",
       INIT_54 => X"004e00570056005200630069006100640065006d006a006f007200760084007f",
       INIT_55 => X"006d006d006e006b00600057006c00770084006f009000bf0078006f00660068",
       INIT_56 => X"004a0055005f00620080007a0062005100680081007100730084008b0086007b",
       INIT_57 => X"007800730074007700710068009e00bd00b70094006d00c50095006700630063",
       INIT_58 => X"0051006b0071005d00750073005d0066008900980095008300820088007d0071",
       INIT_59 => X"006c006c0072007b0076007f00af00c200ce00bd007600a200a7005000620065",
       INIT_5A => X"0061006e006a005d0062005400590064006e007b008a0086007e00830082007c",
       INIT_5B => X"007b007f007e00870086009900b500b400b800b70097007a00a0004d00480059",
       INIT_5C => X"0066006500660061005f00580058006b0082008e0097009e00a300a400a1009d",
       INIT_5D => X"00ab00ad00aa00a900a200a900b100ae00b000a800a4006200570046003f004b",
       INIT_5E => X"007b0076007f007c007e0094009800a000a700af00b300b400b700b800b900ae",
       INIT_5F => X"00ad00b200af00a000800085008e00a100a900a200a6006c0046005f00590052",
       INIT_60 => X"0085007d008a00980094009a00a600a700aa00ae00b300b600b900b900b500ab",
       INIT_61 => X"00980098009a008b006600780090009b00a500a200a30088009100bb0099006c",
       INIT_62 => X"007c0085008d008300740072009800aa00af00af00b000ad00a700a0009a0097",
       INIT_63 => X"0090009600a800a0008c009800a5009e00a3009b009c0097009e009e00980093",
       INIT_64 => X"008100710060005d006e0087009400a400a9009f0096009200940099009f00a5",
       INIT_65 => X"00aa00a000a800ac00a100a400a800a400a0009e009e009200840079007d0096",
       INIT_66 => X"0070005500600087009b00a5009c0093008e008d009700a000a700ad00ae00ab",
       INIT_67 => X"00a7009b00a200a800a300a100a300a6009e00970082006f00620052005c008a",
       INIT_68 => X"008500840087008f008f008f0096008e008a00a100a900ab00a900a500970086",
       INIT_69 => X"0074006b009400a400a300a3009f00980080006c0066005b004b004e00500048",
       INIT_6A => X"0084008c0090008f0090009300970096008b00920094009a009f009c006e004e",
       INIT_6B => X"004b004a008400a30099008f007e006d00670064005a004c004b005200390021",
       INIT_6C => X"005e0089009400920092009100810073006a006600630087009d009a0072005d",
       INIT_6D => X"00650068007d007c0071006a006600650058004f0045003f004300350025001f",
       INIT_6E => X"0056007d0086008600890085005c004d00520059005c00830099009600840073",
       INIT_6F => X"006a00610060006100630065005f004f003c0040003c0039002f00260022001f",
       INIT_70 => X"005a0074008100830089008a006a0061006c0074007c007e0071005f00540053",
       INIT_71 => X"0059005c00620064005c004a00430045004a00420033002e002b002600230020",
       INIT_72 => X"005c00700082007f007c0078006e00660061005a0050004c004b00500054005b",
       INIT_73 => X"005f005900510049004100410043003d0045003a002a0028002a002800230025",
       INIT_74 => X"004c004f0056004e004a00450040003f00410046004a004d0051005200510050",
       INIT_75 => X"0049003b003700440043003f003600320036002d002800280029002800270025",
       INIT_76 => X"002d002b0028002a003100340035003a00440047004800460041003b003a003b",
       INIT_77 => X"0038003f0055004900390033002f002f002c0028002700280029002a002a001d",
       INIT_78 => X"002b002800240026002c00300031003200350034003100310035003b003e003d",
       INIT_79 => X"00370045005e0042002c002e002f0028002700270028002a0029002e00200012",
       INIT_7A => X"0028002700230024002700290029002b002e00330038003a003d003d003c0037",
       INIT_7B => X"002e003c005500360028002e00250024002600260028002a002b0028000d0007",
       INIT_7C => X"0022002600240028002c002f0031003300360039003b0039003900370033002b",
       INIT_7D => X"001f0030004e003200290025002300230025002500240029002d001400060007",
       INIT_7E => X"0029002b002d002f0030003000300031003200330031002d00280022001a0011",
       INIT_7F => X"0008001b003f002c0021002200220023002300220022002c001f000600050008",

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
