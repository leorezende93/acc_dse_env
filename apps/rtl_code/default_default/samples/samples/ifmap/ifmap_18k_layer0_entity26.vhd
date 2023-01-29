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

entity ifmap_18k_layer0_entity26 is
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
  end ifmap_18k_layer0_entity26;

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
       INIT_00 => X"0017001c0013002800710073006d007400710067006a0069006900690069006b",
       INIT_01 => X"006a0063004c003a0054005600720089007c007d007c007d007f007d007a0078",
       INIT_02 => X"0018001b0014001a006a00820076007c007d0072006d00750078007600720079",
       INIT_03 => X"00850083006a0044003e0051008c0096008a008c008900880088008500810080",
       INIT_04 => X"0018001a00170012005800830074007b008b008d007400740081007f007d0084",
       INIT_05 => X"008e009a0098006900370059009f009e009700970092008e008e008b00880084",
       INIT_06 => X"00180019001900120045007c006a0073009c00a6009200780089009400950097",
       INIT_07 => X"0096009c0094006d004a007a00b100a900a1009d00980095009600940091008e",
       INIT_08 => X"00190018001900170033006d0060006800a100b800b2008d007c008000860093",
       INIT_09 => X"009700960089006c0060009800b700b500b300ae00a800a400a0009c00980093",
       INIT_0A => X"001a001a001b001c00230059005f0066009600c100c7009f0074006600620076",
       INIT_0B => X"008200830077007a008400a700a600aa00b200b700b300b700b700b100af00a9",
       INIT_0C => X"001a00160019001a001d005c0080007b009300c300c700ab007e005e0063006a",
       INIT_0D => X"0060006d0065007a00ac00c000aa00b000c300c400c500ca00c500bf00bf00c2",
       INIT_0E => X"004d0021001100190058009a009b007e008c00be00c100b900a30081007b0071",
       INIT_0F => X"005800670068007900b100c600a500bd00e400db00e000da00ba00bb00c400cd",
       INIT_10 => X"0095008000560060009b00a700990077006f00a800bf00bf00b700aa0094007f",
       INIT_11 => X"007000700074007c00a300bb00a200c100df00d500cf00bb009d00a600c400d2",
       INIT_12 => X"00a1009e0092009b00a700a9009f00750068009b00b300b500b600b4009f0087",
       INIT_13 => X"0064007400750079009e00b200b200cc00d800d600cb00a70093009600b000cf",
       INIT_14 => X"00aa00a5009e00a500af00b000a00070007b00a400b100b400b600ac00950079",
       INIT_15 => X"006a007400750076009c00a600af00d100de00d800cd00a900910093009f00ba",
       INIT_16 => X"00ac00ae00a900a600b000b0009d007a008d00b100b900b600b6009d007f0068",
       INIT_17 => X"00730084007b007d009f00a400a300ce00e000d900cd00b50092008e0093009c",
       INIT_18 => X"00a700a700a500a000a500a40099008f009100a300ae00a400a3009f00850076",
       INIT_19 => X"0086009f0087009200a300a300a800cd00df00dc00d600c700a3009000900098",
       INIT_1A => X"00a900a200a0009b00a30088008300a40092008800840085009f009e00870092",
       INIT_1B => X"00a700a20090009e0098009800b000cb00d700d800dd00da00c5009f00a200b6",
       INIT_1C => X"00ae00a400a2009d00a80078006d00b200a600a700a100a300b600ab00840078",
       INIT_1D => X"00a900a3008c009500a600a400aa00cc00d300d500da00e400d600b000bb00c7",
       INIT_1E => X"00af00a000a1009f00aa0084006800b700bc00b600b800b000a200a800a3008d",
       INIT_1F => X"009100a50092008500af00a5009600a900ca00d400d900dd00c400ba00c700c7",
       INIT_20 => X"00b3009f0092009400a10097006d00a800c700b500a400ae00a5009c00aa00a6",
       INIT_21 => X"00690088009f0077008f009e007e0050007600b700d100cd00af00b700c900c5",
       INIT_22 => X"00b500a400850083009500a50097009f00c200c700c400cd00b900a800ac00a2",
       INIT_23 => X"00680069009b0077008600ad0088005c004b006f0098009e009800b000cb00c8",
       INIT_24 => X"00b700ac008e0085009f00b000b100aa00b100c500cf00d900d900c600bb00aa",
       INIT_25 => X"0083005a0085007e008b00a20082007e006f006000760084007c009200b800c7",
       INIT_26 => X"00b900b000a1009500af00b700b600bc00aa00aa00b900c200c900d000ca00af",
       INIT_27 => X"00a4007b00710091009d008c0071007b007700700086008e007f0079008400a6",
       INIT_28 => X"00bd00b700ad009b00ab00ba00b100b200b400ac00b200b100a400bc00c300bd",
       INIT_29 => X"00c900b60088009d00930078006a007c0080008a0094008a00780077007a0082",
       INIT_2A => X"00bd00bc00b700a1009e00b700bb00b000b800bf00c000a4008b00a600ad00b1",
       INIT_2B => X"00c000bc00a200960076006b00790085008e0096008d007d0075007c007d006c",
       INIT_2C => X"00ba00ba00bb00a6009400b400c700c500c100c300c000a80091009f00a900aa",
       INIT_2D => X"00af00ac00a30086005d006c0086008b008d0097008e007c007c00720065005b",
       INIT_2E => X"00ba00b500b700ac008f00b000c900cf00ce00cb00bd00af00a500ab00ae00ac",
       INIT_2F => X"00b200ab009e007500610078008a0088008a00a1009200840082006d00640068",
       INIT_30 => X"00b800b200af00a9009200aa00c600ca00c800c500ab008800a100b400ab00aa",
       INIT_31 => X"00ad00a800900073006c007c0086007e0082009900910087007700750074006f",
       INIT_32 => X"00b800b000a8009d009300a200c000c800bf00b900810052008d00b300a6009f",
       INIT_33 => X"009f0096008400740069007a007f007a007f00840080007a00770077006b0062",
       INIT_34 => X"00b800ac00a300940086009200ba00ca00c000b200820058008c00ac00980090",
       INIT_35 => X"00910084007a00690064007700790070007a00710064006c007c007a00750072",
       INIT_36 => X"00b700a9009e008e007e008400b200cc00c300af009d009000a4009800870083",
       INIT_37 => X"007c0074006f0054006100730071006d00720066005f0064007400820082007b",
       INIT_38 => X"00b100a10099008e0077007a00b200cc00c500b400aa00a8009d0087007a007b",
       INIT_39 => X"0077006d005e004b0068006f0070007100700064005c006600770082007e0073",
       INIT_3A => X"00a30090008d00910074006b00a900c800c200b700ac00a30096008100730079",
       INIT_3B => X"00700064004e005100680065006a00720072006300630070007600750074006e",
       INIT_3C => X"008e007e0083008f007c005f009100c000be00b700b200a800820062005c0065",
       INIT_3D => X"0068005c004b005f00630061006a0074006d006c0071006e0067006c00740077",
       INIT_3E => X"007b00680070007800740057007600ae00b500ae00a4008d0063004500390046",
       INIT_3F => X"0057005100580060005d005e006b0070006b006c0061005d00650076007b0076",

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
