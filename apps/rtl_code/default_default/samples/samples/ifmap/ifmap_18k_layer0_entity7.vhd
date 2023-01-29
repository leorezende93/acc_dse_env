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

entity ifmap_18k_layer0_entity7 is
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
  end ifmap_18k_layer0_entity7;

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
       INIT_00 => X"00be00bb00a6009e00c100d000d300d800db00dd00de00da00e500e800eb00ed",
       INIT_01 => X"00dc00e900ee00ef00f100ef00f100f100f200e700eb00f300ed00e700ef00f1",
       INIT_02 => X"00c800c700b000a000c700d900da00da00df00e500e500db00e900ee00ef00f3",
       INIT_03 => X"00e100ea00ee00f500f700ed00ef00f500f500e900ef00f800ec00e800f600f7",
       INIT_04 => X"00c900c800b300a200c900dc00df00d600dd00e900e200db00e500ea00ea00f4",
       INIT_05 => X"00e200e900ee00f300eb00d600ea00f100f700e900f000fa00ee00e500f900f4",
       INIT_06 => X"00cb00c700b300a400c900d900e100d900df00eb00e300d900dd00e800e200f4",
       INIT_07 => X"00e400e700ed00eb00b800af00e400f100f800e800ee00fa00ed00e300f700f2",
       INIT_08 => X"00cf00cc00b500a100c900d600e100d500d700ed00e200d700d900e500d400ec",
       INIT_09 => X"00e300e100ec00e100aa00ae00e000ec00f700e700eb00f600e700e700f500ef",
       INIT_0A => X"00d000cd00b7009a00c900d400e200d700da00ee00df00d700d700e500c700cd",
       INIT_0B => X"00d100d000ef00cc007c00a700e300e900f600e500e100ef00e200e600f100e8",
       INIT_0C => X"00cc00c700b3008b00c200cb00dd00d500db00e900d800d400d800e600bc00b0",
       INIT_0D => X"00be00c000d400c00081009700b700be00e000e000d600e500db00de00eb00e0",
       INIT_0E => X"00cd00c600af008a00c000cb00ce00cc00d400df00d000d200d500d800c700ce",
       INIT_0F => X"00b200950071005d0055005000500045006c00b700ce00de00d000c500dd00d4",
       INIT_10 => X"00ad00a8009a008500a500ac00a000b300be00c200bd00c300c700bf00c100c6",
       INIT_11 => X"00980079006b006c00680068006e004f0052007a009f00af00a3009500be00af",
       INIT_12 => X"0073007400720069006d006e0070007f00870088008c00930097008f009e00a1",
       INIT_13 => X"0086007700780078006c006c0066005c008f008000970091006e006a00820078",
       INIT_14 => X"004e00570056005200630069006100640065006d006a006f007200760084007f",
       INIT_15 => X"006d006d006e006b00600057006c00770084006f009000bf0078006f00660068",
       INIT_16 => X"004a0055005f00620080007a0062005100680081007100730084008b0086007b",
       INIT_17 => X"007800730074007700710068009e00bd00b70094006d00c50095006700630063",
       INIT_18 => X"0051006b0071005d00750073005d0066008900980095008300820088007d0071",
       INIT_19 => X"006c006c0072007b0076007f00af00c200ce00bd007600a200a7005000620065",
       INIT_1A => X"0061006e006a005d0062005400590064006e007b008a0086007e00830082007c",
       INIT_1B => X"007b007f007e00870086009900b500b400b800b70097007a00a0004d00480059",
       INIT_1C => X"0066006500660061005f00580058006b0082008e0097009e00a300a400a1009d",
       INIT_1D => X"00ab00ad00aa00a900a200a900b100ae00b000a800a4006200570046003f004b",
       INIT_1E => X"007b0076007f007c007e0094009800a000a700af00b300b400b700b800b900ae",
       INIT_1F => X"00ad00b200af00a000800085008e00a100a900a200a6006c0046005f00590052",
       INIT_20 => X"0085007d008a00980094009a00a600a700aa00ae00b300b600b900b900b500ab",
       INIT_21 => X"00980098009a008b006600780090009b00a500a200a30088009100bb0099006c",
       INIT_22 => X"007c0085008d008300740072009800aa00af00af00b000ad00a700a0009a0097",
       INIT_23 => X"0090009600a800a0008c009800a5009e00a3009b009c0097009e009e00980093",
       INIT_24 => X"008100710060005d006e0087009400a400a9009f0096009200940099009f00a5",
       INIT_25 => X"00aa00a000a800ac00a100a400a800a400a0009e009e009200840079007d0096",
       INIT_26 => X"0070005500600087009b00a5009c0093008e008d009700a000a700ad00ae00ab",
       INIT_27 => X"00a7009b00a200a800a300a100a300a6009e00970082006f00620052005c008a",
       INIT_28 => X"008500840087008f008f008f0096008e008a00a100a900ab00a900a500970086",
       INIT_29 => X"0074006b009400a400a300a3009f00980080006c0066005b004b004e00500048",
       INIT_2A => X"0084008c0090008f0090009300970096008b00920094009a009f009c006e004e",
       INIT_2B => X"004b004a008400a30099008f007e006d00670064005a004c004b005200390021",
       INIT_2C => X"005e0089009400920092009100810073006a006600630087009d009a0072005d",
       INIT_2D => X"00650068007d007c0071006a006600650058004f0045003f004300350025001f",
       INIT_2E => X"0056007d0086008600890085005c004d00520059005c00830099009600840073",
       INIT_2F => X"006a00610060006100630065005f004f003c0040003c0039002f00260022001f",
       INIT_30 => X"005a0074008100830089008a006a0061006c0074007c007e0071005f00540053",
       INIT_31 => X"0059005c00620064005c004a00430045004a00420033002e002b002600230020",
       INIT_32 => X"005c00700082007f007c0078006e00660061005a0050004c004b00500054005b",
       INIT_33 => X"005f005900510049004100410043003d0045003a002a0028002a002800230025",
       INIT_34 => X"004c004f0056004e004a00450040003f00410046004a004d0051005200510050",
       INIT_35 => X"0049003b003700440043003f003600320036002d002800280029002800270025",
       INIT_36 => X"002d002b0028002a003100340035003a00440047004800460041003b003a003b",
       INIT_37 => X"0038003f0055004900390033002f002f002c0028002700280029002a002a001d",
       INIT_38 => X"002b002800240026002c00300031003200350034003100310035003b003e003d",
       INIT_39 => X"00370045005e0042002c002e002f0028002700270028002a0029002e00200012",
       INIT_3A => X"0028002700230024002700290029002b002e00330038003a003d003d003c0037",
       INIT_3B => X"002e003c005500360028002e00250024002600260028002a002b0028000d0007",
       INIT_3C => X"0022002600240028002c002f0031003300360039003b0039003900370033002b",
       INIT_3D => X"001f0030004e003200290025002300230025002500240029002d001400060007",
       INIT_3E => X"0029002b002d002f0030003000300031003200330031002d00280022001a0011",
       INIT_3F => X"0008001b003f002c0021002200220023002300220022002c001f000600050008",

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
