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

entity {entity} is
    generic (
        BRAM_SIZE: string := {bram_size};
        BRAM_SIZE_ADD: integer := 8;
        DEVICE: string := {device};
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
  end {entity};

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
       INIT_00 => X"{init_xx[00]}",
       INIT_01 => X"{init_xx[01]}",
       INIT_02 => X"{init_xx[02]}",
       INIT_03 => X"{init_xx[03]}",
       INIT_04 => X"{init_xx[04]}",
       INIT_05 => X"{init_xx[05]}",
       INIT_06 => X"{init_xx[06]}",
       INIT_07 => X"{init_xx[07]}",
       INIT_08 => X"{init_xx[08]}",
       INIT_09 => X"{init_xx[09]}",
       INIT_0A => X"{init_xx[10]}",
       INIT_0B => X"{init_xx[11]}",
       INIT_0C => X"{init_xx[12]}",
       INIT_0D => X"{init_xx[13]}",
       INIT_0E => X"{init_xx[14]}",
       INIT_0F => X"{init_xx[15]}",
       INIT_10 => X"{init_xx[16]}",
       INIT_11 => X"{init_xx[17]}",
       INIT_12 => X"{init_xx[18]}",
       INIT_13 => X"{init_xx[19]}",
       INIT_14 => X"{init_xx[20]}",
       INIT_15 => X"{init_xx[21]}",
       INIT_16 => X"{init_xx[22]}",
       INIT_17 => X"{init_xx[23]}",
       INIT_18 => X"{init_xx[24]}",
       INIT_19 => X"{init_xx[25]}",
       INIT_1A => X"{init_xx[26]}",
       INIT_1B => X"{init_xx[27]}",
       INIT_1C => X"{init_xx[28]}",
       INIT_1D => X"{init_xx[29]}",
       INIT_1E => X"{init_xx[30]}",
       INIT_1F => X"{init_xx[31]}",
       INIT_20 => X"{init_xx[32]}",
       INIT_21 => X"{init_xx[33]}",
       INIT_22 => X"{init_xx[34]}",
       INIT_23 => X"{init_xx[35]}",
       INIT_24 => X"{init_xx[36]}",
       INIT_25 => X"{init_xx[37]}",
       INIT_26 => X"{init_xx[38]}",
       INIT_27 => X"{init_xx[39]}",
       INIT_28 => X"{init_xx[40]}",
       INIT_29 => X"{init_xx[41]}",
       INIT_2A => X"{init_xx[42]}",
       INIT_2B => X"{init_xx[43]}",
       INIT_2C => X"{init_xx[44]}",
       INIT_2D => X"{init_xx[45]}",
       INIT_2E => X"{init_xx[46]}",
       INIT_2F => X"{init_xx[47]}",
       INIT_30 => X"{init_xx[48]}",
       INIT_31 => X"{init_xx[49]}",
       INIT_32 => X"{init_xx[50]}",
       INIT_33 => X"{init_xx[51]}",
       INIT_34 => X"{init_xx[52]}",
       INIT_35 => X"{init_xx[53]}",
       INIT_36 => X"{init_xx[54]}",
       INIT_37 => X"{init_xx[55]}",
       INIT_38 => X"{init_xx[56]}",
       INIT_39 => X"{init_xx[57]}",
       INIT_3A => X"{init_xx[58]}",
       INIT_3B => X"{init_xx[59]}",
       INIT_3C => X"{init_xx[60]}",
       INIT_3D => X"{init_xx[61]}",
       INIT_3E => X"{init_xx[62]}",
       INIT_3F => X"{init_xx[63]}",

       -- The next set of INIT_xx are valid when configured as 36Kb
       INIT_40 => X"{init_xx[064]}",
       INIT_41 => X"{init_xx[065]}",
       INIT_42 => X"{init_xx[066]}",
       INIT_43 => X"{init_xx[067]}",
       INIT_44 => X"{init_xx[068]}",
       INIT_45 => X"{init_xx[069]}",
       INIT_46 => X"{init_xx[070]}",
       INIT_47 => X"{init_xx[071]}",
       INIT_48 => X"{init_xx[072]}",
       INIT_49 => X"{init_xx[073]}",
       INIT_4A => X"{init_xx[074]}",
       INIT_4B => X"{init_xx[075]}",
       INIT_4C => X"{init_xx[076]}",
       INIT_4D => X"{init_xx[077]}",
       INIT_4E => X"{init_xx[078]}",
       INIT_4F => X"{init_xx[079]}",
       INIT_50 => X"{init_xx[080]}",
       INIT_51 => X"{init_xx[081]}",
       INIT_52 => X"{init_xx[082]}",
       INIT_53 => X"{init_xx[083]}",
       INIT_54 => X"{init_xx[084]}",
       INIT_55 => X"{init_xx[085]}",
       INIT_56 => X"{init_xx[086]}",
       INIT_57 => X"{init_xx[087]}",
       INIT_58 => X"{init_xx[088]}",
       INIT_59 => X"{init_xx[089]}",
       INIT_5A => X"{init_xx[090]}",
       INIT_5B => X"{init_xx[091]}",
       INIT_5C => X"{init_xx[092]}",
       INIT_5D => X"{init_xx[093]}",
       INIT_5E => X"{init_xx[094]}",
       INIT_5F => X"{init_xx[095]}",
       INIT_60 => X"{init_xx[096]}",
       INIT_61 => X"{init_xx[097]}",
       INIT_62 => X"{init_xx[098]}",
       INIT_63 => X"{init_xx[099]}",
       INIT_64 => X"{init_xx[100]}",
       INIT_65 => X"{init_xx[101]}",
       INIT_66 => X"{init_xx[102]}",
       INIT_67 => X"{init_xx[103]}",
       INIT_68 => X"{init_xx[104]}",
       INIT_69 => X"{init_xx[105]}",
       INIT_6A => X"{init_xx[106]}",
       INIT_6B => X"{init_xx[107]}",
       INIT_6C => X"{init_xx[108]}",
       INIT_6D => X"{init_xx[109]}",
       INIT_6E => X"{init_xx[110]}",
       INIT_6F => X"{init_xx[111]}",
       INIT_70 => X"{init_xx[112]}",
       INIT_71 => X"{init_xx[113]}",
       INIT_72 => X"{init_xx[114]}",
       INIT_73 => X"{init_xx[115]}",
       INIT_74 => X"{init_xx[116]}",
       INIT_75 => X"{init_xx[117]}",
       INIT_76 => X"{init_xx[118]}",
       INIT_77 => X"{init_xx[119]}",
       INIT_78 => X"{init_xx[120]}",
       INIT_79 => X"{init_xx[121]}",
       INIT_7A => X"{init_xx[122]}",
       INIT_7B => X"{init_xx[123]}",
       INIT_7C => X"{init_xx[124]}",
       INIT_7D => X"{init_xx[125]}",
       INIT_7E => X"{init_xx[126]}",
       INIT_7F => X"{init_xx[127]}",

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
