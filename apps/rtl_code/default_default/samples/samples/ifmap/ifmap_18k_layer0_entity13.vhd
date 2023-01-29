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

entity ifmap_18k_layer0_entity13 is
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
  end ifmap_18k_layer0_entity13;

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
       INIT_00 => X"004400510040002e00210039004b005000530046001400220047004b00460042",
       INIT_01 => X"00570078007c0079007e006c0054005200880081003b005b00600043004c0057",
       INIT_02 => X"00500066004a002f0038005c005400540058003e00120030005d005c004d0049",
       INIT_03 => X"006b0075006f006a0075006c004d00530097008b002d004100470042005a0051",
       INIT_04 => X"005f006d00580038005400690056005a005c00350014003c005900580042003c",
       INIT_05 => X"00670066004e00540072007200420056009e008f00230037005400620062003b",
       INIT_06 => X"0074006400640049006d006600580060005e002d001a00380041004300360037",
       INIT_07 => X"006a007500610062007600720045005b00a000960040005d0078007e005e0032",
       INIT_08 => X"007800680080005d0072005e005a005e005d0027001a0024002f003700490056",
       INIT_09 => X"00690071006b00650067006d004a006700a200ac00700074008100840067006c",
       INIT_0A => X"0069006600620062005f0059005b004e00580023001b002b004d005d006a006c",
       INIT_0B => X"006700650064004e0039006e0062006600a700ba0082007f0081009000840078",
       INIT_0C => X"005e00600030004f005a0064005d003f004a001d0026005a007e008100820063",
       INIT_0D => X"003a0047007300390025007b0071006a00b700c1008d008c008900a00065003b",
       INIT_0E => X"00560054002f006900670061005e0047003800140049008b008a008c00720029",
       INIT_0F => X"001a00410073004f003b007d0078008c00b000c3009600940090009b003f0018",
       INIT_10 => X"0062004e004a008c009500720050005c0047002c0071009000880086003f0017",
       INIT_11 => X"0045007c005e00560070008b009b00a500aa00b1009600960092008e00290016",
       INIT_12 => X"00740051004e009400a3009b005400450051005a0089008e008a005d00210038",
       INIT_13 => X"007c008f007300800097009c009c008100a700ad0098009a0094007900160018",
       INIT_14 => X"0078004f0049009100a500a6007f004100360072008e007f007e005d0047006c",
       INIT_15 => X"00870085009200a1009c00a50075005700a900af0097009c0091007400130017",
       INIT_16 => X"007b00450042008a00a100a800a5005f004b008c008a0070006d0066008800a2",
       INIT_17 => X"0099009a00970087007c00850076008800bd00aa0092009d009400770014000b",
       INIT_18 => X"006a0039003c0079008700a400ad009800900093007f00760073005c0066008b",
       INIT_19 => X"008d008a008500740078006b0077008800b000ae0087009100a10072001a002b",
       INIT_1A => X"00740055004e0074007f008c00ac00ab0099007c00820078007700760071006e",
       INIT_1B => X"0069006c0077007d0083007a00810075009000a2008d009a00a600700041005f",
       INIT_1C => X"00840060006300780082007200a500a8008b006b00680070007c0081008e0084",
       INIT_1D => X"007a0077006b006f00730076008d0090008e007b0092009f009d00700048005e",
       INIT_1E => X"0079005a005d0076007f007c009700a6009900ab00790045006b007c007b008b",
       INIT_1F => X"009b009000800077007a0067008300a7009f008c008000a00095004b00220068",
       INIT_20 => X"007000640064007e008d0098009500a3008a00a300a6004700640085008b008d",
       INIT_21 => X"0081008800a0009e00a30097007d007e00a900b1007a008f008f003d0033008b",
       INIT_22 => X"00700070008300810093007c00900089008f007900a80099007a007f00920093",
       INIT_23 => X"008d008b0084008a0086008f00990086009100820092007a00860064003a006f",
       INIT_24 => X"007900760095008e008d0061007b0076008f007e007900bb0091006e00880082",
       INIT_25 => X"009a00a10094009a00970086009600910086007b006100570067007700610086",
       INIT_26 => X"008800870097006f007a0065005d007d008600990060007d00a90088009200a0",
       INIT_27 => X"0096009400a600a7008d00800090009100840082004b005e00530057009500a9",
       INIT_28 => X"0094008c0070005e007900680054008200660074008d004a007600a3009b00aa",
       INIT_29 => X"00a50095009d00a70092008900930091007f007c006d007100600077009c00a1",
       INIT_2A => X"009800770048007d00810065006300790078005b009a007d005d009600b500a9",
       INIT_2B => X"00a200ad0091008f008f00870081008b007d007800750066008100ab009a0099",
       INIT_2C => X"008800680052007b00880076006200730096008d007500940081009500ad00b3",
       INIT_2D => X"00a500a8009f008f007e008b008c008d00880085007a006d009800a400960095",
       INIT_2E => X"007d006f009600bf00ac009e0079006f0091009900730069009400a1009a00ac",
       INIT_2F => X"00a1009b009c008d008900930088008f0089008c007b0086009c0095009e0095",
       INIT_30 => X"009500a200c800dc00d100bd00aa00930091007a007d0088008b009f009600a4",
       INIT_31 => X"009b009b009f008e008500a900930088007f007e006b0072009a008f00a0009c",
       INIT_32 => X"008b0089009d00be00d500d700bf00b000a90084007500a300ad0097009a008f",
       INIT_33 => X"007c008100990098009100a30095007c007700830060004a0091009500970078",
       INIT_34 => X"0073006f0061008600bf00cf00d300c100b100ad0091007f0090008f00860068",
       INIT_35 => X"0049005c008b009b00a1008a0094008e008300750055003c00920091006f006d",
       INIT_36 => X"006a007200410040007800b200c300d500ca00b900ad0099008e0096008d007d",
       INIT_37 => X"006c0060008e009a009000a10095007f00830062003100610093006c00760075",
       INIT_38 => X"00740070003e00260029008700b400c700d400cc00b700b200ab00a4009e00a1",
       INIT_39 => X"009d008b0087008d00870099009c007e00670042003b007c0054008800c50083",
       INIT_3A => X"007f007b004f004e00250042009500bf00d000db00d600c200b800b400a5009f",
       INIT_3B => X"0087007d007b0083008a009300870072006c004f0055005b004e00ac00c9008f",
       INIT_3C => X"007d00680034006b00430030004e009700bd00cb00d900da00cd00c300b400b6",
       INIT_3D => X"00a50074005e007a006100590059006f0096008a00820086009f00b500bc0081",
       INIT_3E => X"00660033002800730060003a0029004e00a000b500b900cf00da00d200c400ce",
       INIT_3F => X"00d600b4007c007100560066008400a000ba00a700a700a700b400b300b9009c",

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
