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

entity ifmap_18k_layer0_entity16 is
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
  end ifmap_18k_layer0_entity16;

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
       INIT_00 => X"007600600031003b0060005f00540053005f00610053005a005c0052004b004f",
       INIT_01 => X"005b0050003b00320037003800380033003c00380033003a004c0035002f002f",
       INIT_02 => X"0082005800590069006c0060005d006800650062005a005b00540057004f0048",
       INIT_03 => X"00520048003d00320037003800370033002b002800350041004b003d003a0039",
       INIT_04 => X"008400680081007a006c0059005f006a006200690062005e00550050004f004c",
       INIT_05 => X"0055004c0036002a0033003a003f0042003c0042004300420043003e00380039",
       INIT_06 => X"0081007f008800840070005a0068006900650071006500660067005a0057005d",
       INIT_07 => X"004f004e0033001f002a00330039003e0046004d004b004a003c003700430045",
       INIT_08 => X"0080007f0079007f006d006300720072006f006f00700071006c00630059005c",
       INIT_09 => X"005e0059004e002c002700340038002e00350043004700490042003b00450047",
       INIT_0A => X"008900830068007f0076006a007100740073007500740071006d0069005a0054",
       INIT_0B => X"006a00680067004f003a004d0052003d003e003f00430046004900480046004b",
       INIT_0C => X"0098007700660087007a00750073006f0079007b007c0070007300710066005c",
       INIT_0D => X"00640065006d006e005c0057005b0043003e00400038003b00450048004a004e",
       INIT_0E => X"009300590078007e00780076007200790080007a007c00730073006d006c0064",
       INIT_0F => X"00650068006d006a0066004b00570048003b003c002e0035004200440049004b",
       INIT_10 => X"0076006f0078007200770074007500770080007a006f006d007300670061005e",
       INIT_11 => X"005e005900610064006d005f00720059003e003a00400047004600480048004b",
       INIT_12 => X"0077007100690078007c007a007b006f0076007b007d00790076006d0065006f",
       INIT_13 => X"0069005500520060006a0064007a0067003d003e004700490047004b0044004b",
       INIT_14 => X"006400480072007e0078007f007c007e007f00810080007b0079007700780090",
       INIT_15 => X"00830063004f0058005f0061006c005b002e003e003d003b004000460049004c",
       INIT_16 => X"00220034007f0069005d007a00840083008100730078008c00a6009700740085",
       INIT_17 => X"008d006e005600610060005c00560031002a003c003e003c003e00420045004a",
       INIT_18 => X"00040040008e007d008c009a008c0084007f006b007b009c00b2009300770053",
       INIT_19 => X"0040005b00530064006f005c004d00310029002f00370039003b004300420044",
       INIT_1A => X"00180048007a007b009c0096008f008d0077006a008f00a00097008100800077",
       INIT_1B => X"004d00740073006d007b005a0044002d0023002b00330037003b003e003a003e",
       INIT_1C => X"00450052004a0070009600910086008f0083008400a1009c007d007200850097",
       INIT_1D => X"009100a0009200980081005d004b002f002f003000380044003c003c00360039",
       INIT_1E => X"00570041003b0070009800960086007d008f009b00a700a5009b0084008f00a0",
       INIT_1F => X"00a2009e009f00a100890078005400390033002b0040005f0051003700360039",
       INIT_20 => X"0058004e004000660090008d0081006c008b00a500af009d009e00860086009f",
       INIT_21 => X"009a009400930098009a008700490031001e0023004b0067006f003d002c0039",
       INIT_22 => X"0056005700570074008f009300910069008000b30085006c0091008b007a0079",
       INIT_23 => X"007d0087007c007900720058002a00180013001d00490066007500500027002e",
       INIT_24 => X"005c005c004d0076009c009900910062005c00aa0074007a00a50083004b0062",
       INIT_25 => X"004c0061005500400036001b0011001b001a002800450075007f006400240028",
       INIT_26 => X"005e0054003c006e009c00a3009b00730027007c00940089009500710057009c",
       INIT_27 => X"00780050003d0027002700180022002e001f002d004500780099007b00220020",
       INIT_28 => X"0061005d00590072009600a200980075000d001d00640074007300560049007c",
       INIT_29 => X"0086005b002f001b00310032003100320019001e0042007d00a2009600380020",
       INIT_2A => X"006a006800570063008d009600810057000f000b00160025003600390029003e",
       INIT_2B => X"005300480036001a00200023002200330028002b003e0070009b009e004a001f",
       INIT_2C => X"00700068004f005a007b008900730042002f004200280017001b0026002c0045",
       INIT_2D => X"0036001f0026001d00190016000f001f00310033003a004e008600940057001f",
       INIT_2E => X"006d005800590060006900810073005e006100470036003c0042003e004b003c",
       INIT_2F => X"001a000a0009000e00110013000b000c0017001f003a003b005e008800690023",
       INIT_30 => X"005b00460060007000600068008900930075003a00450043004a0045003f0035",
       INIT_31 => X"002900190013000d000c0009000d0012000c0024003e00270034006800790047",
       INIT_32 => X"005b005c006200620061005600690086008e006b007c006100440049004e0049",
       INIT_33 => X"003e002b0026001c0016000e000b00140014002a003000140025003800580064",
       INIT_34 => X"005b005e006100620071006f005b004c0084006e005000510047005f00630054",
       INIT_35 => X"0048003d003800330035002b0020002b002e0028002500280040005a00300042",
       INIT_36 => X"00570060005000520071006d00620048005c007300450046004a005e00600058",
       INIT_37 => X"00450047004c004a0042003c003d004b00490040003f0041004c005e0036003a",
       INIT_38 => X"006000610043004c0069005a004e005000570048004c00620057005c005d005a",
       INIT_39 => X"004f00540055004600420048004d0057005300520050004f004300350046005e",
       INIT_3A => X"00490054005100650061005b0058005b00690059005b00630059005d005d005a",
       INIT_3B => X"005800550049003c004900520054005b005d0056005700550043004400570064",
       INIT_3C => X"00530060006a00710060005f0060005f00660069006d0068005b005a0052004a",
       INIT_3D => X"0052004e004d004a004d00550057005c00640059005a0054004e004d0057005a",
       INIT_3E => X"005c006b0071006800520042004d005c005f0051005b005a0058005b004d003d",
       INIT_3F => X"0046004d005600520053005c005b00600065005c0057005b005c005a005b0057",

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
