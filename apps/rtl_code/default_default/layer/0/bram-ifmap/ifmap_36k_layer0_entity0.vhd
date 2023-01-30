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

entity ifmap_36k_layer0_entity0 is
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
  end ifmap_36k_layer0_entity0;

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
       INIT_00 => X"009e009f00a500a600a0009c00a2009f009e009f00a100a000a100a600a900aa",
       INIT_01 => X"00a700a200a000a0009c0095009600940095008f008c008d008f0089007e0074",
       INIT_02 => X"00980097009f00a600a200a000a400a200a3009c009b009f00a300aa00ab00ab",
       INIT_03 => X"00a900a0009a00970091008b008c008d009500930091008e008f0088007d0077",
       INIT_04 => X"00970097009e00a700a000a300a500a500a300a2009e009d00a100a600a700a9",
       INIT_05 => X"00aa009f00910079006e00620065007200780086008f008c008e008b00820078",
       INIT_06 => X"009b009b00a000ae00a700a700a900a900a500a500a700bf00b1009d00a200a4",
       INIT_07 => X"009e0095006800670062005c0050004a0056005300710084008c008c0088007f",
       INIT_08 => X"009b009c00a100aa00a900a300a900a600a400a400ad00f600c300970092008e",
       INIT_09 => X"006f004e005500710070006a0061005d004a0054005500690080008a00850081",
       INIT_0A => X"009400850082009300a100a500a700a700a300a500a300b4009d008000610042",
       INIT_0B => X"0045004200590076007a00770072005e0063005b003a0043006c008c008a0086",
       INIT_0C => X"007f006d002f0058009900aa00a800aa00a900a600a400930081007f00640044",
       INIT_0D => X"004e0048005300840092007c0069006b00730055003f002e004f0084008d0086",
       INIT_0E => X"00830063002a0046008f00a700a500a800ab00a1008c00780082009000740058",
       INIT_0F => X"005b0055004d007c00a300880066006a00640055003600310039006b008a0088",
       INIT_10 => X"00aa00670036007c009900a100a300a600a500ae0071007d009d009c00790056",
       INIT_11 => X"0052005400500051008a00920071005700530056004700380028004a00850089",
       INIT_12 => X"00b40086005e009a00ae009e009c009900cf00ed00cf009c00ae0094007d005d",
       INIT_13 => X"0056004a003b004c0089008f0085006a005600570054004b00320028005f0084",
       INIT_14 => X"00b7006c008e00a500b1009b009f007a00d500ed00dc00a400b7009c007d0078",
       INIT_15 => X"004e0050002d005b00af009d009b006b005700670058004e003b0029003b0068",
       INIT_16 => X"00bc0064008700aa00bb00a600ad0086007500c200c700aa00b900bd00860075",
       INIT_17 => X"006600540026007d00d200a00092005d0053005e0068005500490037003e004c",
       INIT_18 => X"00bd005a007f00af00ae00a600b2009f006100a800a8008900ba00d800a0007b",
       INIT_19 => X"007800730032009600c2009b007b005b00540054005f005600540049004f0049",
       INIT_1A => X"00bd005d009800b90077008800ad00a700670093009100a700bd00e200b4008d",
       INIT_1B => X"007e00750047009a00ba00950072005700500048005000630064005a0061005e",
       INIT_1C => X"00c2006c00a800ba00690063009c00a700640073008a00c600be00ac0091009a",
       INIT_1D => X"009200670047009800b300890082006e0055005b005f006d0073006400610075",
       INIT_1E => X"00c5008400ac00b80082004e008c009b00730082008f00e600f2009100870083",
       INIT_1F => X"0079006c005f009000a800980070005700470057006900700078006700790088",
       INIT_20 => X"00cb009200a800bf00a8004e007e008a008a0060009a00ad00a2008c00710071",
       INIT_21 => X"00650069007000ab009c00940087006d004e004f005e0065006b007d00970090",
       INIT_22 => X"00d600a300a400b700b0005e0060009c0094006a008100760072007400660073",
       INIT_23 => X"0056006500900076004400800085004b003c003a004700660074008f0096008c",
       INIT_24 => X"00d400b200a700ad00b0007c0056008d009900870068004d0086007c00810093",
       INIT_25 => X"0055005c009600840075006b004b0040002c004100560085009b00a0009a0097",
       INIT_26 => X"00c700bb00ab00ae00b1009000560077007a0089009000460081006c009100b8",
       INIT_27 => X"00740049008300890086005900330034002f005a007900a300ab00a4009e0095",
       INIT_28 => X"00a500c300b300b100b500980063008300ab0067005d0050005d007a00b200bf",
       INIT_29 => X"0096006400590057003c002e00260018002e003c006c009000900080007f0078",
       INIT_2A => X"007500c300b100b200b5008a0053009600f500db00850086009500b000be00c2",
       INIT_2B => X"00a8007d006e003d002300220031003a003d003a00450048004e0045003b0037",
       INIT_2C => X"004f00af00ae00b000b1008c006d00d300fd00fc00d0007c0072007c0074007a",
       INIT_2D => X"006800440044003c003400320033003800380033002b0033003b0030002b002a",
       INIT_2E => X"00290060009000a800b200a500a500f600fd00e3006e003c0035003100310030",
       INIT_2F => X"002d002a002e002a0026002e002e002b002a002e002e0032003700350033002d",
       INIT_30 => X"001d001d003b008300a6008400c200fe00f1008d003d00320032003300310032",
       INIT_31 => X"002f002a00270022002300270026002a002d0038003e003b00380032002e0033",
       INIT_32 => X"0030001e002200490080008000d7010000bb00420036003200340034002e002d",
       INIT_33 => X"002b00290024002700280028002b002e003b003e0040003b0036003200460053",
       INIT_34 => X"00340023001f00290042008000e000f0007c003a003100380036002c002c002f",
       INIT_35 => X"002e002b002b002c002c002d0036003a0036002e002b0024003300490055004c",
       INIT_36 => X"00320023001d0023002c004e00ca00d30061004100360030003a00300028002d",
       INIT_37 => X"002f0030002f002e0033002700270030002f0027001c002800430043002e0033",
       INIT_38 => X"00320023002000210029002e006800aa0040003600340035003d003a0036002d",
       INIT_39 => X"002a0029002e0031002e002a0028002700250028002c003f002f001f000f0033",
       INIT_3A => X"0044002a001f00260025002b002a00470031001f001b002600310038003a0035",
       INIT_3B => X"0038003c003900350032002d00270021002a003e004f004900380026000d0028",
       INIT_3C => X"003d00310023002b0027002a002c0028002a001b0017001e001b001d0024002f",
       INIT_3D => X"0038003e0042004b00450031002b002b003c0055006d005d003c001a001d0014",
       INIT_3E => X"00360038002d002b00280028002800260024001a0016001d0019001d00130012",
       INIT_3F => X"0020002f003d004a004200350034002d00430059006900590030001800220015",

       -- The next set of INIT_xx are valid when configured as 36Kb
       INIT_40 => X"0070006f007400760070006d00730071006f00710074006f006f007500750077",
       INIT_41 => X"00750071006f0070006d006b006b006a006b0065006200610061005f005b0055",
       INIT_42 => X"0070006e0072007400700071007500720074006e006f006e0071007700750073",
       INIT_43 => X"0073006f00700073006e00680066006400690066006600610062005f005b0058",
       INIT_44 => X"006e006d006f006f006a007300750075007300730072006d006f007300720071",
       INIT_45 => X"00740072006f0060005a004e004d0055005600600067006300630062005f0059",
       INIT_46 => X"006b006e006d0070006e00750078007700730075007b00920082006f00730072",
       INIT_47 => X"0070006f00500057005a005a004b003f0046003e00550062006600650063005e",
       INIT_48 => X"006b007200730072007200710078007400710074008000d6009c0072006f006c",
       INIT_49 => X"0050003500450067006e00720066005e0048004e0049005300600065005e005d",
       INIT_4A => X"006d0068006400700073007100740073006f00740076008a007a0066004b0032",
       INIT_4B => X"003a0038005300710079007a007400600064005b003a003a005400690062005f",
       INIT_4C => X"0064005f0025004a0075007600730076007500740078006b0062006c00570043",
       INIT_4D => X"0053004b00540082008e007600630066006f00530047002f003d00620063005d",
       INIT_4E => X"00730060002b0040006f00750072007400770071006d005e006e0083006a0057",
       INIT_4F => X"005f0058004d00760099007c005d0062005d0051003c0035002f005300670061",
       INIT_50 => X"00a10069003a0079007c00710075007a0079008700590069008d008f006f0050",
       INIT_51 => X"00510055004e0047007d00870067004f004d0052004900390023003b006a0067",
       INIT_52 => X"00b0008b0064009a009500740074007600b400d600b4008300990083006e0055",
       INIT_53 => X"0054004a00390044007d0085007c0062005100550055004c0031001e004b0067",
       INIT_54 => X"00b70074009700a9009c00700076005900c500e000bf0087009f0089006c006f",
       INIT_55 => X"004c0050002c005500a5009300930064005300660058004f003b0024002e0051",
       INIT_56 => X"00bf006c009000af00a70078007b005d005f00b600ab008e00a100ab0077006b",
       INIT_57 => X"006200540026007900c90098008b00590050005d00680057004b003500370038",
       INIT_58 => X"00c20060008600b4009c007b007b006d0044009a0090007200a600ca00950071",
       INIT_59 => X"007200720032009300bb00950076005800530054005f005700570049004a0037",
       INIT_5A => X"00c0005f009a00bc006e006a007c007400480084007d009500ae00d800ac0083",
       INIT_5B => X"007500720047009800b50090006e005500500049005000640065005800590049",
       INIT_5C => X"00c4006b00a700ba006d00590077007a004a006a007b00b900b400a5008c008f",
       INIT_5D => X"008800640047009800af00850080006d0056005d0060006e007400600055005f",
       INIT_5E => X"00c5008100a700b2008900530078007d005e0078008300dd00ec008a00820079",
       INIT_5F => X"0070006800580086009f0093006c0055004800580068006d006e005600600068",
       INIT_60 => X"00cb009200a400b600aa0056007d007e00790050008f00a300980084006a006a",
       INIT_61 => X"00650065005a008f008a008d00820069004c004f005d005b00530058006c0068",
       INIT_62 => X"00d700a600a700b800b60066006000950089005d0074006900660069005b006e",
       INIT_63 => X"005b00670080006000380078007e0045003800380046005d005e00700074006e",
       INIT_64 => X"00d300b800af00b500b800830058008b00940080005a00400079006f0075008f",
       INIT_65 => X"005c0060008b0075006d00630044003b0029003e00450069007700780073006f",
       INIT_66 => X"00c000bd00b000b300b60095005a0079007c00880086003b00760061008600b0",
       INIT_67 => X"0076004b0077007c00810056003100330031005a005b007600790071006f006b",
       INIT_68 => X"009c00c100b200ad00b5009d0067008700af0069005a004d005a007600ad00b6",
       INIT_69 => X"00940064004e004d003d0034002e0021003900470064007d007b006d00710069",
       INIT_6A => X"007800c800b200a900b300900057009900f700de008c008d009c00b600c400c0",
       INIT_6B => X"00ac0085006d003e0031003600460051005500540063006500680060005c005a",
       INIT_6C => X"006900c500b700ac00b10092007000d300fc00fd00e0008f0084008d00850085",
       INIT_6D => X"007c005d00570052005400540055005d005e005b00600068006c00610061005f",
       INIT_6E => X"0059008900a800ae00b600aa00a600f500fb00e7008800580050004c004b0048",
       INIT_6F => X"004f0051005100520056005a005900570059005d005e00600060005e005f005a",
       INIT_70 => X"005b00570066009900b3008800bd00fa00f5009f005e00540054005500530054",
       INIT_71 => X"005600540052004f0053005600550059005c00670067006500660063005e0067",
       INIT_72 => X"006f005e0055006a0094008800d500fd00c6005d005b0058005a005a00530052",
       INIT_73 => X"005200510050005300560059005c005f006c006e006d006c006c0069007b0089",
       INIT_74 => X"0072006300560053005f009100e500f5008f005c0057005e005c005200520053",
       INIT_75 => X"0054005300560058005a0061006a006e00690061005f005b006c0082008a007d",
       INIT_76 => X"006e0062005900560053006a00db00e4007e0068005e00570061005700500052",
       INIT_77 => X"00540057005900590061005c005d00660065005d005500650081007e00620060",
       INIT_78 => X"006c0061005c005800580054008500c500640061005e005f0067006400600053",
       INIT_79 => X"004f00500058005c005c005f005d005c005a005d0066007d006e005a003c005d",
       INIT_7A => X"007c00640058005b00570059004f006b0059004d00470052005d00640066005c",
       INIT_7B => X"005e006300630061005f005e00580053005b0070008400830074006100400055",
       INIT_7C => X"007400660055005b005a005c00580051005500480043004a0047004900500056",
       INIT_7D => X"005f0065006d00770071005f0058005800690082009c00910073005200520040",
       INIT_7E => X"006b0069005900560059005c00570051004f00450042004900450049003f003a",
       INIT_7F => X"0046005700680077006f0060005f0057006d0083009200870063004d00540043",

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
