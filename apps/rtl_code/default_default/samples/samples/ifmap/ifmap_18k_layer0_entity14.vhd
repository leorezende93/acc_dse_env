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

entity ifmap_18k_layer0_entity14 is
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
  end ifmap_18k_layer0_entity14;

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
       INIT_00 => X"00320040002e001e0016002400370039003b0036000c0012002b002c00310032",
       INIT_01 => X"003a004d0051004d0053004e003800390061005d001f003a0041002900350042",
       INIT_02 => X"003a00510039001d0023003d003b003c0040002f0007001b0038003e003b002f",
       INIT_03 => X"0044004a004a0044004e00510033003c006f006000150027002d002c00450042",
       INIT_04 => X"004800570046002300350048003c004100450026000700230034004100300021",
       INIT_05 => X"0043004200320037004d0052002d003e0074006300100026003f004b004d0033",
       INIT_06 => X"005e004c0050002f004700480041004a0048001e000c0022002800340023001e",
       INIT_07 => X"004b0057004400450051004d002e00430077006b002a0049005f006000440022",
       INIT_08 => X"0061004f006a003c004b00440048004c00490018000c0011001c00250033003b",
       INIT_09 => X"0048004f004b004700470049002d004d0080008100520055005e006100490050",
       INIT_0A => X"0052004d004b0043003d0045004d003d00430013000d0016002c003b00470049",
       INIT_0B => X"004800480049003500220049003e004d008800930060005b005c006e0068005c",
       INIT_0C => X"0048004600190033003e004f004f00320038000f001800360049004b004d003e",
       INIT_0D => X"002200330060002a001600580048004a009500a10068006c006b00830051002b",
       INIT_0E => X"003f003b00150046004d0048004b003a00290008002f0051004b004b003e0012",
       INIT_0F => X"0006002700590040002a005e00480053008300a2007200780076008500340015",
       INIT_10 => X"004900350031006800790058003900460033001700470053004e004f00220007",
       INIT_11 => X"00280051003c003e00500063005b005d0073008d007800790079007c00210014",
       INIT_12 => X"0056003a003800760083007f00400033003b004000610063005e003a000d001c",
       INIT_13 => X"0053005d0049005000620069005f004a007400840077007e007f0065000d0017",
       INIT_14 => X"005b003b0035007400840087006700300020004b006000610066004a00320049",
       INIT_15 => X"005a0052005900610062006c004700310077007c0077008a007b005b000a0014",
       INIT_16 => X"00650033002f006e0081008700870048002e00540052004f005e005600750087",
       INIT_17 => X"00780066005d005e005c0058004a0058008400730076008d0077005b000b0007",
       INIT_18 => X"0058002800280060006b0083008b0077006b006600570059005f004a0051006c",
       INIT_19 => X"0076006e0064005d006600550057005f007c007800650071007b0059000f0020",
       INIT_1A => X"005f003f0037005c0064006e008b0089007b00610065005c005a005800560056",
       INIT_1B => X"005500580064006c0072006c006e005f006d0075006b0073008000580031004c",
       INIT_1C => X"006a0045004700600068005600860087007400570051005800600060006e006a",
       INIT_1D => X"0062005f0057005c0061006b007f0080007a005e00740077007a005c00350046",
       INIT_1E => X"006000400040005c0067005f0079008500810096006400330058006500620071",
       INIT_1F => X"008300770065005f0060005300710098009400780062007c00760039000d0048",
       INIT_20 => X"0057004c0047005a0073007c00780082006e008e0096003a0054007400770078",
       INIT_21 => X"006c0071008500860089007e0067006e009f00a3006300720075002a0021006b",
       INIT_22 => X"005600580064005d0075006300750069006e0066009b008b006b006f00810081",
       INIT_23 => X"007c0077006d007600710076007c007100830075008300630069004800270057",
       INIT_24 => X"005f006000780073006d004700630056006c0063006a00b00082005e007b0075",
       INIT_25 => X"0089008d008100880083006f007800790075006b00500043004800510043006e",
       INIT_26 => X"006d0070007d0057005800480047005e00640079004900730098007600870094",
       INIT_27 => X"0085008200940095007d00710079007a00720071003a004e003d00380073008a",
       INIT_28 => X"007700740059004300580048003c006600480057006d003700650092008d009c",
       INIT_29 => X"00980088008c00980086007b007f007c006d0069005d0062004d0062007a0077",
       INIT_2A => X"007e00610032005d00600046004b0060005a003b007600610049008300a20097",
       INIT_2B => X"009600a30084007f007d0076006e007500690066005e004f006b008e0070006a",
       INIT_2C => X"0070005100370059005c004e004500590077006b00530076006b007d0097009c",
       INIT_2D => X"0094009b0094007e006c007b0078007500720066005400560081007900630069",
       INIT_2E => X"006200560078009a0077005f0045004e0073007e0057004e007d008b00840096",
       INIT_2F => X"008d008e0092007e007900840076007b007300580052006f00790065006a0067",
       INIT_30 => X"0074008800a700b6009f00770060005c0066005a0066006f007000880083008f",
       INIT_31 => X"0086008e009600800075009c0084007700660059004e0053006a00600071006c",
       INIT_32 => X"006c006d0071009200a6009e007b0069006600520055008c0091007e0086007b",
       INIT_33 => X"00680073008a008900830096008a006a0061006f004a002d006000650069004b",
       INIT_34 => X"0058005500370056008b00970097007e0068006800570057006f006e006e0052",
       INIT_35 => X"0035004b0079008c009100780081007a00740062003e00200061006200410040",
       INIT_36 => X"0052005c00220020004b00750086009c008d006d006200570052005a005b005f",
       INIT_37 => X"005200460079008b0081008f0080006b0071004e001d003f0063004700470042",
       INIT_38 => X"005a00560023000d000f004e0072009400a2008b006f00620061005b00560071",
       INIT_39 => X"0078006a0073007e007600870087006a004f002a0026005b002c006000990053",
       INIT_3A => X"005c0056002d0025000d001f0057007a009600ad009e007a00750072005d005c",
       INIT_3B => X"004d005500670071007e00850073005b004e0032003b003c002a006c00860062",
       INIT_3C => X"005200470018003800240017002300540076009200a500a500960082006f0079",
       INIT_3D => X"006c0042003f0062004e0045004600560075006c0060006200780074007b0059",
       INIT_3E => X"0041001b001100400034001d000f0025005900640074009600aa00980088009c",
       INIT_3F => X"00a600790045004a002f00470066007f009c008b008300820093008800920075",

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
