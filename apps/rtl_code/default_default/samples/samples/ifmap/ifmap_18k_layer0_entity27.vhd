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

entity ifmap_18k_layer0_entity27 is
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
  end ifmap_18k_layer0_entity27;

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
       INIT_00 => X"00d900d200cd00c700da00d600cf00bd00bb00ae00a600a90096009a008c008f",
       INIT_01 => X"00a700bf00db00df00db00d700e200e100db00be00af00bb00c800aa00a100a2",
       INIT_02 => X"00de00dd00dc00d700d800e100d300b300b400c000be00bc00c700ce00d100db",
       INIT_03 => X"00e500eb00ec00ec00e900e200e100e500e700d400d000cd00d800b700ba00c8",
       INIT_04 => X"00ea00e900e700e800e900ef00d900ad00a400b400ad00b700be00bc00d400e0",
       INIT_05 => X"00da00eb00e300e100e500df00d600e100ea00e800e600d800d100ca00d000d3",
       INIT_06 => X"00f500f400f400f200f400f300e4009e0092009d0083009f0091008800a2009f",
       INIT_07 => X"00a900cb00c300d300d100cb00d000e200e600e900e400d500c700db00e000d4",
       INIT_08 => X"00f500f300f400f400f500f100cf00750063006c0059006b0064005b0064005c",
       INIT_09 => X"0066007c007c009500b600b900ca00e900e100e200e300cd00c200d500e200de",
       INIT_0A => X"00f500f400f400f300f500ed00d8007e0048005a005b006600650067006b0063",
       INIT_0B => X"00590059005b005d007e00be00d800eb00e700df00d800c400ae00bd00d900ec",
       INIT_0C => X"00f500f300f300f400f100db00d9009e0050007200840097008c0084008f008a",
       INIT_0D => X"0082007a00720078006e009b00dd00e900eb00e000c600c000a700ab00cc00eb",
       INIT_0E => X"00f400f300f300f600e300c700d700990051009200bb00ca00cf009e00830083",
       INIT_0F => X"0081008d00830084009f0084009f00d700e500d700d400d100c500ab00b200dd",
       INIT_10 => X"00f400f300f400f500e300ce00da0082005100820080008100b800910074007d",
       INIT_11 => X"007c0089008e007d00990093009000c600d600db00e900dc00b800a400a900c9",
       INIT_12 => X"00f300f300f400f200e400be00a8006e005300860077006e008f008000730078",
       INIT_13 => X"007d00830092007d0095009b008c00c400e900f000f000e900c800c800d700dc",
       INIT_14 => X"00ef00f100f400f500dc00850082005f004e00740074006c006d006b006d006c",
       INIT_15 => X"007300780078007300880096008f00a700d000e400f500f300f400f500f500f4",
       INIT_16 => X"00de00e900f200f400d800a900a50059003d0043005b0064005f005f00620060",
       INIT_17 => X"0060005f005a0061006900790081007e009b00d800f800f300f400f400f400f4",
       INIT_18 => X"00d000df00ec00e300bf00b700b500640037003800580065006f006300560054",
       INIT_19 => X"00520054005d0071006d00620070008100ae00e200f500f400f400f400f400f4",
       INIT_1A => X"00c800cc00db00c300aa009a009c006600680063006c006600730075005e0055",
       INIT_1B => X"005a006a007a008c00800068006c007c009600b300c300d400ef00f500f400f4",
       INIT_1C => X"00c800d200cf00a900a400940093008a0081005c006a005d0059005d0054004d",
       INIT_1D => X"004c005100510051004f004a004b00520065007b008c008f00bf00f400f400f4",
       INIT_1E => X"00d200e200c400770070009600ba00c0006c004d004d0037002d002f003c003f",
       INIT_1F => X"003b003f003b003600310032003d00400047004b005b0067008700e100f600f4",
       INIT_20 => X"00c700c100b40060005d009100c000a100560049005c00620068004f004f0047",
       INIT_21 => X"0025001c001e001b003400320016001c00180035005b0068008000ce00f700f3",
       INIT_22 => X"00d300c700c200710078009d009f00470044005a0074007c0095007900800066",
       INIT_23 => X"004e00620070006400940093005c0063005e006c0087008e009c00b700f200f5",
       INIT_24 => X"00dc00ca00b70066006e00a50084001e00390062006b00530052006500810064",
       INIT_25 => X"009900ae009e009f00ac00a800a200a300a000af009c00770072008700e400f7",
       INIT_26 => X"00db00cf00bc00620053008d006f002a003a0048004c003e003500380040005d",
       INIT_27 => X"00a0007c005b00650074006b006700670063009b007e00430051007600d900f8",
       INIT_28 => X"00d900d200c7006500380058005d003c0038002e003f0046003c003600400041",
       INIT_29 => X"006300720069006700640060005d00610066006f006400490052007200d400f9",
       INIT_2A => X"00d100cd00ca0075005300460051004400320023002b00330044004d0057003f",
       INIT_2B => X"003400470052004800400043003e005d0058003c0053006c0070006c00cc00fa",
       INIT_2C => X"00cd00ca00c50068005d006f00470049003f002900260022004b0063008e004f",
       INIT_2D => X"001e005600930076006300720066009900b2003f004a008d0077005a00c300f6",
       INIT_2E => X"00c600c200b900570031006c00610063005f0033002700240028003200570037",
       INIT_2F => X"0020004f0097007f007a00880074009c009f00370035004a003e004e00c200f0",
       INIT_30 => X"00b600b400a9004d0025003b006c0090006a003c002b0020001d001c001e0021",
       INIT_31 => X"0027002a003a0058006a0079007a00750043002f003300320033005000ba00e1",
       INIT_32 => X"00a800a500a4007d005b0060006f008d0060004a00370024001e001e001d001f",
       INIT_33 => X"00230018004000ae00cd00cb00b300b500570026002b00300042005b00ae00d3",
       INIT_34 => X"00a200a300af00b400980076006c008d005b0053004e0030001900180019001d",
       INIT_35 => X"00270026004700a400b800b100a900a60051001e001e0031004e005f00a900ce",
       INIT_36 => X"009a00ac00b300a6009200750067009200570055005200360020001e00210025",
       INIT_37 => X"0036004d00560065006b0079008e0089003c001e00210036004e005b00a500c7",
       INIT_38 => X"00a600a9009e0094008f008500670071004f0051004b003c002a0027002a002c",
       INIT_39 => X"003000360041004d005a006e0083008b0035001d002600360046005b00a900c4",
       INIT_3A => X"00a200970093008d00890085006b004e0048004e0046003c0032002a002e0030",
       INIT_3B => X"00310033003b0042004c0059006500710045001d00230034003f006200ae00ba",
       INIT_3C => X"0094008d008e008c008f008c006a003c0042004a00420037003900340036003a",
       INIT_3D => X"003a003a00410046004900500057005d004d002500260037004a008300b300b4",
       INIT_3E => X"0090009500a000a2009e0092007e003d00390039003a00430046004500490048",
       INIT_3F => X"0044004900590062005e0061006300610052004500400047007700a400b600ba",

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
