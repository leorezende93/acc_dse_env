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

entity ifmap_18k_layer0_entity0 is
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
  end ifmap_18k_layer0_entity0;

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
