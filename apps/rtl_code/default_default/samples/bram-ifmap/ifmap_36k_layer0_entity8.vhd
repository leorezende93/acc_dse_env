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

entity ifmap_36k_layer0_entity8 is
    generic (
        DEVICE: string := "7SERIES"
        );

    port (
        RST  : in std_logic;
        CLK  : in std_logic;
        EN   : in std_logic;
        WE   : in std_logic_vector(2-1 downto 0);;
        DI   : in std_logic_vector(INPUT_SIZE-1 downto 0);
        ADDR : in std_logic_vector(11-1 downto 0);
        DO   : out std_logic_vector(INPUT_SIZE-1 downto 0)
    );
 end ifmap_36k_layer0_entity8;

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
       INIT_00 => X"007600600031003b0060005f00540053005f00610053005a005c0052004b004f",
       INIT_01 => X"005b0050003b00320037003800380033003c00380033003a004c0035002f002f",
       INIT_02 => X"0082005800590069006c0060005d006800650062005a005b00540057004f0048",
       INIT_03 => X"00520048003d00320037003800370033002b002800350041004b003d003a0039",
       INIT_04 => X"008400680081007a006c0059005f006a006200690062005e00550050004f004c",
       INIT_05 => X"0055004c0036002a0033003a003f0042003c0042004300420043003e00380039",
       INIT_06 => X"0081007f008800840070005a0068006900650071006500660067005a0057005d",
       INIT_07 => X"004f004e0033001f002a00330039003e0046004d004b004a003c003700430045",
       INIT_08 => X"0080007f0079007f006d006300720072006f006f00700071006c00630059005c",
       INIT_09 => X"005e0059004e002c002700340038002e00350043004700490042003b00450047",
       INIT_0A => X"008900830068007f0076006a007100740073007500740071006d0069005a0054",
       INIT_0B => X"006a00680067004f003a004d0052003d003e003f00430046004900480046004b",
       INIT_0C => X"0098007700660087007a00750073006f0079007b007c0070007300710066005c",
       INIT_0D => X"00640065006d006e005c0057005b0043003e00400038003b00450048004a004e",
       INIT_0E => X"009300590078007e00780076007200790080007a007c00730073006d006c0064",
       INIT_0F => X"00650068006d006a0066004b00570048003b003c002e0035004200440049004b",
       INIT_10 => X"0076006f0078007200770074007500770080007a006f006d007300670061005e",
       INIT_11 => X"005e005900610064006d005f00720059003e003a00400047004600480048004b",
       INIT_12 => X"0077007100690078007c007a007b006f0076007b007d00790076006d0065006f",
       INIT_13 => X"0069005500520060006a0064007a0067003d003e004700490047004b0044004b",
       INIT_14 => X"006400480072007e0078007f007c007e007f00810080007b0079007700780090",
       INIT_15 => X"00830063004f0058005f0061006c005b002e003e003d003b004000460049004c",
       INIT_16 => X"00220034007f0069005d007a00840083008100730078008c00a6009700740085",
       INIT_17 => X"008d006e005600610060005c00560031002a003c003e003c003e00420045004a",
       INIT_18 => X"00040040008e007d008c009a008c0084007f006b007b009c00b2009300770053",
       INIT_19 => X"0040005b00530064006f005c004d00310029002f00370039003b004300420044",
       INIT_1A => X"00180048007a007b009c0096008f008d0077006a008f00a00097008100800077",
       INIT_1B => X"004d00740073006d007b005a0044002d0023002b00330037003b003e003a003e",
       INIT_1C => X"00450052004a0070009600910086008f0083008400a1009c007d007200850097",
       INIT_1D => X"009100a0009200980081005d004b002f002f003000380044003c003c00360039",
       INIT_1E => X"00570041003b0070009800960086007d008f009b00a700a5009b0084008f00a0",
       INIT_1F => X"00a2009e009f00a100890078005400390033002b0040005f0051003700360039",
       INIT_20 => X"0058004e004000660090008d0081006c008b00a500af009d009e00860086009f",
       INIT_21 => X"009a009400930098009a008700490031001e0023004b0067006f003d002c0039",
       INIT_22 => X"0056005700570074008f009300910069008000b30085006c0091008b007a0079",
       INIT_23 => X"007d0087007c007900720058002a00180013001d00490066007500500027002e",
       INIT_24 => X"005c005c004d0076009c009900910062005c00aa0074007a00a50083004b0062",
       INIT_25 => X"004c0061005500400036001b0011001b001a002800450075007f006400240028",
       INIT_26 => X"005e0054003c006e009c00a3009b00730027007c00940089009500710057009c",
       INIT_27 => X"00780050003d0027002700180022002e001f002d004500780099007b00220020",
       INIT_28 => X"0061005d00590072009600a200980075000d001d00640074007300560049007c",
       INIT_29 => X"0086005b002f001b00310032003100320019001e0042007d00a2009600380020",
       INIT_2A => X"006a006800570063008d009600810057000f000b00160025003600390029003e",
       INIT_2B => X"005300480036001a00200023002200330028002b003e0070009b009e004a001f",
       INIT_2C => X"00700068004f005a007b008900730042002f004200280017001b0026002c0045",
       INIT_2D => X"0036001f0026001d00190016000f001f00310033003a004e008600940057001f",
       INIT_2E => X"006d005800590060006900810073005e006100470036003c0042003e004b003c",
       INIT_2F => X"001a000a0009000e00110013000b000c0017001f003a003b005e008800690023",
       INIT_30 => X"005b00460060007000600068008900930075003a00450043004a0045003f0035",
       INIT_31 => X"002900190013000d000c0009000d0012000c0024003e00270034006800790047",
       INIT_32 => X"005b005c006200620061005600690086008e006b007c006100440049004e0049",
       INIT_33 => X"003e002b0026001c0016000e000b00140014002a003000140025003800580064",
       INIT_34 => X"005b005e006100620071006f005b004c0084006e005000510047005f00630054",
       INIT_35 => X"0048003d003800330035002b0020002b002e0028002500280040005a00300042",
       INIT_36 => X"00570060005000520071006d00620048005c007300450046004a005e00600058",
       INIT_37 => X"00450047004c004a0042003c003d004b00490040003f0041004c005e0036003a",
       INIT_38 => X"006000610043004c0069005a004e005000570048004c00620057005c005d005a",
       INIT_39 => X"004f00540055004600420048004d0057005300520050004f004300350046005e",
       INIT_3A => X"00490054005100650061005b0058005b00690059005b00630059005d005d005a",
       INIT_3B => X"005800550049003c004900520054005b005d0056005700550043004400570064",
       INIT_3C => X"00530060006a00710060005f0060005f00660069006d0068005b005a0052004a",
       INIT_3D => X"0052004e004d004a004d00550057005c00640059005a0054004e004d0057005a",
       INIT_3E => X"005c006b0071006800520042004d005c005f0051005b005a0058005b004d003d",
       INIT_3F => X"0046004d005600520053005c005b00600065005c0057005b005c005a005b0057",

       -- The next set of INIT_xx are valid when configured as 36Kb
       INIT_40 => X"0053003d001a002400410043003a0036003f00410034003b003e0035002e0034",
       INIT_41 => X"00470041002b0027002f002f002d0026002f002d002a00320045002e00290029",
       INIT_42 => X"00610035003a0046004600430044004d0044004100380039003400390032002e",
       INIT_43 => X"003c0034002b0026002f002f002c00280020001e002b00380043003500330031",
       INIT_44 => X"00640047005c0051004400390044004e00400047003f003b0034003000310030",
       INIT_45 => X"003b00320021001e002b003000350038003300380039003800390035002f0031",
       INIT_46 => X"0060005f0061005900490037004900480041004e00420042004300370036003f",
       INIT_47 => X"002f002e001a001200220029002f0035003d00440040003e0030002d003a003c",
       INIT_48 => X"005c0061005400570049003f004c004b004a004a004b004b0043003b0035003b",
       INIT_49 => X"003b00340033001e001f0029002e0027002e003b003d003d00340030003a003c",
       INIT_4A => X"006500660047005900510046004c004c004c0051004e00470044004300350031",
       INIT_4B => X"0043004100480039002b003e00420032003800360038003a003c003d003c0041",
       INIT_4C => X"0078005900490063005300500051004b0051005700550042004c004f00430035",
       INIT_4D => X"003c0040004a004d004100400041002f00350036002d0030003a003d003f0042",
       INIT_4E => X"0075003b005b005b00510051004f00540057005600560048004d004c004a003f",
       INIT_4F => X"00420049004c00490047002f0038002f002c00310023002a00370039003e0040",
       INIT_50 => X"005c0054005b00510053004f005000500058005300490046005100480043003d",
       INIT_51 => X"0043004100460046004f0040004f003c002c002d0034003b003a003d003d0040",
       INIT_52 => X"00610058004c005a005b005600530047004f00520054005300580053004d0055",
       INIT_53 => X"0051003e00390046005000480059004b002b0031003a003c003a003f00390040",
       INIT_54 => X"00510030005600620059005b00520054005b005400500050005e00650067007e",
       INIT_55 => X"006b004900370043004b004c0051004400200031002f002d0033003a003e0041",
       INIT_56 => X"0014001f0063004d00400056005a005a005f00450045005f008f008800670079",
       INIT_57 => X"00760052003f00500052004d00420021002100300030002e00300036003b003f",
       INIT_58 => X"000000320070005c006e007a006900620060004800540077009d007d005f0049",
       INIT_59 => X"00340047004100540060004f0041002a0025002500290029002d00380039003a",
       INIT_5A => X"0014003c0061005c007d00780070006f0059004c006e0080007f00640062006c",
       INIT_5B => X"004400630062005b006a004c003a00290021002300250026002e003400320035",
       INIT_5C => X"003b0046003a0058007b0075006a0073006600670082007d005f005000660089",
       INIT_5D => X"0083008c007e0084006f004e0040002a002b0028002a0032002f0032002e0031",
       INIT_5E => X"004900350032005e007e007c006c00620072007d008a0088007b00620071008c",
       INIT_5F => X"008f0089008a008c0075006900490033002f00230032004d0043002d002d0032",
       INIT_60 => X"00480041003a00560077007500690053006e0089009300820082006b006d0087",
       INIT_61 => X"0084007f007e008300870077003d002a001a001b003c00550061003300240033",
       INIT_62 => X"00470048005100660078007c007a005000630097006a0054007c00790065005c",
       INIT_63 => X"0063007300680065005e0048001f0011000e0015003a005500680046001f0029",
       INIT_64 => X"004f004e0044006400860088007d004b00470093005b0061008e007100370048",
       INIT_65 => X"0035004f00450032002a0014000d00160014002300370060006f005b001e0023",
       INIT_66 => X"005100480032005800870099008a005d001f006f007f0071007c005c0047008d",
       INIT_67 => X"0067004100330021002400190024002c001a002b0036006000890073001e001a",
       INIT_68 => X"00530052004f005f0082009600860062000a0017005600630065004c00420074",
       INIT_69 => X"007a004e00270017002e002f002f002e0014001b0034006700920089002f0019",
       INIT_6A => X"005c005c004e0053007b0087006e0046000c00080010001d002f003400250038",
       INIT_6B => X"00460039002b00120019001c001d002c002100260031005e008c008d003d0018",
       INIT_6C => X"0061005d0046004e006b0076006000300025003a002200130013001f0026003b",
       INIT_6D => X"00270013001b001200110011000a0018002a002c003000400078008000460018",
       INIT_6E => X"005e004d00520058005b006b005f004b004a003700300039003a003500430033",
       INIT_6F => X"0010000400030008000e001300070006001100170030002f005100730057001b",
       INIT_70 => X"004b003b00570069005300520075007e005500220039003e0042003d0039002e",
       INIT_71 => X"002400170012000d000f000e000c000e0007001c0036001e002800550068003e",
       INIT_72 => X"004d004d005100560055004500570070006f004f0064004f003b00430045003a",
       INIT_73 => X"00330026002000150011000c0006000e000f00220029000f001f002e004c005a",
       INIT_74 => X"004f00510052005500650060004a0039006d0057003a003e003d0058005a0044",
       INIT_75 => X"003b0035002f002a002c0023001800230026001d001b001f0039005200270038",
       INIT_76 => X"004c0057004a004a0066005f00530039004d00630037003a003f00540057004d",
       INIT_77 => X"0039003c00430044003b00310031003f003c003100300033003f0054002d002f",
       INIT_78 => X"0055005a00400045005e004e00410044004c003c0042005a004a004e00530051",
       INIT_79 => X"00430047004c0040003b0039003e0048004400420040003e00320029003d0053",
       INIT_7A => X"003d004b0049005c00570051004e0050005d004c00500059004a004c004e0050",
       INIT_7B => X"004a0045003e0035004000420044004b004d00480048004400320038004e0059",
       INIT_7C => X"00460051005a0064005600550057005500560057005d005a004a0046003f003c",
       INIT_7D => X"0042003c003e003e004100460047004c0055004d004e0047003e0041004d004f",
       INIT_7E => X"004f005d005f005900460039004600510053004000470047004a004c003d002f",
       INIT_7F => X"0038003f004800460045004c004b00500056004f0049004e004f004c004f0049",

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
