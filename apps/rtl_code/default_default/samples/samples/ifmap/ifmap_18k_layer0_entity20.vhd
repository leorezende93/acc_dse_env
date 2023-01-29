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

entity ifmap_18k_layer0_entity20 is
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
  end ifmap_18k_layer0_entity20;

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
       INIT_00 => X"000d000b000e000a0009000a0005000200030003000100020004000600050000",
       INIT_01 => X"000100000023005600160017001d0008000d001b0027001d0013000800060005",
       INIT_02 => X"000d000c000a0004000700080003000000040002000100010002000400040001",
       INIT_03 => X"000100010010001300070006000600070021002e001700160013000800040006",
       INIT_04 => X"0007000400030000000400040001000000040004000400040004000600050003",
       INIT_05 => X"00040003000c0009000400070006000a00280023000d000c000f000600030006",
       INIT_06 => X"000100030008000b001200040003000300050006000800070008000900060006",
       INIT_07 => X"00070005000a00090004000a00100017001e00160011000e000f000600050008",
       INIT_08 => X"000c0013001d001a001700060007000800070008000900080009000a00070008",
       INIT_09 => X"0009000700080007000800250040002700100010000e0015000e000f000d0009",
       INIT_0A => X"0018001e0016000c0009000600090008000500050009000a000b000a00070009",
       INIT_0B => X"000a000b000b000700140055005d003b0022000e001300200017001b00100009",
       INIT_0C => X"000c000b000a000700080008000a000700060005000a000e000d000c000a000c",
       INIT_0D => X"0009000e000e000700250056003c00280035001c001c001c0014001000060007",
       INIT_0E => X"0003000600060007000b000a000c000900090008000c000e000e001200100013",
       INIT_0F => X"00100015001a00160031003e0014000a001e001a0010000d0009000800040007",
       INIT_10 => X"0007000a00090008000b000a000e000b000d000c000e000f0013002400220028",
       INIT_11 => X"00240020002200220033002b000f00090014000c0009000a0008000800080008",
       INIT_12 => X"000c000c000b0008000c000a000e000d000e000e001400220027003100280026",
       INIT_13 => X"0020001b002700320036003b0034002600230015000b000c00060009000b000a",
       INIT_14 => X"000c000b000b0009000c000a000d000d000d0010001b0028002000320032003f",
       INIT_15 => X"0058007700a100b4007900710054002200320031001d00110009000a000c000a",
       INIT_16 => X"0009000a000e000b000e000c000d000c000c001200180027004d009300af00ba",
       INIT_17 => X"00c800c800d200ca00b100d5009e001c0013002200460025000a0009000b0009",
       INIT_18 => X"0008000a000f000d0010000e000d000e000c0018003e006c008e00a20093007d",
       INIT_19 => X"006e005e0054004a007e00f100d70054000c0009003400490019000d00090008",
       INIT_1A => X"000b000b000f000e00110010000c000e001400440067005d0056005f003d0019",
       INIT_1B => X"0016002300110017008900eb00eb00a7002a0007001700420028001100090007",
       INIT_1C => X"000f000d0012000e00100012000b001200360053003b002e004400530037001b",
       INIT_1D => X"000c0027001c004c00c800e800e700e0007300160013001a001f0016000d0008",
       INIT_1E => X"0010000d0013000e000e001e00390037004f00350039003c0052004e00320029",
       INIT_1F => X"00230047007c00c800e700e600ec00dd007e0044001a000e00200049003f0009",
       INIT_20 => X"0011000e001300110018002f005d005c004f0062003c003d004c0047005e00a6",
       INIT_21 => X"00c600e200fa00fc00ed00f000e7007c002a004a001c000c004c0095007e0011",
       INIT_22 => X"00120010001200150024002a003800480060005800240024002d0022009a0100",
       INIT_23 => X"00fa00f900f400ed00ed00ee009600270015002e003b004d008e00ae00a30026",
       INIT_24 => X"0011001000100022005c0049003c00420054002c001c0021003e003700ae00f0",
       INIT_25 => X"00e100d900d900e700ef00ee00b100560045006a009200a400a400a100a90037",
       INIT_26 => X"000d000a0020007d00b40062003500380048001c000e001b0049005900b900e0",
       INIT_27 => X"00d500d500e400e300d700e100f200c000a500b400b500b000a6009f008d002a",
       INIT_28 => X"000c0007006500e500c9007b003e00390041000f0009000f0026004f00bf00da",
       INIT_29 => X"00d000db00d8008a0058006d00b800e400da00c900bf00b500a60093004d000e",
       INIT_2A => X"000d0018008b00b300a2008d0045003d00230004000b001b0036005600c200d4",
       INIT_2B => X"00cc00db0088002400200022004000b100dd00cc00ad009f00900049000f000d",
       INIT_2C => X"00090027005b00310060008f004c003e00150007001500510079008300c500d0",
       INIT_2D => X"00d100c1003800260037002e0019005900b200a90095008d0048000e00080014",
       INIT_2E => X"00050022003b003000530095005c002d000f0013002a0064006f008c00db00db",
       INIT_2F => X"00de00a0002600330025002300240027008200a4009b006e001d000c0016001e",
       INIT_30 => X"00070017003a004d005400940065002a0016002b004a0065006400a800dd00d3",
       INIT_31 => X"00d40089002b0040003f003400230015005600a2009a004e001300120018001c",
       INIT_32 => X"000900150037004c0052008c0065002500210043006c007f007e00b000c300c2",
       INIT_33 => X"00c900870030004600560041002e001500320083007b0031000b000a000b0014",
       INIT_34 => X"000b001700310049005700840078004b005d008600b100c800c800cf00d400d5",
       INIT_35 => X"00d60094003500480071006e0040002200180055004c001600070009000d0016",
       INIT_36 => X"000f00160025004e00570073006000480052005d006900720077007d007e007b",
       INIT_37 => X"007c00660030004c004b004e0029001b00090018001000060008000a000f0019",
       INIT_38 => X"0015001f0023002b003200300019000c000e000e0011001100140018001a0019",
       INIT_39 => X"00180014000d004a004e003b00410012000300050004000300050009000d001a",
       INIT_3A => X"00210028002c0025001e0017001e0025001c0019001c001c001b001800170013",
       INIT_3B => X"000f00090006001c00470053002f000800020005000500040006000b0015001c",
       INIT_3C => X"002500290030003b0049004f005c00590038002f0038003b00390030002b0028",
       INIT_3D => X"0023001b00150015002100250010000800080009000a000a000d0012001d001c",
       INIT_3E => X"002c00310046006500800080007600630047004e00540055005700530051004f",
       INIT_3F => X"0047003c00310031003a00380020001300130018001800150019001f0022001c",

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
