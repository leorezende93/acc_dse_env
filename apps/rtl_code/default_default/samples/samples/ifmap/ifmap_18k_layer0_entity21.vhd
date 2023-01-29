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

entity ifmap_18k_layer0_entity21 is
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
  end ifmap_18k_layer0_entity21;

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
       INIT_00 => X"005300520051004d00510055005b005c005c005f0065005c005700520050004c",
       INIT_01 => X"00440041003f003e003c00380034002f002a0025002300220024001d00190015",
       INIT_02 => X"005400530053004d00500054005a005d005a0058005f006100580052004e004c",
       INIT_03 => X"0047004400400042003d00360034002e002a0026002400230024001e001d001f",
       INIT_04 => X"005200510050004b004b00540058004c005200560057006300650058004d004c",
       INIT_05 => X"0049004400400040003a00370034002d002b00280029002c0031003000310035",
       INIT_06 => X"005300510050004e004a005700500032005500610057005b0068006600580050",
       INIT_07 => X"00490040003f003f003b00380039003a003d003f004400470049004700450045",
       INIT_08 => X"004f004f004f004f004a0053004c003700530054004b004b004e0059005a0057",
       INIT_09 => X"0053004200430046004e005000540057005700560059005900580054004f0049",
       INIT_0A => X"004c004a004b004d00490049004600460046004500470049004b004e004e0051",
       INIT_0B => X"005a00590060006200640068006600680063005f0061005e0057005000490042",
       INIT_0C => X"004a004800470049004a003e002b00330044004000440047004b004a0051005e",
       INIT_0D => X"00600062006e0072006600640068006d0063005b00550050004c004900460043",
       INIT_0E => X"00470048004700480047003a002a002900390036003a003f0041004700520060",
       INIT_0F => X"0069005e005d00670067006a006c0061005d005b0054005000500050004f004d",
       INIT_10 => X"00490049004b0052005800670057002e003800380045005200510057005a0057",
       INIT_11 => X"00620063005e005b00610066006a0066005e00630061005c00590059005b005f",
       INIT_12 => X"0056005f006d007b0088009900680033003c003b004900610065006c0066005a",
       INIT_13 => X"005f00610061005d005d00630069006e00670069006c006c006d006e006e006e",
       INIT_14 => X"007f008b0096009d00a000a200570032004300380035005800650070006b005a",
       INIT_15 => X"005e0060005e00600060005f0060006500680071007d007e007b007700740070",
       INIT_16 => X"0098009d009f00a200a0009f005a002c00480045003a00560067005a0061005c",
       INIT_17 => X"005a0060005f005e006300620057005c0061007000830083007f00790074006c",
       INIT_18 => X"009b009e00a0009d009800940072003000440058005e0067007300600058005d",
       INIT_19 => X"005900650062005e00630065005400550069006e007d0084007f0076006b005f",
       INIT_1A => X"00940094009500920090008e00880050002f0048005e006800720071005c005e",
       INIT_1B => X"005d00670061005d0060006100550052006b006b006f0079007000640057004d",
       INIT_1C => X"00860087008a008c008e009300970089005d00490032003e0059005e005a0062",
       INIT_1D => X"0066006900670061005e005e00560053005f0065005c0066005f0052004a004b",
       INIT_1E => X"00830086008b00900098009f009a0098009e00760035003900670064005f0066",
       INIT_1F => X"006e0074006f006a0061005b00570055005400620055005300530055005a005f",
       INIT_20 => X"00870090009800a000a400a100890073009d00910080006e007b007a00680067",
       INIT_21 => X"0069006d006c00680061005a00580057004f005c00570055006500690069005e",
       INIT_22 => X"0094009a009f00a400aa00b300b0007f00b000c5009d00980071009100800067",
       INIT_23 => X"00670065006800660061005f005b0059004f0056005b005b006d006800560046",
       INIT_24 => X"009b00a400b200c500dd00ee00f800c4009c00c800b000b8006c008e0089006a",
       INIT_25 => X"006400630064006500650063005f005900500051005c00530058005200490047",
       INIT_26 => X"00bf00d600eb00f900fd00f600fb00f400a0009e00ac00c300710072008b006e",
       INIT_27 => X"0062006200610063006700680066005c0053004e00550049004b0050004a0048",
       INIT_28 => X"00f500fc00fd00fe00f300bb00ba00c9009100800097009c0074006a00800072",
       INIT_29 => X"0068006700650067006c006e0069005c0052004c00540055004e0053004d0049",
       INIT_2A => X"00fb00fc00fc010000e9007e006b0072006900730078006e0063006300680067",
       INIT_2B => X"006d006e006b006b0070006e00600056004e004c005a0068005b00520052004f",
       INIT_2C => X"00f800f800f600eb00c8007c00720076005d00570053004f00500056004b0044",
       INIT_2D => X"005f0064006200610062006100610061005b0057005b006f006e005500520052",
       INIT_2E => X"00eb00d600b50096008a0088008500840064003d0039003c004300590060003a",
       INIT_2F => X"0033004500470050005e006500680065005d0057005e006d0077006200510051",
       INIT_30 => X"00990082007a0078007c007a006f0067006a005a0039003400450066006a0053",
       INIT_31 => X"00400047004d0055006400670066006d006a0057005d006300710073005c0050",
       INIT_32 => X"006d006f0072006d006500610066006d0075007800670055005d0065005f0059",
       INIT_33 => X"004a004b0052005a0072007700690066006f006b005e006200650075006b004f",
       INIT_34 => X"00690062005d005b0063006a006f0071007000680061005f0050004c0054005c",
       INIT_35 => X"00510048004f00590075007b0069005e006000670067006500600069006f005a",
       INIT_36 => X"00570057005e0065006c006e006b0064005b005100560068005d0049004c005c",
       INIT_37 => X"0058004d004f004f005b0064005d00560057005c006100600060006000660065",
       INIT_38 => X"005a0060006700690065005f00560050005100550060006a006200550060005d",
       INIT_39 => X"00580051004f004c0047004c0054005b005c00560053005a00620060005b0060",
       INIT_3A => X"00640063005f00560050004f004f004f005200530062006c0063006000610059",
       INIT_3B => X"005c0054004f0051004c004a00520059005a005500520056005d005c00530053",
       INIT_3C => X"0057004e00490047004d0057005900530051004f0061006a006400670059005c",
       INIT_3D => X"00600057005800590052004f005400530056005a0056005300560056004f0049",
       INIT_3E => X"003e003f004600490054005600530051004e004a005e006b005f0068005b0058",
       INIT_3F => X"005b00580058005900550050005500530054005900560050004c004d004c0048",

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
