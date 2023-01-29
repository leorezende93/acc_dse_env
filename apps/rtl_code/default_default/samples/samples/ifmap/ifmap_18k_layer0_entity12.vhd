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

entity ifmap_18k_layer0_entity12 is
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
  end ifmap_18k_layer0_entity12;

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
       INIT_00 => X"004100460030001e00170028002c002d002d0028000a000f002c003500330030",
       INIT_01 => X"0041005a005d005b005f0051003c00370070006f00290044004d003300360043",
       INIT_02 => X"0045004f003c001e002900410031003100310023000700190041004500370031",
       INIT_03 => X"004d005500530050005700510037003b00830079001f002f003800360041003d",
       INIT_04 => X"00490054004800290040004a0032003600360020000b0024003c0043002f0027",
       INIT_05 => X"004b004d003b003e005300550030003f008b0080001700290046004e00490030",
       INIT_06 => X"0058004b00500036005000440037003f003a001c00110025002b003300280027",
       INIT_07 => X"00550062004b00460056005400320044008e0089002f004b0064005d00410026",
       INIT_08 => X"005f0059006f00420051003d003d0044003e0016000f0016001f00230033003f",
       INIT_09 => X"0048004b00480047004d00530033004e0095009c005700570063005f004b0058",
       INIT_0A => X"005200530052004d0047003a00400039003b00140011001c0032003d00470047",
       INIT_0B => X"0045004300440038002900530046004e009c00ac00620059005e006f00700063",
       INIT_0C => X"004500400020003b0048004a0049003100310012001d003e005200550056003f",
       INIT_0D => X"00220034005f002b0019005e0055004e00a600b4006d006b006c00830056002f",
       INIT_0E => X"003b0035001900460051004e0050003d0028000a0035005e00570058004b0019",
       INIT_0F => X"000d002d005c00390032006500590062009000b30078007c007c008000340018",
       INIT_10 => X"0044002f0031006600770059003f004f00420022005100600059005a0029000e",
       INIT_11 => X"0034005c00430047006f0071006e00730088009c0079007f007c0073001f0016",
       INIT_12 => X"004d0035003700720080007b00410037004f0052006f006e006a004500140025",
       INIT_13 => X"005c006900530061007600780073005c00900093007d007f0077005f000e0017",
       INIT_14 => X"0055003a003600700081008400640031002700540068006d007d005d003f0053",
       INIT_15 => X"0061005e0068006e006d007f0055003900980096007b007c0072005d000c0015",
       INIT_16 => X"006c00350032006b007e00830080004b0033005b0055006b008a006e00810093",
       INIT_17 => X"008400780071007700750073005a005d00a0008d0071007d00790065000e0009",
       INIT_18 => X"0060002a002b005c006a0080008200770078007b007200890094006e00690084",
       INIT_19 => X"0092008700800086008c0078007e0077009800910063006a0082006300120028",
       INIT_1A => X"00610042003b00590064006f008500880093008c00960091008e00880083007f",
       INIT_1B => X"007d007b008800930097008e009c008800920090006d00700082005c00320053",
       INIT_1C => X"00690048004b005f0068005e00850085008f0087008000850093009600a00098",
       INIT_1D => X"0091009000840087008a008a00a200a500a3007f007e00770076005f003b004d",
       INIT_1E => X"005e00440044005b00650062007b0083009300c1008a004f007c0093009300a2",
       INIT_1F => X"00b400ab0098009000900079009400b300b400a00080007b0070003f001a0054",
       INIT_20 => X"0058004f004a0059006e007800780081007800b800c000570072009c00a400a6",
       INIT_21 => X"009a00a100b700b600bb00ad0094008f00b500c3008e007c006b002c00290076",
       INIT_22 => X"005b00590067006000740064006f006a0072008000bb00a8008c009900ac00ac",
       INIT_23 => X"00a700a4009d00a300a100a500ab009c00a1009100a70072006a004a002a005e",
       INIT_24 => X"006500610078007a0072004e005f005b0073006e008100cc00a7008900a00099",
       INIT_25 => X"00b300ba00aa00b200b3009c00a200a5009c008c006800480054005900460072",
       INIT_26 => X"006e006b007a0060005a004c00480064006d007f0057008c00bd009f00a600b4",
       INIT_27 => X"00ae00ad00be00bc00a2009900a200a100990095004b004a0042003e0070008a",
       INIT_28 => X"0077006a0059004e00590047003c0067004b005f00720042007f00b500ae00be",
       INIT_29 => X"00ba00ab00b800c100a400a000ab00a50092008b0068005c004d005e00700073",
       INIT_2A => X"007e005e003a0067006a004c0048005f005e004100780063005b00a100c400bc",
       INIT_2B => X"00b600c100a700a700aa00a0009a00a10091008a006e005100690088006d0064",
       INIT_2C => X"006f0052004600680071005e004500540074006d0055007d007f009b00ba00c8",
       INIT_2D => X"00bb00bb00b1009d009400a200a400a600a20095007900610078007300610061",
       INIT_2E => X"0065005c008c00b40097007b0055004c0067007c005a0054009200af00ad00c8",
       INIT_2F => X"00bc00ad00ad009f009f00ac00a300ad00a4008b008300830070005f00640060",
       INIT_30 => X"0077009000c000d100c2009d007f006c006a005e006a006f007c00af00b000c5",
       INIT_31 => X"00b800aa00b000a5009c00c500af00a300930083007a006500640060006b0066",
       INIT_32 => X"006e0074008a00a900c500c400a0008800810063005c008a0092009f00b400a9",
       INIT_33 => X"008e008d00af00b200a600bc00b30097008f009a0070003a005b006500660049",
       INIT_34 => X"005b0057004a006b00a500b900bf00a300860080006a00660076008400920074",
       INIT_35 => X"004d006300a100b600b7009f00ad00a7009c0087005e002b005b005c0044004d",
       INIT_36 => X"0051005f0032002c005f009400a600bb00ae0090007e0072006800720077006b",
       INIT_37 => X"00510052009d00b600a900b200a900960098006c002c003f0061004500500056",
       INIT_38 => X"005a005f00340015001c006d009200b000ca00b5008e007f0078007700720082",
       INIT_39 => X"00810076009000a9009f00ad00b4009800770044002c00550033007200a7006a",
       INIT_3A => X"005f005b00390034001800310077009c00bb00cb00ba009b008d008500740075",
       INIT_3B => X"006d0077008b0099009f00a7009c007d00650041004400400037009000aa007a",
       INIT_3C => X"005e004b00200049002e002100360073009600b000c300c200b1009b00880092",
       INIT_3D => X"008b0065005e00770065005f0060006900830076006b006d0080008f009a006a",
       INIT_3E => X"004e00230018004c00410028001b003b00780088009600b000c000b700a500ba",
       INIT_3F => X"00cf00aa006b0056004200550070008c00a90095008900890096008f009a0080",

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
