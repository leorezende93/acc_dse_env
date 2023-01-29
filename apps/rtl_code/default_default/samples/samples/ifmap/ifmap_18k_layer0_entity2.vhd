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

entity ifmap_18k_layer0_entity2 is
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
  end ifmap_18k_layer0_entity2;

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
       INIT_00 => X"0031002f00330035002e0029002f002d002c00290029003400310029002d002c",
       INIT_01 => X"002800260027002b002c002d002d002b002c0027002b00290026002400240021",
       INIT_02 => X"00330028002d00380031002b002f002d002e0026002900360034002900280021",
       INIT_03 => X"001e00210029003200350037003400300032002e002d00260022001f00200022",
       INIT_04 => X"002f002100240030002a002c002d002d002b002b003000390033002600250023",
       INIT_05 => X"0027002f0036003100340032002f003200300037003300270023002200220021",
       INIT_06 => X"00280020001f002c002b002e00300030002c002d0039005f004b0029002f0036",
       INIT_07 => X"003a0043002f0041004c00540042003200340027002d002e002b002700270024",
       INIT_08 => X"002900300031002f002b0028002f002c0029002a003b00a4006b0038003c0047",
       INIT_09 => X"0032001f00380062006f00760069005d00430046002f002d0030002e00240024",
       INIT_0A => X"0036004000390035002c00270029002900250027002a0055004e003a002b001f",
       INIT_0B => X"002b002d004c006e0078007a0074006000610056002f00250031003a002c0028",
       INIT_0C => X"003900500011001c0030002b0028002b002a002500270034003b004b00460039",
       INIT_0D => X"00480040004a00790084006c005a005e0067004d004500270024003a00300027",
       INIT_0E => X"005a005c002600290038002a002400270031003300330031004d006b005d004f",
       INIT_0F => X"005800520045006b008c0070005100580054004a003a00310020003200330027",
       INIT_10 => X"00900069003b00710052002b002900320042005f003b004e007900800065004a",
       INIT_11 => X"004d00520049003d0070007b005d00460045004c00430035001b0023003b002d",
       INIT_12 => X"00a3008f0069009500700033002f003c009200c600a600770091007d006b004f",
       INIT_13 => X"004f00470035003a0070007a00720059004a004e004e0047002b000f002c0039",
       INIT_14 => X"00af007a009e00a8007a00320033002f00b300e200bc0083009b008400680068",
       INIT_15 => X"0045004d0028004d009a0089008a005c004d0060004f0049003b0021001f002e",
       INIT_16 => X"00bd0074009900b20088003b0037002c005000bc00a400850097009f006a005f",
       INIT_17 => X"0059004f0022007100c0008e00820052004b0058005e0051004e00370030001a",
       INIT_18 => X"00c20069009000b9008500440035002f002c0098007e005e009400b700810062",
       INIT_19 => X"0069006d002f008c00b2008c006f0053004f0050005500510059004900400018",
       INIT_1A => X"00c1006700a300c000620042003a0032002700780067007f009b00c8009d0075",
       INIT_1B => X"006b006d0044009300ae008800680050004c00460048005e0063005100450022",
       INIT_1C => X"00c4007000ac00bc006d0043003e003700220058006700a900a9009f008c0086",
       INIT_1D => X"007d005f0046009500aa007f007a00690053005b005a0068006f00500035002f",
       INIT_1E => X"00c5008800ae00b5008e004d0058004d0034005d007400d300e6008900820070",
       INIT_1F => X"0065005f004b00760092008a006500500044005700630063005d003600300030",
       INIT_20 => X"00cc00a000b200bc00ac005a007e0071005200250085009b008d00750058005a",
       INIT_21 => X"005c0057003a0068006d007e007600610048004d005e00520037002d0037002e",
       INIT_22 => X"00d700b400b800c200ba006900660091006f003d0069005f0059005900490062",
       INIT_23 => X"0058005f00660040002000690073003d003300350041004e0040004400400036",
       INIT_24 => X"00cd00c000bd00c100bc00850060008f008d006f00500037006c006000640085",
       INIT_25 => X"005d005d0078005d005c0056003a00340027003c0028003b003e0036002d002e",
       INIT_26 => X"00b400bb00b500b900b800980063008400820087007e0033006c0056007b00a8",
       INIT_27 => X"00760049006700690076004e002c00320034005d003c0044004000340032002e",
       INIT_28 => X"009200bb00af00ac00b400a0006f009200b9006f005700490056007400ad00b1",
       INIT_29 => X"009400650042003f003900360033002900450053004b0052004c003d0045003f",
       INIT_2A => X"007c00c800b000a800b30093005b009f00fa00e10090009300a400c000d000c5",
       INIT_2B => X"00b5008f006d003e003a004400570066006e006f007a00770078007000700073",
       INIT_2C => X"008500d500c000b100b60096007100d100f700fc00e8009d009500a2009c0098",
       INIT_2D => X"0094007700680065006f006e0073007d008300820087008d008e008400890084",
       INIT_2E => X"008700a800bc00bc00c000ae00a400ed00f100e40099006f00690069006b0065",
       INIT_2F => X"0073007800710074007d007d007e00800084008b0089008900870086008b0085",
       INIT_30 => X"008d0082008600b000bf008900b500f200f500af007f00760077007900780074",
       INIT_31 => X"00750075007300710078007d007d008200860091008e008e00920090008c0095",
       INIT_32 => X"00a2008c007c008800a7008f00d100f900cd00760080007d007f007f00790073",
       INIT_33 => X"0071007000710075007b00830086008a0096009800930095009a009800a700b6",
       INIT_34 => X"00a500930082007a007e00a400ea00f700990072007b00830081007700770077",
       INIT_35 => X"00770077007b007f0083008d0096009a0096008d008c008a009e00b200b600a9",
       INIT_36 => X"00a20095008a0085007e008a00e900ea008c007e0081007c0085007b00740077",
       INIT_37 => X"007a007e00820084008c008a008b00940093008b0085009900b600b0008e008b",
       INIT_38 => X"00a10093008f008d008a007d009f00d30077007900800082008b008700830078",
       INIT_39 => X"00760078008200870088008b008a00880087008a009700b200a4008c00670088",
       INIT_3A => X"00b1009400890092008b00840071008500720069006900750080008700890080",
       INIT_3B => X"00830089008b008a008900880083007d0085009a00b300b500a80092006c007f",
       INIT_3C => X"00a800940084008f008b0086007d0070007300680066006d006a006c00730078",
       INIT_3D => X"008000870090009c00980086007f007f009000aa00c500be00a40082007e006b",
       INIT_3E => X"00a000950084008600860084007b0073007200690065006c0068006c00620059",
       INIT_3F => X"0064007600890098009100830082007b009100a700b600af0091007c0081006e",

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
