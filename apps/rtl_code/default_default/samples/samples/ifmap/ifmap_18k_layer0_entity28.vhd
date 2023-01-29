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

entity ifmap_18k_layer0_entity28 is
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
  end ifmap_18k_layer0_entity28;

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
       INIT_00 => X"00d700d000d000ca00d700d100ca00b900b800a8009800a0009d00a7009a009d",
       INIT_01 => X"00b500cb00e100e100de00db00e500e400dd00c500b800c400d000b800b000a5",
       INIT_02 => X"00e200e000e100d900d500dd00cc00ab00b400bd00b200b100c400cd00d000e0",
       INIT_03 => X"00ec00f000f200f300ee00e500e400e700e700d600d400d200de00be00bf00c5",
       INIT_04 => X"00eb00ea00ea00eb00ea00ef00d600a600a600b100a800b100b800b700ce00df",
       INIT_05 => X"00dc00ec00e300e800eb00e400d900e000e900e900e600dd00d900ce00d100d2",
       INIT_06 => X"00f500f400f400f300f400f400e300990092009b0082009f0090008a00a200a0",
       INIT_07 => X"00ac00cd00c200dc00de00d300d300e000e600e900e500db00cf00df00e200d4",
       INIT_08 => X"00f500f400f400f400f500f000cd00700062006d005b006d0065005c0064005c",
       INIT_09 => X"0068007d007c009a00c200c200c900e300dc00de00e300d300cb00dc00e800e1",
       INIT_0A => X"00f500f400f400f300f600eb00d4007b0047005d005f00690067006a006e0066",
       INIT_0B => X"005b0059005b005d008100c500d900e600dd00da00d600c600b400c500e200ed",
       INIT_0C => X"00f500f300f300f400f000d600d5009c004f00770089009a0090008b009b0096",
       INIT_0D => X"008e00800079007e007200a000e100e900e900da00c000ba00a500b000d400ec",
       INIT_0E => X"00f400f300f300f700e200c100d300960051009800bc00c800cd00a5008d0090",
       INIT_0F => X"008e0096008d008f00a7008c00a300d600e000d100d300d200c700ae00af00dc",
       INIT_10 => X"00f400f300f400f500e100ca00d8007f005100860084008700b90097007c0087",
       INIT_11 => X"008600910096008800a4009e008e00c000cf00d800e700d700b1009e009c00c4",
       INIT_12 => X"00f200f200f400f200e300bd00a8006e0053008c0080007600930087007c0081",
       INIT_13 => X"0085008b00970086009e00a4009100c100e500ef00ef00e600c100be00cc00d7",
       INIT_14 => X"00e800ef00f300f400da00810080005e004f007a007a00700071007000730073",
       INIT_15 => X"007c0080007f007e0090009e009900aa00ce00e300f600f400f300f300f500f4",
       INIT_16 => X"00cd00e300f200f200d300a1009f0058003c0045005e00660062006100670066",
       INIT_17 => X"00680064005f00670071007f00890080009900d700f800f300f400f400f400f4",
       INIT_18 => X"00bc00d500e400dc00b400aa00ad006300370039005a00660072006700580055",
       INIT_19 => X"00550055005d0073007000650076008600b000e100f500f400f400f400f400f4",
       INIT_1A => X"00b800bc00ca00b500980086008d006300670066006f00670076007800600056",
       INIT_1B => X"005c006b007d00920084006a006e007f009800b300c300d200ee00f500f400f4",
       INIT_1C => X"00b600c200bd00980092007b007f007e007c005d0069005e005a005d0055004f",
       INIT_1D => X"004e0053005400550051004b004c00530065007a008a008a00bc00f400f400f4",
       INIT_1E => X"00bd00cc00a700650065007d00a900ae0067004d004f0036002b002f003b003e",
       INIT_1F => X"003b003e00390034002f0030003d00400046004a005a0061008000df00f600f4",
       INIT_20 => X"00ae00a4009700540052007c00ac0092005300490057005a0064004b004c0044",
       INIT_21 => X"00210017001a00170030002f001400190015003200560064007800ca00f700f3",
       INIT_22 => X"00c000b400b3006800680087008e004000410057006c007800950076007d0062",
       INIT_23 => X"00460059006a00600090009000590060005a00670082008b009700b200f100f4",
       INIT_24 => X"00d100bd00ab005e006200920076001c0036005f0067004f005300640080005f",
       INIT_25 => X"009200aa009b009e00ab00a800a000a1009e00ac009b0077006f008000e200f7",
       INIT_26 => X"00d000c100b0005b004c007f00640028003500440049003900320035003d0059",
       INIT_27 => X"009c007700570062007100680063006400600098007a003f004d007000d600f8",
       INIT_28 => X"00ca00c300be005f0033004e0053003800330027003c004400390033003b003d",
       INIT_29 => X"005f006e006600650063005f005c00600064006c00600046004f006c00d000f9",
       INIT_2A => X"00c200c000c0006e004c003e0049003f002e001d00280030004100480053003b",
       INIT_2B => X"00300043004d0043003c0040003b005800520036004e0069006b006500c900f9",
       INIT_2C => X"00c300be00bb00610055006300410043003a00260023002000480060008d004c",
       INIT_2D => X"0019004f008c0071005e006d0061009200ab003a0045008a0074005300c000f4",
       INIT_2E => X"00bd00b700b00052002c00630059005e005a0030002400210026002f00550034",
       INIT_2F => X"001c004a0091007b0077008600710097009c003300320047003b004700c000ee",
       INIT_30 => X"00ae00ad00a30048002200360065008b0066003a0028001e001a0019001a001e",
       INIT_31 => X"00250026003500560068007500760072003e002b0030002e002f004b00b800df",
       INIT_32 => X"00a200a0009e00780057005900670088005c004800340022001c001b001b001d",
       INIT_33 => X"00200015003d00af00cf00ca00b100b4005400220028002c003e005700ab00d1",
       INIT_34 => X"009c009c00a800b0009300700066008800560051004b002d001600160017001a",
       INIT_35 => X"00230022004500a400b900b100a900a5004e0019001a002d004b005c00a700cc",
       INIT_36 => X"009500a700ad00a1008d00710063008e00530053004f0033001d001c001f0022",
       INIT_37 => X"003200480051006100660074008a00850037001b001d0032004c005900a400c6",
       INIT_38 => X"00a400a6009b0090008b00820063006c004c0050004800380026002400270029",
       INIT_39 => X"002d0033003d004800540067007c00830031001a002100320045005900a900c3",
       INIT_3A => X"00a000940092008d00870082006600490045004d00420038002f0028002b002d",
       INIT_3B => X"002e00300036003d00460054005e006a0040001a001f0030003d006200af00ba",
       INIT_3C => X"0093008d008e008c008f008b006800390040004a003f00340037003100330036",
       INIT_3D => X"00360036003d00420044004a0051005700480021002300340048008400b600b5",
       INIT_3E => X"0092009600a100a3009d0091007c003a00370038003900410043004200460045",
       INIT_3F => X"004300480057005f005c005f0060005e00510044003e0046007600a300b600b9",

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
