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

entity gold_36k_layer2_entity2 is
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
  end gold_36k_layer2_entity2;

  architecture a1 of bram is

    function string_to_std_logic_vector(data : string; s: integer; e: integer) return std_logic_vector is
        variable output : std_logic_vector(255 downto 0);
        type type_hex_vector is array (0 to 15) of std_logic_vector(3 downto 0);
        variable str_vector : string := "0123456789ABCDEF";
        variable hex_vector : type_hex := (
            x"0", x"1", x"2", x"3", x"4", x"5", x"6", x"7", x"8", x"9", x"A", x"B", x"C", x"D", x"E", x"F"
        );
    begin
        for i in s to e loop
            for h in 0 to 15 loop
                if data(i*4+3 downto i*4) = str_vector(h) then
                    output(s(i*4+3 downto i*4)) := hex_vector(h);
--                     ret(i*8+7 downto i*8) := std_logic_vector(to_unsigned(character'pos(s(i)), 8));
                end if;
            end loop;
        end loop;
        return output;
    end function string_to_std_logic_vector;

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
       INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_01 => X"000000e700000000010c0114000000e300b9000000fe00f2009200f601820143",
       INIT_02 => X"00810104013a0000000100cb00000000005c000000000021001a003600690064",
       INIT_03 => X"00930000012e00b3003600000000000000000000000000000000000000000000",
       INIT_04 => X"0000000000000000000500000000000000000000000000000000000000000000",
       INIT_05 => X"006600000038016600b50000011900000000004f00be0072001c013400900000",
       INIT_06 => X"0089004e002400110000000000010000000c0094002e0000000f008a00000000",
       INIT_07 => X"000000a400000000005e00600000009f000000810000000000ae000000000000",
       INIT_08 => X"000000000000000000000000000000000000000000000000002b000000000010",
       INIT_09 => X"000000cd013d0029000000600000000000000000000000000000000000000000",
       INIT_0A => X"000000000000000000b100000000001f0000000000000000002e000000000000",
       INIT_0B => X"0016000000000000000000000000000000000000000000000000000000000000",
       INIT_0C => X"0000000000000000000000a3005e0000009600980000006300c3000000000000",
       INIT_0D => X"0000000000000000000000000000000000000018000000000000008700000000",
       INIT_0E => X"00000000000000000000000000000000000000cd00db014600d60089010b0000",
       INIT_0F => X"0072010400410000000000000071000000a700d2001b00a20075000900500130",
       INIT_10 => X"00c5000001150094000000000000000000000000000000000000008200000045",
       INIT_11 => X"00fd00460000000d0000000000000000003c0000000000190000000000000145",
       INIT_12 => X"0088002001e60066000e017200390000002100e6006900000024014c00000000",
       INIT_13 => X"012200000000000000000000006200000000008b000000000000000000000000",
       INIT_14 => X"0000000000050031000000000000000700000000000000000000005000b50055",
       INIT_15 => X"000000d100000000000b00000000000000000000000000000000000000000117",
       INIT_16 => X"0105000000ad00e800000000000d0070000000000000000e0000007b002f0000",
       INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_18 => X"000000000000007c00bc0000001400a100000000000000000000000000000000",
       INIT_19 => X"0000000000000000007b0000000000140021000000160000000c000000760081",
       INIT_1A => X"00000000000d000000000000000000000000000000000000006a004400000062",
       INIT_1B => X"007d00000000003d005b00000084006100000000000000000000000000000000",
       INIT_1C => X"000000a700d1002d00000124001b0012011200250057005d008f006b004b007d",
       INIT_1D => X"01ad005700840000019c01b1000000b901f5009100eb01d200ae00b60079007f",
       INIT_1E => X"01390058009500fd009300000000003f004b00000010000000000000001600dd",
       INIT_1F => X"006a0000000000a900000000003e000000000000000000000000000000000000",
       INIT_20 => X"014000a9003500a20047004500af004900920000000000000000000000330000",
       INIT_21 => X"006200000000000000aa00000000001d00000000000000000000000000000000",
       INIT_22 => X"00000000000000000000000000000000000000000000002e0050000000000000",
       INIT_23 => X"0000000000250034001c00000000003300000000000000120049001600b90000",
       INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_25 => X"000000cf009d00f500bc001b00780000003c0064017700b1010c010100db00ec",
       INIT_26 => X"00aa00b800560137007a013100e800a0000000fd000e0072002000a70000000f",
       INIT_27 => X"005c0000000000150088000000000000000000000000000000000000014b001a",
       INIT_28 => X"004500000000000000000000004d001800000000000000120086003300410009",
       INIT_29 => X"0000000000050000000000000000003e00000022001800f10039001c00000000",
       INIT_2A => X"0000003200000000000000000000000000000000000000000000000000000000",
       INIT_2B => X"0000000000450030000000000065000000000023000000000000000000000000",
       INIT_2C => X"0000000000000000000000000032004600000000001700240000000000000060",
       INIT_2D => X"00000000000000000000002300aa000800000000000000000000000000000000",
       INIT_2E => X"0000014e011a0173010d00bb00010069007b011e000000000048004b000b0049",
       INIT_2F => X"0126015000a40000000000000000000000000000000000000000000000000000",
       INIT_30 => X"000000000000000000000012000b002100dd00a4006d003500ab00a900000000",
       INIT_31 => X"00000000000000000000000000000000001c0000000000000000000000000000",
       INIT_32 => X"0000000000650000000000000000000000070010002f006400e900ca00000108",
       INIT_33 => X"00c0008a000000000000000000000000000000000000004e008200ab00cc0081",
       INIT_34 => X"0053006d00b8008100000000000000000000000000000000000001d1003a00e6",
       INIT_35 => X"008a005000710000000000000000000000000041000000000016000000000000",
       INIT_36 => X"0000000000000084000000000045000000000000008900920068008700ce0033",
       INIT_37 => X"0000002100b30000005600460036006700140000000000000000000000000000",
       INIT_38 => X"00000000000000470000000000000000000200000000000000f6010b0113010e",
       INIT_39 => X"004c0000009f0006004800000000000000000000000000000000000000c60000",
       INIT_3A => X"002600a20000002700770000000000dc00b5019f0000001800000049000f0069",
       INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_3D => X"000000000000000000540019000000000055003c000000380003000000000000",
       INIT_3E => X"00950062000200000010000000000000000000000000003500000000004c0098",
       INIT_3F => X"000b00190000000000b50000001b000000000000000000000000000000000000",

       -- The next set of INIT_xx are valid when configured as 36Kb
       INIT_40 => X"000000000000000000000000001200000000001d0090008800f200000080006f",
       INIT_41 => X"00aa00ef00f50000000000000000000000220000000000010000000e000000a9",
       INIT_42 => X"004b0097008a00a200d6000000b8000000000043000000000000000000000000",
       INIT_43 => X"0058000000000053004800000000000000000000000000000000000000000000",
       INIT_44 => X"014100000000019b000e0000004e010a00750032004d0000013a015601220000",
       INIT_45 => X"017201d40000000000000000000000000000000600ce00000000000000000000",
       INIT_46 => X"0000000000000000000000000000000000000000000000000000000000aa00c8",
       INIT_47 => X"000000bb0000000000000000016000440000011c000000000000002c00620000",
       INIT_48 => X"000000000000000000000000000000000000000000000000000000000000002c",
       INIT_49 => X"000000b30000000000e5000000000060005800ec00000000017400000000002e",
       INIT_4A => X"0000000000000000000000000000000000000057000000000000000000000000",
       INIT_4B => X"00000000002e000000000000000c000000120000006b00000009000000000000",
       INIT_4C => X"0000006c00210029006e00820000005f008a009201790174019100bb00530000",
       INIT_4D => X"004b004100000000000000000000000000000000000000000000000000000000",
       INIT_4E => X"00000000000000000000003f00580048000000000000000001730000000001f8",
       INIT_4F => X"01ce0000009a00830000003c00690000006200000000000000000000002c0000",
       INIT_50 => X"000000150089000000b800ac0054006f000000de015a01d900c6012200810019",
       INIT_51 => X"0000000000000022009f00000000014400000000000000000000000000000000",
       INIT_52 => X"000000000000000000920000000000fb000000000169005600cb018c00070000",
       INIT_53 => X"00d90044003c0000000000000000000000000000000000000000000000000000",
       INIT_54 => X"00000000000000000000011000f90077016a0043000000d70000000000000000",
       INIT_55 => X"00000000000000000000000000000000009f0000000000420134000000fb00a9",
       INIT_56 => X"0000005400000000004b0019004c000000580000006500290000000000000063",
       INIT_57 => X"00000000000000000000003c00000000002b000400810064007700f200380000",
       INIT_58 => X"000000d70000000000000000000000000000000000000000000000000053007c",
       INIT_59 => X"00000000007b001a005400000161004000000174004200000000008500000017",
       INIT_5A => X"0018004a002e0000004d00ea00000000000f0000001a00000098000000000000",
       INIT_5B => X"0000008e0000000b00000035015200000000012400b90000000000d200000000",
       INIT_5C => X"0098000000740052000b005c01d1009e013100400111010b0027000000000000",
       INIT_5D => X"0000001501570000000000000000000000000000000000000000000000000000",
       INIT_5E => X"000000550000000000000000000000000000010d00000000000000c7005d004a",
       INIT_5F => X"0000000000000000000000000000000000080000000000000000002100c20000",
       INIT_60 => X"004f0043000000000000000000b9004e00000000000000000000000000000000",
       INIT_61 => X"0000000000000000000000000017000000000000000000000000000000690000",
       INIT_62 => X"000000db010a0000000000000000004d000000be002200480000006901440000",
       INIT_63 => X"000000c40000002600ef0000011e005500000127000000000087004e0058007f",
       INIT_64 => X"001f000000cf000000aa00d3002200000056000000e401a800ca0129017c0141",
       INIT_65 => X"00c001690184000000000000000000000000000000000000000000000000006f",
       INIT_66 => X"000000000000000000000000000000370000000000000102005e000000000082",
       INIT_67 => X"0064000000dc0000000000000000000000f90000000001ba0184000000ac00a4",
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
