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

entity ifmap_18k_layer0_entity17 is
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
  end ifmap_18k_layer0_entity17;

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
       INIT_00 => X"0053003d001a002400410043003a0036003f00410034003b003e0035002e0034",
       INIT_01 => X"00470041002b0027002f002f002d0026002f002d002a00320045002e00290029",
       INIT_02 => X"00610035003a0046004600430044004d0044004100380039003400390032002e",
       INIT_03 => X"003c0034002b0026002f002f002c00280020001e002b00380043003500330031",
       INIT_04 => X"00640047005c0051004400390044004e00400047003f003b0034003000310030",
       INIT_05 => X"003b00320021001e002b003000350038003300380039003800390035002f0031",
       INIT_06 => X"0060005f0061005900490037004900480041004e00420042004300370036003f",
       INIT_07 => X"002f002e001a001200220029002f0035003d00440040003e0030002d003a003c",
       INIT_08 => X"005c0061005400570049003f004c004b004a004a004b004b0043003b0035003b",
       INIT_09 => X"003b00340033001e001f0029002e0027002e003b003d003d00340030003a003c",
       INIT_0A => X"006500660047005900510046004c004c004c0051004e00470044004300350031",
       INIT_0B => X"0043004100480039002b003e00420032003800360038003a003c003d003c0041",
       INIT_0C => X"0078005900490063005300500051004b0051005700550042004c004f00430035",
       INIT_0D => X"003c0040004a004d004100400041002f00350036002d0030003a003d003f0042",
       INIT_0E => X"0075003b005b005b00510051004f00540057005600560048004d004c004a003f",
       INIT_0F => X"00420049004c00490047002f0038002f002c00310023002a00370039003e0040",
       INIT_10 => X"005c0054005b00510053004f005000500058005300490046005100480043003d",
       INIT_11 => X"0043004100460046004f0040004f003c002c002d0034003b003a003d003d0040",
       INIT_12 => X"00610058004c005a005b005600530047004f00520054005300580053004d0055",
       INIT_13 => X"0051003e00390046005000480059004b002b0031003a003c003a003f00390040",
       INIT_14 => X"00510030005600620059005b00520054005b005400500050005e00650067007e",
       INIT_15 => X"006b004900370043004b004c0051004400200031002f002d0033003a003e0041",
       INIT_16 => X"0014001f0063004d00400056005a005a005f00450045005f008f008800670079",
       INIT_17 => X"00760052003f00500052004d00420021002100300030002e00300036003b003f",
       INIT_18 => X"000000320070005c006e007a006900620060004800540077009d007d005f0049",
       INIT_19 => X"00340047004100540060004f0041002a0025002500290029002d00380039003a",
       INIT_1A => X"0014003c0061005c007d00780070006f0059004c006e0080007f00640062006c",
       INIT_1B => X"004400630062005b006a004c003a00290021002300250026002e003400320035",
       INIT_1C => X"003b0046003a0058007b0075006a0073006600670082007d005f005000660089",
       INIT_1D => X"0083008c007e0084006f004e0040002a002b0028002a0032002f0032002e0031",
       INIT_1E => X"004900350032005e007e007c006c00620072007d008a0088007b00620071008c",
       INIT_1F => X"008f0089008a008c0075006900490033002f00230032004d0043002d002d0032",
       INIT_20 => X"00480041003a00560077007500690053006e0089009300820082006b006d0087",
       INIT_21 => X"0084007f007e008300870077003d002a001a001b003c00550061003300240033",
       INIT_22 => X"00470048005100660078007c007a005000630097006a0054007c00790065005c",
       INIT_23 => X"0063007300680065005e0048001f0011000e0015003a005500680046001f0029",
       INIT_24 => X"004f004e0044006400860088007d004b00470093005b0061008e007100370048",
       INIT_25 => X"0035004f00450032002a0014000d00160014002300370060006f005b001e0023",
       INIT_26 => X"005100480032005800870099008a005d001f006f007f0071007c005c0047008d",
       INIT_27 => X"0067004100330021002400190024002c001a002b0036006000890073001e001a",
       INIT_28 => X"00530052004f005f0082009600860062000a0017005600630065004c00420074",
       INIT_29 => X"007a004e00270017002e002f002f002e0014001b0034006700920089002f0019",
       INIT_2A => X"005c005c004e0053007b0087006e0046000c00080010001d002f003400250038",
       INIT_2B => X"00460039002b00120019001c001d002c002100260031005e008c008d003d0018",
       INIT_2C => X"0061005d0046004e006b0076006000300025003a002200130013001f0026003b",
       INIT_2D => X"00270013001b001200110011000a0018002a002c003000400078008000460018",
       INIT_2E => X"005e004d00520058005b006b005f004b004a003700300039003a003500430033",
       INIT_2F => X"0010000400030008000e001300070006001100170030002f005100730057001b",
       INIT_30 => X"004b003b00570069005300520075007e005500220039003e0042003d0039002e",
       INIT_31 => X"002400170012000d000f000e000c000e0007001c0036001e002800550068003e",
       INIT_32 => X"004d004d005100560055004500570070006f004f0064004f003b00430045003a",
       INIT_33 => X"00330026002000150011000c0006000e000f00220029000f001f002e004c005a",
       INIT_34 => X"004f00510052005500650060004a0039006d0057003a003e003d0058005a0044",
       INIT_35 => X"003b0035002f002a002c0023001800230026001d001b001f0039005200270038",
       INIT_36 => X"004c0057004a004a0066005f00530039004d00630037003a003f00540057004d",
       INIT_37 => X"0039003c00430044003b00310031003f003c003100300033003f0054002d002f",
       INIT_38 => X"0055005a00400045005e004e00410044004c003c0042005a004a004e00530051",
       INIT_39 => X"00430047004c0040003b0039003e0048004400420040003e00320029003d0053",
       INIT_3A => X"003d004b0049005c00570051004e0050005d004c00500059004a004c004e0050",
       INIT_3B => X"004a0045003e0035004000420044004b004d00480048004400320038004e0059",
       INIT_3C => X"00460051005a0064005600550057005500560057005d005a004a0046003f003c",
       INIT_3D => X"0042003c003e003e004100460047004c0055004d004e0047003e0041004d004f",
       INIT_3E => X"004f005d005f005900460039004600510053004000470047004a004c003d002f",
       INIT_3F => X"0038003f004800460045004c004b00500056004f0049004e004f004c004f0049",

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
