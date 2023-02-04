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
        ADDR : in std_logic_vector(11-1 downto 0);
        DO   : out std_logic_vector(16-1 downto 0)
    );
 end bram_single;

  architecture a1 of bram is

    begin


    MEM_IFMAP_36K_LAYER1_ENTITY0 : if N_LAYER = 0 generate
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
            INIT_00 => X"00120012000f00140017000d000f001d001d000a000000010006000c00150016",
            INIT_01 => X"0012000f00130013000400080003000000040000000000000005000b0000000b",
            INIT_02 => X"0013001b0012001b0020001e000000000000000000000000000100010000000c",
            INIT_03 => X"0019000b00110000000000000000000000000000000000000000000000030003",
            INIT_04 => X"0000000000000000000000000000000000000000000000000000000400000000",
            INIT_05 => X"0000000000000000000000000001000000000000000000000004001c00000000",
            INIT_06 => X"0000000000000000000000000000000000000000000000000002000000000000",
            INIT_07 => X"0000000000000000000000000000000b000000000000000000000000000b0000",
            INIT_08 => X"000000000000000b000000000000000000000000000000000000000000000000",
            INIT_09 => X"0000000000000000000000080000000000000000000000000000000000000000",
            INIT_0A => X"0000000000000000000000000000000000000000000b00000000000000000000",
            INIT_0B => X"0000000000000000000000000000000000200000000000000000000000000000",
            INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_13 => X"000b000000000000000000000000000000000000000000000000000000000000",
            INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_15 => X"00000000000000000000000000000000000000000000000000000000000d0000",
            INIT_16 => X"0000000000000000000400070000000000000000000000060000000000000000",
            INIT_17 => X"0000000000010000000000000000000000000000000000000000000000000000",
            INIT_18 => X"000000000000000f001a000f003f000a0000000000000032003a003800250020",
            INIT_19 => X"00220029002500270020002c003a00000000001e001d001d00200020001f0024",
            INIT_1A => X"001e0022002800210030002f002f000e000f00210019001d00220023002f0033",
            INIT_1B => X"00340028003a0029003300310041002a0030002a001f0017001c0021002d001a",
            INIT_1C => X"001c002900000000000000000000000000000000000000000000000000000000",
            INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_1E => X"0000000000000000000000000000000000030018000e00060000000000000000",
            INIT_1F => X"000b0000000000000000000200010000001b000000060000000000000000001e",
            INIT_20 => X"0000000000110014000500030000001d00100000000800000003000f00170000",
            INIT_21 => X"0000001a000a000600040000004400030000000b000000020017000b00000000",
            INIT_22 => X"000c001e000b00000000003700000004000a0011000200200014000600000006",
            INIT_23 => X"002d000000000000002000000000001100080000001d00280004001100080000",
            INIT_24 => X"0000000b000b0000001000000006000000000018002400000027000e00090012",
            INIT_25 => X"00120015000000000000000c00000000002b002300000058000d0028002d0011",
            INIT_26 => X"00000000001b0022001f000b0000003600230012004500000007001f0021001a",
            INIT_27 => X"001e00220028002e002f002f002a00380033002500000027002500240024002a",
            INIT_28 => X"002f0036002f002e003a002c002e005200000013002b0026002a002a002f002e",
            INIT_29 => X"002f002a00450028002b0033002c00190019002800230024002e0031002d002e",
            INIT_2A => X"0043003a001f0000000000000000000000000000000000000002000a00000000",
            INIT_2B => X"000000000000000000000000000000000010000800170000001f001c00030000",
            INIT_2C => X"0000002a00000000000000000000002b0011000000000042002d003f00000000",
            INIT_2D => X"0071000000000000000e00000028002c00250000005a0026003b002a0000006c",
            INIT_2E => X"00050023000000340024005d0048003c0000002f0052001e003e000000590031",
            INIT_2F => X"003700000000002c0061003e006000000073005c001200310025004800730015",
            INIT_30 => X"003800000000005a004a006a0000007500470012000c0037004d006500280031",
            INIT_31 => X"00000006008b003800460000004f0050000600250013006800420084000b002a",
            INIT_32 => X"0013002e002c000000290016005b000400000000004a003a009f000000640018",
            INIT_33 => X"0000004d0030003b005a001700000000000c000f003c009400000093004c0020",
            INIT_34 => X"007100830041001a001d002300200031001d002b004e000000d80073003a003c",
            INIT_35 => X"00470038003d003c003e0040004f005f00120000008200af00420049003f003e",
            INIT_36 => X"00390038004000500048003d006a0045000000cb005a0039004d0042003c0041",
            INIT_37 => X"0048004d004e0038007b0076004b003e00540048003500430044003800440055",
            INIT_38 => X"003a001a006f0080000000000008000800060003000500000004000000000000",
            INIT_39 => X"0000000600050007000a000c0007000a0049001a000000000000002400060000",
            INIT_3A => X"0000000400000000000400040007000000000000000d001a0015000700170000",
            INIT_3B => X"00000028002500090005000d00000037001b0005000000000000000000010000",
            INIT_3C => X"0026005a0013000b008000560006000e0000000000250025000f001800000000",
            INIT_3D => X"00000008000000000000002a001a001f003a0000000000000009002700060007",
            INIT_3E => X"00000004000000210000000a000900110000000b00000017001d00150007001c",
            INIT_3F => X"00100019001600000000000000000000000000000000000000100004000b0004",

            -- The next set of INIT_xx are valid when configured as 36Kb
            INIT_40 => X"001c00000000001a000400000000000000000003002f00000000000900040011",
            INIT_41 => X"00000000004a000c000000000000001b001f00000000000000000046009c0085",
            INIT_42 => X"002800000000000000200041001b0000000000000000000f0046000000000000",
            INIT_43 => X"0000000000000000000000000000000000020000000000000000000000000000",
            INIT_44 => X"0000000400070012000000000011000000000000000000000000000800000000",
            INIT_45 => X"0000000000000000001300000000000000000000000000000000000000140013",
            INIT_46 => X"00040000002800220000009d00a300a200a500a4009d00ac00b700ad0094007c",
            INIT_47 => X"007c00840092009200a200ad00a800ac00a0008c00a900a0007a003a002e003e",
            INIT_48 => X"004e006e008b0089006a00ac00b000af008e00730048002d0007001e000a0027",
            INIT_49 => X"003a0067004d002b00a400aa00a20059004d00270015000c0033002d001b0025",
            INIT_4A => X"003a0017001f00940060004e00470043002f001f0000003100390017001c002f",
            INIT_4B => X"00160012008e00990025003b00450031002d0000003e002a001000120017000e",
            INIT_4C => X"002a0062009f002f0032003e002d002f0000003200280010000e0026001c000a",
            INIT_4D => X"002c006200370026002e00270029001e002f002d00090022004100140000002b",
            INIT_4E => X"000e0055002200360030000d005400420026000f002d00790010000500240000",
            INIT_4F => X"0035002000080028002d0034001d000600090062008a00000015002300000017",
            INIT_50 => X"001a0000000000060000000000000000000000000000000000000006003a0000",
            INIT_51 => X"0000000000000000000000000000000000000000000000000034000000000000",
            INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_54 => X"0000000000000000000000000022002300250020001e002700260024001d0017",
            INIT_55 => X"001a00260024001e00180023002c002a001f00280020000f001d000e001d0000",
            INIT_56 => X"00090020002b001c00060039002800210027001a000000060021002e00000000",
            INIT_57 => X"00000025002c0000004c00210029000f00240004000000000048000000090000",
            INIT_58 => X"0000004a00000026000200560009000b00000000000000590000000000060000",
            INIT_59 => X"002b0000000a0000001a003e0013000000000000008e00000000001400000000",
            INIT_5A => X"0000000000200000003f0036000000000000006600000000000a001500000000",
            INIT_5B => X"00000000000000380042000000000000004200000000001d000f000800000002",
            INIT_5C => X"0000002100040011000000000024000000250000001e00210023000000000000",
            INIT_5D => X"002c0000000f00270000000200050000000c003000340014002a000400000078",
            INIT_5E => X"0000000000220000000000000008000900010000000000200014000000400000",
            INIT_5F => X"0000000000000000000000000000000000000000000000210043000000000000",
            INIT_60 => X"00000000000000000000000000000000000000000000005d0000000000000000",
            INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_62 => X"0000000000000000000400000000002b0030002d002c002f00290030003a0037",
            INIT_63 => X"002a002500260027002a0031002c00350030002e002d0000001f0029003b000c",
            INIT_64 => X"00000000000e001f0025001c0029002e00350032003b002d0023000000000000",
            INIT_65 => X"000000000004001a000000000023003200250019000000000000000000000000",
            INIT_66 => X"0006000000110000000000120018000000000000000000000000000000000000",
            INIT_67 => X"0000000500000000000b00380003000300000000000000000000000000000000",
            INIT_68 => X"0000000000000007003a00070000000000000000000000000000000000000000",
            INIT_69 => X"00000000000000000002000000000000000000000000000000000000000d0000",
            INIT_6A => X"0000000000000000001a000500000000000f0003001800040000000800000000",
            INIT_6B => X"000000000000000000000000000000080011000a00000000001f000000000000",
            INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_70 => X"00000000000000000000000000000000000a0011000800080004000c000c000b",
            INIT_71 => X"000b0021002d00230011000800060000000a000a000c00080000000500230042",
            INIT_72 => X"000000000000000a0017000a0035003300050008000500370016000900000000",
            INIT_73 => X"000000000000000e000c000000000005000800080000000000020000001a0004",
            INIT_74 => X"001000060000000e000100000002000e00000000000900000007000000000000",
            INIT_75 => X"000000000000000f000000060003003e00280000000000000000001400150007",
            INIT_76 => X"0000000000000000001c00180012000000310000001100000011000000000000",
            INIT_77 => X"000000000000000000000002003500350021000e0000000900000005000e0000",
            INIT_78 => X"000000010000000000000026000000000000000000260030000000000000000c",
            INIT_79 => X"00000004000000230009000000000000004e0036001100000000001800030000",
            INIT_7A => X"0007000000000000001e0051003700000000000000000005000a00350021000c",
            INIT_7B => X"0000005600280004000500030000000000000000000000000000001600000018",
            INIT_7C => X"003f0000000000000000000000000000000000000000000000000018004f000b",
            INIT_7D => X"0000000000000000000000000000000000000014000000000000002200000003",
            INIT_7E => X"001200000000000000000000000000000000000d0013000a000e000900150008",
            INIT_7F => X"0006000c001c0022001b0013000600020008000b0009000d000f0036000f001a",

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
    end generate MEM_IFMAP_36K_LAYER1_ENTITY0;


    MEM_IFMAP_36K_LAYER1_ENTITY1 : if N_LAYER = 1 generate
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
            INIT_00 => X"001f0034003500240021001a000a00260024000b000a00080051003300280020",
            INIT_01 => X"0053005e004b002b0019001a00330014000e00120019002e0045002f0036005b",
            INIT_02 => X"005d0042003b0015001b0071005e00150035007e00440064003b0033003b0067",
            INIT_03 => X"0038003900250001007f009e0028001300bd007e007d004b002e005b007f0050",
            INIT_04 => X"0047003c0015007a009400430017005a007500a80065004e007800810046003b",
            INIT_05 => X"004c0033008e00a500400039003900a50085006a0050005f0078004c0048004b",
            INIT_06 => X"002600b000b800660073003800660059004e0051003300650041002c002b000e",
            INIT_07 => X"00c000b300860075006f0033005f00790042005a00400025002f0027002700c7",
            INIT_08 => X"00ab008b00a2009e0065009100b90079003c00400047005a0071006800c100cb",
            INIT_09 => X"009d00c900e700a5008a0085007c006f007800800088008a008e008c00a100b1",
            INIT_0A => X"00e500af007a00750070007100760084008c0095009a00a3009d008500a600ef",
            INIT_0B => X"008800800079007300770082008c009b009300a300ab0097008f007f00a70074",
            INIT_0C => X"007f0089007e007c008800860085009a00af008d000000000000000000000000",
            INIT_0D => X"0000000000000013001c000b000000000000000000000000000000000000000b",
            INIT_0E => X"00140033000000000014001e00000000003f0000000000000000003e001c0028",
            INIT_0F => X"00000000000000000007001e00000019000000000000000c0000000000000000",
            INIT_10 => X"00000000001a0006000e0000000000000009000000000000000f0004001d0000",
            INIT_11 => X"00000008000000000025002f00000002004f0003000000000000000600000026",
            INIT_12 => X"001c00000000000000000018000d000d00000000000500000009000000180008",
            INIT_13 => X"000000000000000200000007000000000000003d001e000000000000001c0000",
            INIT_14 => X"0010000000000000002e00000022003200030000000000360026003a000d0000",
            INIT_15 => X"000000000000000a00000012001500000000002e001f00310001000000000008",
            INIT_16 => X"00000000002200000000000000000019000f000d000000000000001600210041",
            INIT_17 => X"00000000000000a20052003f0037000c000600000002000000000000000d0036",
            INIT_18 => X"0000004100560000000200000000000000000000000300000000000200000025",
            INIT_19 => X"003e0006000000000001000000000007000a000000000042000c000000180036",
            INIT_1A => X"0024001300090000000000000005000000000000000400000000000000000000",
            INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_1D => X"00000004001f000000000000000000000000000b000000000000000000000000",
            INIT_1E => X"0005002d00000007000000020001000000020000000000000000000000000002",
            INIT_1F => X"003b000000000003000000100001000600000000002c0000000000000000005d",
            INIT_20 => X"00000000000e000000000000000000000000001c000f00000000000000520000",
            INIT_21 => X"00000012001300000004000000000000000c0017000000050000002d00000000",
            INIT_22 => X"001d00030000000000160000001100000012000000000008000000110000001b",
            INIT_23 => X"00000000000900190000003b0000000300100000000500000000001200120000",
            INIT_24 => X"00000033000d0000005800000000002d00040000000200280033003e002c001d",
            INIT_25 => X"007000360000003b0000002e004e004e00440049004f00560058005a0053005a",
            INIT_26 => X"006f00480008000000490048004a004c0054005b005b0057005d005e005a0060",
            INIT_27 => X"008a0000003100500045004d005300570061006400610074005e005000670067",
            INIT_28 => X"00410049005f00550049005200520052005e006b00530045002f002e0033002e",
            INIT_29 => X"002f002f0031002f002b0023001c0027002600270024003200320035002d0034",
            INIT_2A => X"00550013002500040021001300150024002d0028001a003b0034002e0038002c",
            INIT_2B => X"00000000001a004f000a000b00040027003900000079002c003600250023001a",
            INIT_2C => X"000800180053000000120000000e005300000063000a0049002c001a00000000",
            INIT_2D => X"0008005f000b0000001e00000039000000380000002e00490000000000000000",
            INIT_2E => X"00bf0000000000230004000d00000015000c000000610050000a0000000000a4",
            INIT_2F => X"00000000001e0027000d000000000001000000450068000000080000007c0000",
            INIT_30 => X"0000002a00220012000000170000003c001100030000001c0031000600220000",
            INIT_31 => X"0026003a0044000a00180000004a00000019002a000e0017000a000000050048",
            INIT_32 => X"0056001c00510011000000a30000000b005600000000000000140028002d001e",
            INIT_33 => X"0000004000280000009800000000000000000000000900100010000e00110000",
            INIT_34 => X"000300410048001f000000090005000a00080010001400170010000800170000",
            INIT_35 => X"0010007400000000001100000009000d0010000d00090000002600000000000d",
            INIT_36 => X"0019000000000016000c0009001800100000000b003100030000000000000000",
            INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_38 => X"0000000400000000000000000001000000000000000000000000000000000000",
            INIT_39 => X"0000000000000000000000000000000000000000000400120000000000000000",
            INIT_3A => X"0005000000000000000000000000000000000001002700000000003800080000",
            INIT_3B => X"0000000000000000000000000004000000000000000000000000000000000000",
            INIT_3C => X"000000140000000000000000000f000000000000000000000000000000000000",
            INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_3F => X"0000000000000000000000000000000000000000000000120000000000000000",

            -- The next set of INIT_xx are valid when configured as 36Kb
            INIT_40 => X"001100000000000000000000001e0030003e0000000000000000001c00240001",
            INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000002",
            INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_44 => X"00000000000000000000000000000000000000000000001300000000002f0036",
            INIT_45 => X"00330035003500300039003b0036002b00200020002500280027003000380036",
            INIT_46 => X"003900330042003b003900230002000200060006001100270030001300360039",
            INIT_47 => X"0037003d001e0000000000000004000000010000001700150000003200370040",
            INIT_48 => X"0012001e00000000000000170000000000000000000000120034001000440033",
            INIT_49 => X"0025000600000000001000090000000000000000000f00310038000b000d002b",
            INIT_4A => X"0008000b0000002a00000000000000000000002c0007003d000e0011002e0017",
            INIT_4B => X"0008000300130000000000000000000400190000002500000022002e000a0000",
            INIT_4C => X"0013000f00000000000200000015001100090000001c00000000000c0000002c",
            INIT_4D => X"000000000000000000210016000e00140000000300000000001f000600050000",
            INIT_4E => X"00000000001e00280005001400150000002c0006001100170000000000000000",
            INIT_4F => X"0000000000000000000000000032003c00000000000000000000000000000000",
            INIT_50 => X"00000000000000000000004f0000000000000000000000000000000000000000",
            INIT_51 => X"0000000000000000002800000000000000000000000000000000000000000000",
            INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000027",
            INIT_53 => X"002200230029002c00200028002b002f00320029001d001e0029002e00280024",
            INIT_54 => X"0024002c0021000e00430030002e00050021002900190015002c003f00020028",
            INIT_55 => X"0029002a00200028002400100000001c000c0032001a000b005c0000002e0024",
            INIT_56 => X"0038000c002700250019000000230018001a00260000002c0005004100000013",
            INIT_57 => X"0027002a002400250000001400380012002b001a002400000037002f00000000",
            INIT_58 => X"00160025004300000034002a0007001d002000110024000e0046000000000015",
            INIT_59 => X"001c00390000002b0028000d00000025000b000600290034000200000035000b",
            INIT_5A => X"001800000011002c00000011000d000d0000003f000000340000000e001b0000",
            INIT_5B => X"003f0005002b00000000001a0000000000390000002a00140000001d002c000f",
            INIT_5C => X"002f000f00000010002f000000000038000000290032000000050027002b000f",
            INIT_5D => X"0008000800110021000000000000000000520005000000000000000700030000",
            INIT_5E => X"0000000000030014000000000022002e00000006000200050001000000000002",
            INIT_5F => X"000000000009000000000022000d000000090006000000000001000000000000",
            INIT_60 => X"00150013000000000004001400000000000000000000000c000000000012001a",
            INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
            INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",

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
    end generate MEM_IFMAP_36K_LAYER1_ENTITY1;



end a1;