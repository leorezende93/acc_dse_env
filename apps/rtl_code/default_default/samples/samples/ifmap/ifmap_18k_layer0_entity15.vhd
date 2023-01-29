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

entity ifmap_18k_layer0_entity15 is
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
  end ifmap_18k_layer0_entity15;

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
       INIT_00 => X"00b3008b004d0058008d009d009c0097009c009e009000970097008800790076",
       INIT_01 => X"007e006c0054005400620062005e0053005a00560054006000750057004c004d",
       INIT_02 => X"00b8008500800092009f009f009e00a700a500a20099009a009600960088007d",
       INIT_03 => X"0081006d005a0052005d0062005e0058004e004c005b006a00760062005b005a",
       INIT_04 => X"00b4009800b000aa00a40098009b00a400a200aa00a2009f009c00970092008c",
       INIT_05 => X"0092007c00580047005500620067006b0065006d006f006f006f0065005d005f",
       INIT_06 => X"00af00ae00b800b500a8009800a400a300a600b300a700a800ae00a2009f00a4",
       INIT_07 => X"009700890059003a0048005a0063006b00750080007d007900690061006d006f",
       INIT_08 => X"00af00ae00a700ac00a200a100b000af00b200b200b300b400b000a800a000a4",
       INIT_09 => X"00ad009c007800450042005a0063005e0069007c007f007b0070006800710074",
       INIT_0A => X"00b500ae009000aa00a900a600b000b300b400b400b400b500b000ae009f0096",
       INIT_0B => X"00b500af009b00740060007d0083007000750078007a0079007900780076007c",
       INIT_0C => X"00c0009c008a00b200af00ae00b000af00b800b400ba00b800bb00bb00ad0099",
       INIT_0D => X"00a600ad00ad00a7009600950094007900730075006d006f0078007a007b0080",
       INIT_0E => X"00b9007d009c00ab00ad00af00af00b800bc00b700c100c200bd00b900b800a6",
       INIT_0F => X"00a400ac00b100b000aa0089008f007a006b006e0060006700750076007b007d",
       INIT_10 => X"009b0095009f00a000ac00ad00b200b400bb00ba00ba00bf00bb00af00ac00a0",
       INIT_11 => X"009a009700a600b000b7009b00a6008500680068007000770076007a007a007d",
       INIT_12 => X"009a0098009300a900b200b200b700aa00b000bc00c600c100ae00a700a500a9",
       INIT_13 => X"009d008c009200a900b300a000ab008d005f0068007500770074007b0076007d",
       INIT_14 => X"00860070009f00b100ae00b800b800ba00ba00c200bf00b0009b009e00a700bb",
       INIT_15 => X"00ae00930086009700a0009c009b007c004a006600690066006b0075007b007f",
       INIT_16 => X"0041005b00ae009d009300b100bf00be00bc00b000ac00b000b800ae009400a3",
       INIT_17 => X"00b0009a0085009500980095008300500042006100670066006700710078007d",
       INIT_18 => X"0015005c00bf00b100bc00ca00bd00b600b3009c00a500bc00c800ae00980072",
       INIT_19 => X"005f007f00780089009700880072004e00400049005900620062007100750076",
       INIT_1A => X"002c006300a800ad00c800c300bc00bb00a5009500b400c200b900a800a8009a",
       INIT_1B => X"006b00920091008a009c007f0064004800390040005300600062006a006c006f",
       INIT_1C => X"006900760075009f00c400be00b400bb00ad00ad00c600c100ab00a500b400bc",
       INIT_1D => X"00ae00bb00ad00b300a0008000690048004300450057006c0063006400610066",
       INIT_1E => X"008a00710068009d00c600c400b400a800b400bf00cb00cd00d200bf00c400c8",
       INIT_1F => X"00c000bb00bc00be00a800990071005000460040006000870078005a005a0062",
       INIT_20 => X"0096008a0073009300be00bb00b0009600ab00c700d300c600d300c200be00cb",
       INIT_21 => X"00bf00ba00b800bd00be00a600640046002f0038006a008f0095005c004a005e",
       INIT_22 => X"009b009b009200a500bd00c000bf0091009c00d200a9009500c000c200b200a8",
       INIT_23 => X"00a900b500aa00a7009a00750043002b002200310068008f009c006a003f0050",
       INIT_24 => X"00a500a2008a00a600c400be00ba0089007400c9009d00a900d200b60080008f",
       INIT_25 => X"007c0093007f006100520038002f0033002b00400069009d009d007b00390041",
       INIT_26 => X"00a900960078009e00be00be00be0098003c009900bc00b900c300a5009000ce",
       INIT_27 => X"00b100890065003d00370033004700500037004a006e00a000b0008e00360032",
       INIT_28 => X"00aa00a0009600a600ba00bc00ba009a00200031007e0092009b008c008c00c0",
       INIT_29 => X"00cc009c0061003e0049004900520057003a003e006b00a600bc00a700480033",
       INIT_2A => X"00b200ab0097009c00b500b200a3007c0024001d00280037004e006300650082",
       INIT_2B => X"0090007b005f003700340033003c0055004e004d0066009900bb00b100590037",
       INIT_2C => X"00b500ab0092009800a900a700950069004f005e0042002e002f0047005c0078",
       INIT_2D => X"005a00370038002900230022001e0037005200560061007700ad00ae006a003c",
       INIT_2E => X"00b1009c009e00a3009c00a000940089008f00760066006b006e006d007d0067",
       INIT_2F => X"002f0011001000130018001c000e0013002b004100600063008c00ad00850043",
       INIT_30 => X"009e008b00a700b60097008c00ab00c000ac0074008500880092008d007f0065",
       INIT_31 => X"004100250020001900180011000a000f001400420061004e00620094009c0069",
       INIT_32 => X"00a000a400ae00ab009e0088009400b100b8009300a90097007f008b008e007d",
       INIT_33 => X"0067004d003f002b002100180011001a001f003e004800320048005a00780088",
       INIT_34 => X"00a000a300a700a700b100a8008c007800ab008f00760082007b009c00a60091",
       INIT_35 => X"007c0069005b004e004c00420038004300460041004100490064007b0051006a",
       INIT_36 => X"009c009f008c009300b400aa0099007b008b009c0073007e0083009e00a800a2",
       INIT_37 => X"007f0077007b00780070006800690077007400690068006d007a0086005c0068",
       INIT_38 => X"00a4009e007b008b00ad009c008d008c008d0079008200a10097009d00a600a8",
       INIT_39 => X"0090008a008f008400810085008a0094008f0089008600840078006400730093",
       INIT_3A => X"008e0095009000a800a700a1009e009e00a50090009700a900a100a0009e00a2",
       INIT_3B => X"009900910089007f008d00950096009e009f00960094008f007b0077008b009f",
       INIT_3C => X"009800a600b300b900a700a700aa00a800a700a400ad00b200a9009d00890085",
       INIT_3D => X"0092008f008c0088008c00970098009d00a6009c009900900085008300900099",
       INIT_3E => X"009f00b200b700ab008b007d0091009f00a2008b0095009c009e009800830073",
       INIT_3F => X"0084008e0094008f0090009d009c00a100a7009f0094009c009c009600990098",

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
