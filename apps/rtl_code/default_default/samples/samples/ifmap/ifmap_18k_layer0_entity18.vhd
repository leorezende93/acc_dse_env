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

entity ifmap_18k_layer0_entity18 is
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
  end ifmap_18k_layer0_entity18;

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
       INIT_00 => X"00a000b900d100d900e600f600f900f600f800f300e600dd00da00dd00d800c7",
       INIT_01 => X"00bc00bb00b800b400a600900079008b006a00660066004f005e0065005b005e",
       INIT_02 => X"00e100ef00f200e600e800f500f300eb00ed00e600d800cd00c900cb00c800ba",
       INIT_03 => X"00af00ab00a1007f008e008d007a00870076005200250034005f006b00610064",
       INIT_04 => X"00fc00f900f100dc00d900e200df00d600d500cf00c300b800b300b600b300a7",
       INIT_05 => X"009f0098009400810080008c0080007200570028000400260063007300690069",
       INIT_06 => X"00e900e100de00d300d300cb00c800c000bb00b700ae00a400a000a500a00099",
       INIT_07 => X"0091008d008c008a007d007d007f0069003b0025001a0037007000780070006d",
       INIT_08 => X"00cf00c300cf00c900be00b400b300ab00a3009f00990092009100970093008d",
       INIT_09 => X"00870088008300870081007a0084005a003a003d00300056007500780072006d",
       INIT_0A => X"00b600ab00aa00a20099009c009f00970090008d008c008a008b008d008a008a",
       INIT_0B => X"0087008c0086008a008c008900660045004b003e00430074008100800070006e",
       INIT_0C => X"008d00880088008600880086008c008500870089008b008d008f0092008e0091",
       INIT_0D => X"00910091008a008f008e006b002f00210048004b006c007f00840084006f0070",
       INIT_0E => X"0076007d0080008100880083008a00840088008c009000930096009e009a0099",
       INIT_0F => X"009200950093009400800042000d0011005000750080007a007b008000720070",
       INIT_10 => X"0073007e00840085008b0087008f0089008b0091009500980094009a00a300aa",
       INIT_11 => X"009e00a2009d00940073002c000e001e0069008b0088007e0077007a0074006f",
       INIT_12 => X"0076008000880088008d00880091008d008d0093009a00a5009d009a00a200a7",
       INIT_13 => X"009b00930091008a00630038002e0037006d007c007a007e007300740075006e",
       INIT_14 => X"007d0084008b0089008e00880090008c008b0090009600990083008b00900098",
       INIT_15 => X"00a600ba00d300d60080005c0045002a0055005f006300730070006f0071006b",
       INIT_16 => X"00850089008e008a008d0088008e008a0089008f00880084008e00b600c900cb",
       INIT_17 => X"00d200ce00cf00c000a200bd0092002a001b002800670072006d006a006c0068",
       INIT_18 => X"008c008b008f008b008f008c008a008900870085009000a400ab00a000890073",
       INIT_19 => X"006a005d004b003b006f00dc00c9005f000d0007003e00740063006500690064",
       INIT_1A => X"0090008a008f008c009200920082008700820091008c006e005e005c00310013",
       INIT_1B => X"001d003200190012007800d100d2009d0026000600130044004500520063005f",
       INIT_1C => X"0091008b0092008e0090008e007900800085007f0054004400560052002e0016",
       INIT_1D => X"00130032001e004100af00c900cd00cb006600100012001600230038004f0058",
       INIT_1E => X"008f008b00940090008a0084008b00830075004200480056006a004e00280022",
       INIT_1F => X"00240046007300b600cb00c500cd00c3006c003d002500120018004f00640053",
       INIT_20 => X"008e008b00930090008500720084007900510059003c0045005500440053009b",
       INIT_21 => X"00c000db00ed00eb00d700d700d300720030005d003500140041008b008f0054",
       INIT_22 => X"008f008d008e008900740045003a00430051004b001d001c00240019008c00f2",
       INIT_23 => X"00ec00eb00e300dc00db00df0095003a00390054004e004e008500a100a7005b",
       INIT_24 => X"008f008c00880086008d0047002d00340043002100170016002f0029009b00d9",
       INIT_25 => X"00c700be00bf00d000dc00df00ad0067005d0073008700950098009400a50059",
       INIT_26 => X"008f008c007e00b500bd004c0021002b003900150010001700390042009e00c2",
       INIT_27 => X"00b600b300c400c900c200ce00de00b30097009c009500970096009200880042",
       INIT_28 => X"008c0085009a00ea00b5005a0026002a0034000b000b000b0014003100a000ba",
       INIT_29 => X"00b000b900b900730045005a00a100c400b700aa00a0009900930088004d0026",
       INIT_2A => X"0082008000a300a3008b006a002d002e001c00030009000f001e003600a200b4",
       INIT_2B => X"00ac00be00710015001400150030009500bb00ab008e00850080004300150027",
       INIT_2C => X"007c00840067001a0048006c0034003000120007000b003b005a006300a500b0",
       INIT_2D => X"00b100a9002a001d002f0026000e00460095008800750075003c000e00150030",
       INIT_2E => X"0079007c0049001e003b00720044001f000d000e00180048004f006c00bb00bb",
       INIT_2F => X"00bf008b001b002b001e001b001c001b006c0084007b005900160015002a003b",
       INIT_30 => X"006d00660047003f003c0071004d001c0010001f003000470046008800bd00b3",
       INIT_31 => X"00b40074001f003600350029001b000e00480085007c003c001200220032003b",
       INIT_32 => X"00570051003d003c003a0069004b00150014002e004c00600061009100a400a3",
       INIT_33 => X"00aa00710020003900470031002500110029006c00600021000c001d00280032",
       INIT_34 => X"004900490040003c0039005f0057002f003d0062008900a500a900b000b700b6",
       INIT_35 => X"00b6007c002200360060005c0033001b00110046003b000c00060012001d0028",
       INIT_36 => X"004900490045004e004100590045002f0034003c004a0056005b006000620060",
       INIT_37 => X"006200530020003c003b003e001d001400040011000a00030007000a00110021",
       INIT_38 => X"004b005300480036002d0027000f0004000300020005000700070008000a000b",
       INIT_39 => X"000b000d000800420043002f0038000f00020002000100030006000a000f0020",
       INIT_3A => X"005000590051002f0015000a00100019000e000a000e000e000e000e000e000c",
       INIT_3B => X"000a000900060017003e0048002a000700030004000500050007000b00150021",
       INIT_3C => X"0049004f00490037002e002f003b003a001a00110019001c001f0020001d001c",
       INIT_3D => X"001800150010000c00140016000800060008000700080008000b000f001b001f",
       INIT_3E => X"00450048004c004e005800530048003800200026002b002a002f003300320031",
       INIT_3F => X"002c0026001e001c002200220013000c000e0010000f000d0012001a001e001d",

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
