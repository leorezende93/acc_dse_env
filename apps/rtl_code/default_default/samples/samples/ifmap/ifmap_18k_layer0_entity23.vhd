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

entity ifmap_18k_layer0_entity23 is
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
  end ifmap_18k_layer0_entity23;

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
       INIT_00 => X"005500540053004f00500052005d005f005a0055004f0048004b004e0054004f",
       INIT_01 => X"0044003e003c003d003c003b00380033002e0029002500230024001e00190015",
       INIT_02 => X"005600550055004f004e0050005a005d00540049004600470044004500470048",
       INIT_03 => X"00460043003e003e003800350034002e00290025002200200021001b001a001b",
       INIT_04 => X"005400530052004e004900500056004800460041003800430048003f0036003c",
       INIT_05 => X"00420041003d003a0030002f002d00260024002100220025002a0029002a002c",
       INIT_06 => X"005500530052005000480052004d002b00430045003200340041003f0032002f",
       INIT_07 => X"0032003400390036002d002b002b002c002f00320038003b003c003b00380037",
       INIT_08 => X"00520051005100510048004c0046002c003d00330022001d001f002700260023",
       INIT_09 => X"0029002b0039003b003d003d00410044004400420047004800470043003e0038",
       INIT_0A => X"004d004c004c004f00470042003e0038002c0021001a001700160014000f000e",
       INIT_0B => X"001f0035004f005400530052004e0050004c0048004d004b0044003c0035002e",
       INIT_0C => X"0049004700460048004700370020002000260018001400130012000b000e0015",
       INIT_0D => X"001800290046005900560050004f0052004b004800480043003b0034002d002a",
       INIT_0E => X"004400450044004500430033001c00110017000c000a000b0009000b00110018",
       INIT_0F => X"001c00160021003f004d004f004d00400041004900480042003c0036002f002b",
       INIT_10 => X"004400450047004e0052005d004600130012000c001900250020002100210014",
       INIT_11 => X"001600180019002100310038003c003b003b004b0049003f0039003400340035",
       INIT_12 => X"00500059006700750080008d005500160015000f002100380039003d0035001c",
       INIT_13 => X"001500160016001400180023002d003a003d00480046004100410040003f003d",
       INIT_14 => X"00770083008e00950098009800470018001e001100150031003c0044003f0021",
       INIT_15 => X"0019001b00150011000f0014001c002b00370046004d004a0049004700440041",
       INIT_16 => X"008f00940096009900990099004f0017002800220019002e003d003000370027",
       INIT_17 => X"001d0024001f0015001300150012001f002a003b004c004d004d004c004a0045",
       INIT_18 => X"009200950097009400920092006b0020002b00370034003b00470034002c0029",
       INIT_19 => X"00220032002c001e001a001c00120019002e0032004500510051004f00490042",
       INIT_1A => X"0090008f008f008b008a0089007e0040001a002e003d00410046004000280024",
       INIT_1B => X"00240036003300280021001d00120013002f0033003c004e004f004a00400037",
       INIT_1C => X"0085008400860086008600880089007700470031001b0021002e002a00200022",
       INIT_1D => X"00280039003d00320027001c0011001100240033003000410046003e00360032",
       INIT_1E => X"007d007f00810085008c0091008800810084005a001e001e0040003300270027",
       INIT_1F => X"003100450045003d002c001c00140013001900300029002d00350039003c003d",
       INIT_20 => X"007d0084008b0091009500910075005a00800072006200500057004d00310028",
       INIT_21 => X"002e003f0044003c002d001f001900170015002a002b002d00400042003e0032",
       INIT_22 => X"0088008c00900093009a00a4009e0068009500a6007a007700500067004b0029",
       INIT_23 => X"002d00380041003c00300028001f001b00150023002f00320041003900230014",
       INIT_24 => X"0090009700a400b600d200e600eb00b2008500ab008a0095004d00670055002d",
       INIT_25 => X"002b0038003f003c003500300027001d0017001d002f00270027001f00160015",
       INIT_26 => X"00b700cd00e100f000f800f200f200e6008d00840084009f0053004d00560031",
       INIT_27 => X"002a0037003c003a00390037002f00210019001a0027001c0019001d001c001b",
       INIT_28 => X"00f100f800f700f900ec00b000ab00b50078006200720076004d003c00470034",
       INIT_29 => X"002e00360039003a003b0039003000200018001700250025001c0020001f001a",
       INIT_2A => X"00f800f900f900fd00e0006a005300550047004e005100410030002e00340031",
       INIT_2B => X"0033003700360039003d00330024001b00150016002700360028001f001f001c",
       INIT_2C => X"00f700f800f500eb00c2006d0060005e0041003500230019001c002b002d0020",
       INIT_2D => X"002e0033002f002f0030002d002b00290022001e0024003a00390021001d001e",
       INIT_2E => X"00ec00d700b6009800880081007a007400510023000d00090014003400490022",
       INIT_2F => X"0011001c001a0020002f003b003b00310023001a00220034003f002c001c001d",
       INIT_30 => X"009a0082007a0078007b00760068005c005a0046001f0012001d003d00450034",
       INIT_31 => X"0022002400240028003a00470041003d00300017001f00280038003c0027001c",
       INIT_32 => X"0069006b006d0068005f0058005b005d006000620056003e00380038002f0031",
       INIT_33 => X"00280025002a0030004c005b004800390036002c001d0023002a003d0037001d",
       INIT_34 => X"005f00590053005100560058005b0058005300490044003e00280023002c0034",
       INIT_35 => X"0028001e002700310051005f004700320029002a0025002300220030003a0028",
       INIT_36 => X"004b0049004f005500570053004c004000330027002a003b0032002200290031",
       INIT_37 => X"0026001e0024002700370045003c002d002600260022001d0020002400300033",
       INIT_38 => X"004c004e004f004d00440039002c0021001d001e002e003d0037002900320026",
       INIT_39 => X"001d001a001d001e001d0025002e0030002e002500190018001e00200024002f",
       INIT_3A => X"0050004a0040003200260020001e001b001b001b002d003c0035002f002c001d",
       INIT_3B => X"001c00170017001c00190018002000250023001d00150015001a001e001c0022",
       INIT_3C => X"003a002d0021001a001a001d0021001c001b001800270033003100320021001c",
       INIT_3D => X"001b00150019001d00180015001900170017001a001600120015001a00190017",
       INIT_3E => X"001b001700180015001a001900180019001a001600210030002a003300230018",
       INIT_3F => X"001500140015001800170017001d00190018001b001600120011001600180016",

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
