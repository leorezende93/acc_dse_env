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

entity ifmap_36k_layer0_entity11 is
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
  end ifmap_36k_layer0_entity11;

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
       INIT_00 => X"005e005e005d0059005a005a0060006000610066006e0065005e005800550052",
       INIT_01 => X"004e004b0049004800450041003d00380033002e0029002700280022001d0019",
       INIT_02 => X"0060005f005f005900590059005f006200610060006a006b0060005900550052",
       INIT_03 => X"004f004b004700490044003d003b00350031002c0027002500260020001f001f",
       INIT_04 => X"005e005c005c00570054005a005d0051005900600063006e0070006200560054",
       INIT_05 => X"004f004900440046003f003a00360030002e002b0029002b002f002e00300031",
       INIT_06 => X"005f005d005c005a0053005d00560039005d006b00630068007400720065005a",
       INIT_07 => X"004e004300420042003e003800380039003c003e0041004200430041003f003d",
       INIT_08 => X"005c005b005b005b005300590052003e005c005f00580058005c006800690064",
       INIT_09 => X"005b0046004500480050004d005000530053005100510050004f004b0046003f",
       INIT_0A => X"00580056005700590052004f004c004d0050005200550057005a005e005e005f",
       INIT_0B => X"0063005e006200630064006400600062005d005800580053004c0045003e0037",
       INIT_0C => X"00550054005200540051003d002a00370053005700580059005b0057005d0065",
       INIT_0D => X"00620064007000730069006700670067005b0050004e004a0044003f00390036",
       INIT_0E => X"0052005300520054004c00370026002c004c00550052005100500053005b0063",
       INIT_0F => X"006700600061006c006d00720071005e0052004d004d004b004700440040003b",
       INIT_10 => X"005100520054005b005e00680055003100490054005b0063006100640065005e",
       INIT_11 => X"0065006800650062006a006f00720067005700550052004e004a004600470048",
       INIT_12 => X"005c006500730080008e009d00680036004b0054005d00710075007c00750065",
       INIT_13 => X"0067006a006b00670068006e007400760064005a005500540055005500550052",
       INIT_14 => X"0082008e009900a000a600aa005900350050004d0046006800770082007f006b",
       INIT_15 => X"006a006c0069006a006a0069006e00720069006200620060005e005b00590055",
       INIT_16 => X"009a009f00a200a400a700a9005d002e00510056004a0067007b0070007a0072",
       INIT_17 => X"006a006d006a0067006b00690067006e00660061006500630060005e005a0055",
       INIT_18 => X"009d009f00a1009e009e009f0075003000490065006c00780087007800740075",
       INIT_19 => X"006b0073006c00660069006a0064006900700060006000650062005d0055004c",
       INIT_1A => X"0099009800970093009300930087004c002c0049006700750083008500730071",
       INIT_1B => X"006c00770071006b006a006a0065006400750069005d0062005d0055004a0040",
       INIT_1C => X"008f008e008e008e008f00940095008300540041003500460063006b0068006d",
       INIT_1D => X"0072007c007d0075006e006c00650062006c006f0058005a005500480041003f",
       INIT_1E => X"008c008d008e0091009900a0009900930097006f0034003a006a00680065006e",
       INIT_1F => X"007b0089008700800073006c006800650063006f0059004e004a0048004a004d",
       INIT_20 => X"008f0095009b009f00a400a000880072009b008f007a0068007600770066006c",
       INIT_21 => X"00780084008500800075006d006b006a0061006c00620056005a0054004f0044",
       INIT_22 => X"009a009d009f00a100a700b100b0008100b300c70097008e00680089007b006c",
       INIT_23 => X"0079007e00830080007700730070006e00630069006a005e005c004a00340027",
       INIT_24 => X"009d00a400b000c100da00ec00f700c700a300ce00ad00b10065008800860071",
       INIT_25 => X"0077007e00820081007d007a0076007100680067006a0050003e002c00250027",
       INIT_26 => X"00c000d400e800f600fa00f200fa00f700a900aa00ae00c1006e0070008b0078",
       INIT_27 => X"0076007e008000800080007f007e0074006c00660060003e002a00250027002b",
       INIT_28 => X"00f500fb00fa00fb00f100ba00be00d200a10092009c00a0007d00730087007a",
       INIT_29 => X"0078007f00810080007f007f007d0074006a006200570042002d002a00290029",
       INIT_2A => X"00fb00fb00fb00fe00ea008300740082007f008a0082007c007a00770072006b",
       INIT_2B => X"007600800082007f007d0077006f006c0063005a00520050003d002f002c0029",
       INIT_2C => X"00fc00fc00f900ef00cb0080007b0083006f006c00660067006a006900510044",
       INIT_2D => X"0066007500780074006e006b0070007300680059004b005400510034002d002d",
       INIT_2E => X"00f500df00bf00a0009000890089008a006d004b00510057005a00660063003a",
       INIT_2F => X"003a0056005f0065006d0074007a00740061004d0046005000590042002f002f",
       INIT_30 => X"00a5008d008600840082007b00700069006b005e004a00470053006e006f0056",
       INIT_31 => X"0048005a0066006c0076007b007b007c006c00490042004400520054003d0030",
       INIT_32 => X"00750078007a0075006a00610065006a00700073006a0057005c006800680061",
       INIT_33 => X"0054005f006c00720086008e0082007a007700640045004000450057004f0032",
       INIT_34 => X"006c00660060005e0065006b006e006b0067005d0056005100420048005d0068",
       INIT_35 => X"005e005f006b0071008900940085007a0072006b005100420040004b0055003f",
       INIT_36 => X"00580057005d0063006b006c006500570049003c00410053004a003f004e005e",
       INIT_37 => X"00590057005f005d0069007b007a0072006d0068004e003b003c003f004a004b",
       INIT_38 => X"005d005f0061005f005b00540045003800320031004200550053004900550048",
       INIT_39 => X"003e003e0043004400450058006400680065005a0040003300350036003a0045",
       INIT_3A => X"0060005b00510044003b003700340030002f002e004000520052004f004d0039",
       INIT_3B => X"003500320034003a003a003f0047004a004800410034002e0030003100300036",
       INIT_3C => X"0049003c0031002b002c0030003400300030002c003a0049004b004f003e0035",
       INIT_3D => X"0032002e003400390034002f0033002f002f0031002e002a002b002d002b002a",
       INIT_3E => X"0029002500270025002a00290029002d002f002b003600470043004c003b002e",
       INIT_3F => X"002b002a002d0030002f002d0031002d002b002d002a00270025002800280026",

       -- The next set of INIT_xx are valid when configured as 36Kb
       INIT_40 => X"005500540053004f00500052005d005f005a0055004f0048004b004e0054004f",
       INIT_41 => X"0044003e003c003d003c003b00380033002e0029002500230024001e00190015",
       INIT_42 => X"005600550055004f004e0050005a005d00540049004600470044004500470048",
       INIT_43 => X"00460043003e003e003800350034002e00290025002200200021001b001a001b",
       INIT_44 => X"005400530052004e004900500056004800460041003800430048003f0036003c",
       INIT_45 => X"00420041003d003a0030002f002d00260024002100220025002a0029002a002c",
       INIT_46 => X"005500530052005000480052004d002b00430045003200340041003f0032002f",
       INIT_47 => X"0032003400390036002d002b002b002c002f00320038003b003c003b00380037",
       INIT_48 => X"00520051005100510048004c0046002c003d00330022001d001f002700260023",
       INIT_49 => X"0029002b0039003b003d003d00410044004400420047004800470043003e0038",
       INIT_4A => X"004d004c004c004f00470042003e0038002c0021001a001700160014000f000e",
       INIT_4B => X"001f0035004f005400530052004e0050004c0048004d004b0044003c0035002e",
       INIT_4C => X"0049004700460048004700370020002000260018001400130012000b000e0015",
       INIT_4D => X"001800290046005900560050004f0052004b004800480043003b0034002d002a",
       INIT_4E => X"004400450044004500430033001c00110017000c000a000b0009000b00110018",
       INIT_4F => X"001c00160021003f004d004f004d00400041004900480042003c0036002f002b",
       INIT_50 => X"004400450047004e0052005d004600130012000c001900250020002100210014",
       INIT_51 => X"001600180019002100310038003c003b003b004b0049003f0039003400340035",
       INIT_52 => X"00500059006700750080008d005500160015000f002100380039003d0035001c",
       INIT_53 => X"001500160016001400180023002d003a003d00480046004100410040003f003d",
       INIT_54 => X"00770083008e00950098009800470018001e001100150031003c0044003f0021",
       INIT_55 => X"0019001b00150011000f0014001c002b00370046004d004a0049004700440041",
       INIT_56 => X"008f00940096009900990099004f0017002800220019002e003d003000370027",
       INIT_57 => X"001d0024001f0015001300150012001f002a003b004c004d004d004c004a0045",
       INIT_58 => X"009200950097009400920092006b0020002b00370034003b00470034002c0029",
       INIT_59 => X"00220032002c001e001a001c00120019002e0032004500510051004f00490042",
       INIT_5A => X"0090008f008f008b008a0089007e0040001a002e003d00410046004000280024",
       INIT_5B => X"00240036003300280021001d00120013002f0033003c004e004f004a00400037",
       INIT_5C => X"0085008400860086008600880089007700470031001b0021002e002a00200022",
       INIT_5D => X"00280039003d00320027001c0011001100240033003000410046003e00360032",
       INIT_5E => X"007d007f00810085008c0091008800810084005a001e001e0040003300270027",
       INIT_5F => X"003100450045003d002c001c00140013001900300029002d00350039003c003d",
       INIT_60 => X"007d0084008b0091009500910075005a00800072006200500057004d00310028",
       INIT_61 => X"002e003f0044003c002d001f001900170015002a002b002d00400042003e0032",
       INIT_62 => X"0088008c00900093009a00a4009e0068009500a6007a007700500067004b0029",
       INIT_63 => X"002d00380041003c00300028001f001b00150023002f00320041003900230014",
       INIT_64 => X"0090009700a400b600d200e600eb00b2008500ab008a0095004d00670055002d",
       INIT_65 => X"002b0038003f003c003500300027001d0017001d002f00270027001f00160015",
       INIT_66 => X"00b700cd00e100f000f800f200f200e6008d00840084009f0053004d00560031",
       INIT_67 => X"002a0037003c003a00390037002f00210019001a0027001c0019001d001c001b",
       INIT_68 => X"00f100f800f700f900ec00b000ab00b50078006200720076004d003c00470034",
       INIT_69 => X"002e00360039003a003b0039003000200018001700250025001c0020001f001a",
       INIT_6A => X"00f800f900f900fd00e0006a005300550047004e005100410030002e00340031",
       INIT_6B => X"0033003700360039003d00330024001b00150016002700360028001f001f001c",
       INIT_6C => X"00f700f800f500eb00c2006d0060005e0041003500230019001c002b002d0020",
       INIT_6D => X"002e0033002f002f0030002d002b00290022001e0024003a00390021001d001e",
       INIT_6E => X"00ec00d700b6009800880081007a007400510023000d00090014003400490022",
       INIT_6F => X"0011001c001a0020002f003b003b00310023001a00220034003f002c001c001d",
       INIT_70 => X"009a0082007a0078007b00760068005c005a0046001f0012001d003d00450034",
       INIT_71 => X"0022002400240028003a00470041003d00300017001f00280038003c0027001c",
       INIT_72 => X"0069006b006d0068005f0058005b005d006000620056003e00380038002f0031",
       INIT_73 => X"00280025002a0030004c005b004800390036002c001d0023002a003d0037001d",
       INIT_74 => X"005f00590053005100560058005b0058005300490044003e00280023002c0034",
       INIT_75 => X"0028001e002700310051005f004700320029002a0025002300220030003a0028",
       INIT_76 => X"004b0049004f005500570053004c004000330027002a003b0032002200290031",
       INIT_77 => X"0026001e0024002700370045003c002d002600260022001d0020002400300033",
       INIT_78 => X"004c004e004f004d00440039002c0021001d001e002e003d0037002900320026",
       INIT_79 => X"001d001a001d001e001d0025002e0030002e002500190018001e00200024002f",
       INIT_7A => X"0050004a0040003200260020001e001b001b001b002d003c0035002f002c001d",
       INIT_7B => X"001c00170017001c00190018002000250023001d00150015001a001e001c0022",
       INIT_7C => X"003a002d0021001a001a001d0021001c001b001800270033003100320021001c",
       INIT_7D => X"001b00150019001d00180015001900170017001a001600120015001a00190017",
       INIT_7E => X"001b001700180015001a001900180019001a001600210030002a003300230018",
       INIT_7F => X"001500140015001800170017001d00190018001b001600120011001600180016",

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
