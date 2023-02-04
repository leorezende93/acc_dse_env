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

entity bram_single is
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
 end bram_single;

  architecture a1 of bram is

    begin


    MEM_IFMAP_18K_LAYER0_ENTITY0 : if N_LAYER = 0 generate
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
    end generate MEM_IFMAP_18K_LAYER0_ENTITY0;


    MEM_IFMAP_18K_LAYER0_ENTITY1 : if N_LAYER = 1 generate
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
            INIT_00 => X"0070006f007400760070006d00730071006f00710074006f006f007500750077",
            INIT_01 => X"00750071006f0070006d006b006b006a006b0065006200610061005f005b0055",
            INIT_02 => X"0070006e0072007400700071007500720074006e006f006e0071007700750073",
            INIT_03 => X"0073006f00700073006e00680066006400690066006600610062005f005b0058",
            INIT_04 => X"006e006d006f006f006a007300750075007300730072006d006f007300720071",
            INIT_05 => X"00740072006f0060005a004e004d0055005600600067006300630062005f0059",
            INIT_06 => X"006b006e006d0070006e00750078007700730075007b00920082006f00730072",
            INIT_07 => X"0070006f00500057005a005a004b003f0046003e00550062006600650063005e",
            INIT_08 => X"006b007200730072007200710078007400710074008000d6009c0072006f006c",
            INIT_09 => X"0050003500450067006e00720066005e0048004e0049005300600065005e005d",
            INIT_0A => X"006d0068006400700073007100740073006f00740076008a007a0066004b0032",
            INIT_0B => X"003a0038005300710079007a007400600064005b003a003a005400690062005f",
            INIT_0C => X"0064005f0025004a0075007600730076007500740078006b0062006c00570043",
            INIT_0D => X"0053004b00540082008e007600630066006f00530047002f003d00620063005d",
            INIT_0E => X"00730060002b0040006f00750072007400770071006d005e006e0083006a0057",
            INIT_0F => X"005f0058004d00760099007c005d0062005d0051003c0035002f005300670061",
            INIT_10 => X"00a10069003a0079007c00710075007a0079008700590069008d008f006f0050",
            INIT_11 => X"00510055004e0047007d00870067004f004d0052004900390023003b006a0067",
            INIT_12 => X"00b0008b0064009a009500740074007600b400d600b4008300990083006e0055",
            INIT_13 => X"0054004a00390044007d0085007c0062005100550055004c0031001e004b0067",
            INIT_14 => X"00b70074009700a9009c00700076005900c500e000bf0087009f0089006c006f",
            INIT_15 => X"004c0050002c005500a5009300930064005300660058004f003b0024002e0051",
            INIT_16 => X"00bf006c009000af00a70078007b005d005f00b600ab008e00a100ab0077006b",
            INIT_17 => X"006200540026007900c90098008b00590050005d00680057004b003500370038",
            INIT_18 => X"00c20060008600b4009c007b007b006d0044009a0090007200a600ca00950071",
            INIT_19 => X"007200720032009300bb00950076005800530054005f005700570049004a0037",
            INIT_1A => X"00c0005f009a00bc006e006a007c007400480084007d009500ae00d800ac0083",
            INIT_1B => X"007500720047009800b50090006e005500500049005000640065005800590049",
            INIT_1C => X"00c4006b00a700ba006d00590077007a004a006a007b00b900b400a5008c008f",
            INIT_1D => X"008800640047009800af00850080006d0056005d0060006e007400600055005f",
            INIT_1E => X"00c5008100a700b2008900530078007d005e0078008300dd00ec008a00820079",
            INIT_1F => X"0070006800580086009f0093006c0055004800580068006d006e005600600068",
            INIT_20 => X"00cb009200a400b600aa0056007d007e00790050008f00a300980084006a006a",
            INIT_21 => X"00650065005a008f008a008d00820069004c004f005d005b00530058006c0068",
            INIT_22 => X"00d700a600a700b800b60066006000950089005d0074006900660069005b006e",
            INIT_23 => X"005b00670080006000380078007e0045003800380046005d005e00700074006e",
            INIT_24 => X"00d300b800af00b500b800830058008b00940080005a00400079006f0075008f",
            INIT_25 => X"005c0060008b0075006d00630044003b0029003e00450069007700780073006f",
            INIT_26 => X"00c000bd00b000b300b60095005a0079007c00880086003b00760061008600b0",
            INIT_27 => X"0076004b0077007c00810056003100330031005a005b007600790071006f006b",
            INIT_28 => X"009c00c100b200ad00b5009d0067008700af0069005a004d005a007600ad00b6",
            INIT_29 => X"00940064004e004d003d0034002e0021003900470064007d007b006d00710069",
            INIT_2A => X"007800c800b200a900b300900057009900f700de008c008d009c00b600c400c0",
            INIT_2B => X"00ac0085006d003e0031003600460051005500540063006500680060005c005a",
            INIT_2C => X"006900c500b700ac00b10092007000d300fc00fd00e0008f0084008d00850085",
            INIT_2D => X"007c005d00570052005400540055005d005e005b00600068006c00610061005f",
            INIT_2E => X"0059008900a800ae00b600aa00a600f500fb00e7008800580050004c004b0048",
            INIT_2F => X"004f0051005100520056005a005900570059005d005e00600060005e005f005a",
            INIT_30 => X"005b00570066009900b3008800bd00fa00f5009f005e00540054005500530054",
            INIT_31 => X"005600540052004f0053005600550059005c00670067006500660063005e0067",
            INIT_32 => X"006f005e0055006a0094008800d500fd00c6005d005b0058005a005a00530052",
            INIT_33 => X"005200510050005300560059005c005f006c006e006d006c006c0069007b0089",
            INIT_34 => X"0072006300560053005f009100e500f5008f005c0057005e005c005200520053",
            INIT_35 => X"0054005300560058005a0061006a006e00690061005f005b006c0082008a007d",
            INIT_36 => X"006e0062005900560053006a00db00e4007e0068005e00570061005700500052",
            INIT_37 => X"00540057005900590061005c005d00660065005d005500650081007e00620060",
            INIT_38 => X"006c0061005c005800580054008500c500640061005e005f0067006400600053",
            INIT_39 => X"004f00500058005c005c005f005d005c005a005d0066007d006e005a003c005d",
            INIT_3A => X"007c00640058005b00570059004f006b0059004d00470052005d00640066005c",
            INIT_3B => X"005e006300630061005f005e00580053005b0070008400830074006100400055",
            INIT_3C => X"007400660055005b005a005c00580051005500480043004a0047004900500056",
            INIT_3D => X"005f0065006d00770071005f0058005800690082009c00910073005200520040",
            INIT_3E => X"006b0069005900560059005c00570051004f00450042004900450049003f003a",
            INIT_3F => X"0046005700680077006f0060005f0057006d0083009200870063004d00540043",

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
    end generate MEM_IFMAP_18K_LAYER0_ENTITY1;


    MEM_IFMAP_18K_LAYER0_ENTITY2 : if N_LAYER = 2 generate
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
            INIT_00 => X"0031002f00330035002e0029002f002d002c00290029003400310029002d002c",
            INIT_01 => X"002800260027002b002c002d002d002b002c0027002b00290026002400240021",
            INIT_02 => X"00330028002d00380031002b002f002d002e0026002900360034002900280021",
            INIT_03 => X"001e00210029003200350037003400300032002e002d00260022001f00200022",
            INIT_04 => X"002f002100240030002a002c002d002d002b002b003000390033002600250023",
            INIT_05 => X"0027002f0036003100340032002f003200300037003300270023002200220021",
            INIT_06 => X"00280020001f002c002b002e00300030002c002d0039005f004b0029002f0036",
            INIT_07 => X"003a0043002f0041004c00540042003200340027002d002e002b002700270024",
            INIT_08 => X"002900300031002f002b0028002f002c0029002a003b00a4006b0038003c0047",
            INIT_09 => X"0032001f00380062006f00760069005d00430046002f002d0030002e00240024",
            INIT_0A => X"0036004000390035002c00270029002900250027002a0055004e003a002b001f",
            INIT_0B => X"002b002d004c006e0078007a0074006000610056002f00250031003a002c0028",
            INIT_0C => X"003900500011001c0030002b0028002b002a002500270034003b004b00460039",
            INIT_0D => X"00480040004a00790084006c005a005e0067004d004500270024003a00300027",
            INIT_0E => X"005a005c002600290038002a002400270031003300330031004d006b005d004f",
            INIT_0F => X"005800520045006b008c0070005100580054004a003a00310020003200330027",
            INIT_10 => X"00900069003b00710052002b002900320042005f003b004e007900800065004a",
            INIT_11 => X"004d00520049003d0070007b005d00460045004c00430035001b0023003b002d",
            INIT_12 => X"00a3008f0069009500700033002f003c009200c600a600770091007d006b004f",
            INIT_13 => X"004f00470035003a0070007a00720059004a004e004e0047002b000f002c0039",
            INIT_14 => X"00af007a009e00a8007a00320033002f00b300e200bc0083009b008400680068",
            INIT_15 => X"0045004d0028004d009a0089008a005c004d0060004f0049003b0021001f002e",
            INIT_16 => X"00bd0074009900b20088003b0037002c005000bc00a400850097009f006a005f",
            INIT_17 => X"0059004f0022007100c0008e00820052004b0058005e0051004e00370030001a",
            INIT_18 => X"00c20069009000b9008500440035002f002c0098007e005e009400b700810062",
            INIT_19 => X"0069006d002f008c00b2008c006f0053004f0050005500510059004900400018",
            INIT_1A => X"00c1006700a300c000620042003a0032002700780067007f009b00c8009d0075",
            INIT_1B => X"006b006d0044009300ae008800680050004c00460048005e0063005100450022",
            INIT_1C => X"00c4007000ac00bc006d0043003e003700220058006700a900a9009f008c0086",
            INIT_1D => X"007d005f0046009500aa007f007a00690053005b005a0068006f00500035002f",
            INIT_1E => X"00c5008800ae00b5008e004d0058004d0034005d007400d300e6008900820070",
            INIT_1F => X"0065005f004b00760092008a006500500044005700630063005d003600300030",
            INIT_20 => X"00cc00a000b200bc00ac005a007e0071005200250085009b008d00750058005a",
            INIT_21 => X"005c0057003a0068006d007e007600610048004d005e00520037002d0037002e",
            INIT_22 => X"00d700b400b800c200ba006900660091006f003d0069005f0059005900490062",
            INIT_23 => X"0058005f00660040002000690073003d003300350041004e0040004400400036",
            INIT_24 => X"00cd00c000bd00c100bc00850060008f008d006f00500037006c006000640085",
            INIT_25 => X"005d005d0078005d005c0056003a00340027003c0028003b003e0036002d002e",
            INIT_26 => X"00b400bb00b500b900b800980063008400820087007e0033006c0056007b00a8",
            INIT_27 => X"00760049006700690076004e002c00320034005d003c0044004000340032002e",
            INIT_28 => X"009200bb00af00ac00b400a0006f009200b9006f005700490056007400ad00b1",
            INIT_29 => X"009400650042003f003900360033002900450053004b0052004c003d0045003f",
            INIT_2A => X"007c00c800b000a800b30093005b009f00fa00e10090009300a400c000d000c5",
            INIT_2B => X"00b5008f006d003e003a004400570066006e006f007a00770078007000700073",
            INIT_2C => X"008500d500c000b100b60096007100d100f700fc00e8009d009500a2009c0098",
            INIT_2D => X"0094007700680065006f006e0073007d008300820087008d008e008400890084",
            INIT_2E => X"008700a800bc00bc00c000ae00a400ed00f100e40099006f00690069006b0065",
            INIT_2F => X"0073007800710074007d007d007e00800084008b0089008900870086008b0085",
            INIT_30 => X"008d0082008600b000bf008900b500f200f500af007f00760077007900780074",
            INIT_31 => X"00750075007300710078007d007d008200860091008e008e00920090008c0095",
            INIT_32 => X"00a2008c007c008800a7008f00d100f900cd00760080007d007f007f00790073",
            INIT_33 => X"0071007000710075007b00830086008a0096009800930095009a009800a700b6",
            INIT_34 => X"00a500930082007a007e00a400ea00f700990072007b00830081007700770077",
            INIT_35 => X"00770077007b007f0083008d0096009a0096008d008c008a009e00b200b600a9",
            INIT_36 => X"00a20095008a0085007e008a00e900ea008c007e0081007c0085007b00740077",
            INIT_37 => X"007a007e00820084008c008a008b00940093008b0085009900b600b0008e008b",
            INIT_38 => X"00a10093008f008d008a007d009f00d30077007900800082008b008700830078",
            INIT_39 => X"00760078008200870088008b008a00880087008a009700b200a4008c00670088",
            INIT_3A => X"00b1009400890092008b00840071008500720069006900750080008700890080",
            INIT_3B => X"00830089008b008a008900880083007d0085009a00b300b500a80092006c007f",
            INIT_3C => X"00a800940084008f008b0086007d0070007300680066006d006a006c00730078",
            INIT_3D => X"008000870090009c00980086007f007f009000aa00c500be00a40082007e006b",
            INIT_3E => X"00a000950084008600860084007b0073007200690065006c0068006c00620059",
            INIT_3F => X"0064007600890098009100830082007b009100a700b600af0091007c0081006e",

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
    end generate MEM_IFMAP_18K_LAYER0_ENTITY2;



end a1;