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

entity ifmap_36k_layer0_entity1 is
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
 end ifmap_36k_layer0_entity1;

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

       -- The next set of INIT_xx are valid when configured as 36Kb
       INIT_40 => X"00eb00e700e800e800e800e800e800e800e800e800e900e900e900e900e900e9",
       INIT_41 => X"00e900e800e700e600e800e800e800e900e800e900e800e800e800e900e900e8",
       INIT_42 => X"00ee00eb00eb00eb00eb00eb00eb00eb00eb00eb00ec00ec00ec00ec00ec00ec",
       INIT_43 => X"00ed00ec00ec00ea00ea00ea00eb00ec00ec00ec00eb00eb00eb00ec00ec00eb",
       INIT_44 => X"00ed00ea00ea00ea00ea00ea00ea00ea00ea00ea00ea00ea00ea00ea00eb00eb",
       INIT_45 => X"00ec00ec00eb00ea00e300e700e700ea00ea00ea00ea00ea00ea00eb00eb00ea",
       INIT_46 => X"00ee00eb00eb00eb00eb00eb00eb00eb00ea00ea00ea00ea00ea00ea00eb00eb",
       INIT_47 => X"00e900e800e400df00ba00d100cf00e400ec00ea00ea00ea00ea00eb00eb00eb",
       INIT_48 => X"00ed00ea00eb00eb00eb00eb00eb00eb00ea00ea00eb00eb00ea00ea00eb00eb",
       INIT_49 => X"00ec00e900db00cb00a300c300d600e600ed00eb00eb00eb00eb00ec00ec00ec",
       INIT_4A => X"00ef00ec00ec00ec00ec00ec00eb00eb00ea00eb00ed00ed00ea00e800eb00e5",
       INIT_4B => X"00d000c200b900ae00a500b800cf00e200ec00ec00ec00ec00ec00ed00ed00ed",
       INIT_4C => X"00e400e400e800e700ea00ed00ed00ec00ed00ed00ef00ef00e100e000e900dd",
       INIT_4D => X"00b700a1009f009a0090008f009c00c600e900ec00eb00eb00eb00ec00ed00ef",
       INIT_4E => X"00d400e000e600e300e500ea00ed00ee00ef00ef00ef00f000c900db00e900d6",
       INIT_4F => X"00c100b900b800ad00a5009f00a200ba00e500ea00e900e900ea00ec00ed00ee",
       INIT_50 => X"00d800dd00e100e100e300e700ec00ee00ee00ee00ed00ef00c500dc00e900e6",
       INIT_51 => X"00d100d100db00d000d100d200d900da00e100e400e400e600e600eb00ed00ee",
       INIT_52 => X"00760077007c008800ac00e100eb00ed00ec00eb00eb00e900d600e200e800ec",
       INIT_53 => X"00e400e300e700e100e100d900c900b900ac00a700a700ba00df00eb00ec00ee",
       INIT_54 => X"006d0067006c006f009200de00e300e500ec00ea00e700e600e500e700e800e6",
       INIT_55 => X"00e700e700e500df00bf00a400920089008600800079009500d800ea00eb00ed",
       INIT_56 => X"00c300bc00c700c800d100df00d500d300d800dc00db00d200d100d300d800dc",
       INIT_57 => X"00e100e200e100da00b700af00b500b200ba00aa008e00b900db00e700ea00ec",
       INIT_58 => X"00c100bf00ca00d600df00d600cb00ab00b100cf00ae0062005d0065006f007a",
       INIT_59 => X"0089009900ca00df00da00dc00df00d900dd00d400c400de00db00dd00e800eb",
       INIT_5A => X"0071006f0071007d008a00aa00bf00be00d000d8009e0036002d003100350042",
       INIT_5B => X"0066009f00dd00ea00e900e300df00cf00ca00d300d400c700b300bc00d300dd",
       INIT_5C => X"003d0045003f0044007b008b009700c300d600ce00a30067005f0065008a00b5",
       INIT_5D => X"00cf00dd00db00cd00b7009e00930083007d0082008800850080008a00b600c5",
       INIT_5E => X"0028003a0055007f00840060007700a300ad00b800b600b500b700c600da00c8",
       INIT_5F => X"00ae009f0091008400740062005e00630069006b007a008a0096009d00bc00b9",
       INIT_60 => X"000d001a008600ce008a0076008d00ac00b500cf00dc00e400e000e600e200b0",
       INIT_61 => X"0090008a008e0091009a00950095009a009d00a000ad00bb00be00b200a5009d",
       INIT_62 => X"0005003a00c800e100c500c700d400e200e500e900e800e600d100df00dd00d2",
       INIT_63 => X"00c600b400c100bc00bd00c200c000b800ac00ab00a10090008800830080008a",
       INIT_64 => X"0027009100be00ba00b800c000c200c200c200bf00c000be00b100b4009a0093",
       INIT_65 => X"0091009c0092007100720084007e006f005c005b005d005e0069007900810081",
       INIT_66 => X"007a00a2008f008900830080007f008200830080007f00810081007c00680064",
       INIT_67 => X"006600760070005e005e005e0057005300500053005d0065006c007300790082",
       INIT_68 => X"0049004c004d0050005400570057005a005e0066006b00710073007600760078",
       INIT_69 => X"0073006e006a0064005f0055004f00500050004d00500052005c0071007d0088",
       INIT_6A => X"000d0003000900120012001500140016001a0022002a00300034003c00420046",
       INIT_6B => X"004700480043003c003700350035003900390039004800570068007800820089",
       INIT_6C => X"0024000b00080020002400160008000300010000000000000006000500010003",
       INIT_6D => X"000d00180015001500150016001e0027003900550071007b0074007a00860099",
       INIT_6E => X"0023001a000d001b004700460031001b000f00050002000000110039001f000a",
       INIT_6F => X"000400040007000e00190029003e0056007a00900084007200750084009200ac",
       INIT_70 => X"0010000d00040003002d00410036002400120004000200000007007600a10083",
       INIT_71 => X"007000690069006d0076008a009a0097007f0069006a00780081008e00a400b8",
       INIT_72 => X"0028000c00000000000c001e0020001500070002000200030000004400b600cd",
       INIT_73 => X"00c400c200c300bb00ac0096007b0067005f0068007a00810084009800ab00b9",
       INIT_74 => X"0045001a000100010004000c0012000c000400020002000400010020009900cb",
       INIT_75 => X"00c300bf00b3009b0077005b0051005e0075007d007d0081009000a200ad00b8",
       INIT_76 => X"0053002f00010002000200050007000400010001000100030001001b008e00cd",
       INIT_77 => X"00c600a900790055004a0055006600790080007a00790084009300a500b000ba",
       INIT_78 => X"005c003600060003000200010001000100010001000100010000000f0066009d",
       INIT_79 => X"0075004a0038004a00630073007a007c007b007d00800088009400a200b100bc",
       INIT_7A => X"0057002b0013000b0008000500020002000300030003000200000004002a0047",
       INIT_7B => X"003500390050007100840086007b007400780083008b008f009c00a900b600bc",
       INIT_7C => X"0052002e0024001f001b00160011001000120013001400130013001700250040",
       INIT_7D => X"0057006800740080008b008300750073007b0083008b0094009f00ae00b900bb",
       INIT_7E => X"0055003e003a00370033002f002e00300031003300350037003b004400510068",
       INIT_7F => X"0074007f0085007f007f00760072007a00810088008d0095009e00a800b400ba",

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
