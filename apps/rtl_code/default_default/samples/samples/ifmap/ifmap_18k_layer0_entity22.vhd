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

entity ifmap_18k_layer0_entity22 is
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
  end ifmap_18k_layer0_entity22;

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
