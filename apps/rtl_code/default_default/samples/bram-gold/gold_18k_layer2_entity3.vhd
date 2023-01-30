-- https://docs.xilinx.com/r/en-US/ug953-vivado-7series-libraries/BRAM_SINGLE_MACRO

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

entity gold_18k_layer2_entity3 is
    generic (
        DEVICE: string := "7SERIES"
        );
  
    port (
        RST  : in std_logic;
        CLK  : in std_logic;
        EN   : in std_logic;
        WE   : in std_logic_vector(2-1 downto 0);;
        DI   : in std_logic_vector(16-1 downto 0);
        ADDR : in std_logic_vector(10-1 downto 0);
        DO   : out std_logic_vector(16-1 downto 0)
    );
  end gold_18k_layer2_entity3;

  architecture a1 of bram is

    begin

    BRAM_SINGLE_MACRO_inst : BRAM_SINGLE_MACRO
    generic map (
       BRAM_SIZE => "18Kb",             -- Target BRAM, "18Kb" or "36Kb"
       DEVICE => DEVICE,                -- Target Device: "VIRTEX5", "7SERIES", "VIRTEX6, "SPARTAN6"
       DO_REG => 0,                     -- Optional output register (0 or 1)
       INIT => X"000000000000000000",   -- Initial values on output port
       INIT_FILE => "NONE",
       WRITE_WIDTH => INPUT_SIZE, -- 0, -- Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
       READ_WIDTH => INPUT_SIZE, -- 0,  -- Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
       SRVAL => X"000000000000000000",  -- Set/Reset value for port output
       WRITE_MODE => "WRITE_FIRST",     -- "WRITE_FIRST", "READ_FIRST" or "NO_CHANGE"
       -- The following INIT_xx declarations specify the initial contents of the RAM
       INIT_00 => X"00000000000000000000000000000022004100000082002d004400ea010e0000",
       INIT_01 => X"000000000027002f000000000000000000000000000000000000000000000000",
       INIT_02 => X"000000cf008700a400de00c200bf00c300cc00e4000000000000000000030000",
       INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_04 => X"0000000000000000000000820070000000e4009d000000ae0073001000000000",
       INIT_05 => X"000000000000000000000000000000000000000000000000001b000000540000",
       INIT_06 => X"00000000000000000000000000000031007d00ed007e007201090000000000d3",
       INIT_07 => X"0023000000000000000000000000000000000000000000ca00b8009e00a60000",
       INIT_08 => X"003a00660000004e0092008f0083004e0006007c00db00b50136000000000000",
       INIT_09 => X"00000000000000000000004d0000000000000000000000000000000000000000",
       INIT_0A => X"0000000000000000000000000040000000bc00f8001500e40031000000000000",
       INIT_0B => X"00000000000000000000000000000000000000000000000000000000004900a5",
       INIT_0C => X"006500000000000000000000005c003400c4000000000000002d006900700000",
       INIT_0D => X"0000006400b50084006f00000000000000000000000000000000000000000000",
       INIT_0E => X"0000000000000000000000000000003b0000005c00c3000000bc00ae002a0078",
       INIT_0F => X"00000000000000000000000000000000004b0000000000000000000000000000",
       INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_11 => X"00000000000000000094006e00ae00b90077012c006e00bc0077000000000000",
       INIT_12 => X"00000000000000470000000000190000005d0082007e0070008200aa00e30000",
       INIT_13 => X"0000000000000000000000000000007000000000000000000000000000000000",
       INIT_14 => X"0000000000000000000000000000000000000000011500ae00e000fe01450116",
       INIT_15 => X"0059011c00f5000000000000000000000000000000000000005a0057003400bc",
       INIT_16 => X"00ac0096006400660034003200000000000000000000004e008000a7005e000b",
       INIT_17 => X"0000000000000000000000000000000000250000000000c10000000000400060",
       INIT_18 => X"004b004001080120000900e200d300570169016d0215000401b9000000000000",
       INIT_19 => X"01b701da000000000000007300410000008f00af000000000000000000000000",
       INIT_1A => X"0000000000000000037c02790120014900000000000000000000000000000000",
       INIT_1B => X"000000000000000000000000016000000000004b000000000000000000000000",
       INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_1D => X"000000000008009e013b01bf00eb003b000000be000000000000000000000134",
       INIT_1E => X"001e014200000000000000000000000000000000000000000000000000000000",
       INIT_1F => X"0000000000e3000000000000006900d100fe00eb000e00000000000000000000",
       INIT_20 => X"00000000016300cc016c00d000ca00b400730000000000000065002600940156",
       INIT_21 => X"00000000006c0000000000860000000000000000000000000000000000000000",
       INIT_22 => X"0000000000000000000000000000000000000000000001ec022f004200db0262",
       INIT_23 => X"005f009e008c000000c6017a00310027000d00000000006a0000001101b70000",
       INIT_24 => X"0170012000000000000000000051008c0148008200c400a400a1009701390000",
       INIT_25 => X"0000000000000000010000000000000000000000000000000000000000000000",
       INIT_26 => X"0000000000000062002900e6011c0109009f0000000000000000000000000000",
       INIT_27 => X"0000000002360000000000000000000000000000000000000000000000000000",
       INIT_28 => X"00000000000000000000008400aa00330040000000000000004600f500000000",
       INIT_29 => X"0000000000000000000000000000000000c80000019401f9008a000000000000",
       INIT_2A => X"028f026b016a01d2035600000127000000260000000000000000000000000000",
       INIT_2B => X"00000000000000000000000000000000008e020000d80135002a000000000000",
       INIT_2C => X"00000008000000000000000000fb000000000000000000000000000000000000",
       INIT_2D => X"0000008701cf003f0124000000110000000000f401120000012d000000590000",
       INIT_2E => X"004f00880084000000bc0000000000c7011501c9008201bf009a000000000046",
       INIT_2F => X"0000000000000000000000000089000001790000000000000000000000000028",
       INIT_30 => X"00d701ba019b00a602a201a8037400b301c70026027b02310064005e007a0053",
       INIT_31 => X"005a00d700ca0000000000000000000000000000000000000000000000000000",
       INIT_32 => X"000000000000000000000000001a009c00000000002b00780051000000b1009d",
       INIT_33 => X"00bb000000000000000000000000000000000000000000000000000000000078",
       INIT_34 => X"0000005000000000000000000000000000000000000000000000000000000000",
       INIT_35 => X"000000000000000000ce005901270017000000b3000000000037000000000000",
       INIT_36 => X"0000000000000000000000000224007f004000f3007200000175016801980000",
       INIT_37 => X"001100000000011e0000004501030000000000000000000000b5000000000078",
       INIT_38 => X"000000000000000000000000000000000000000002c801de0134012c02670182",
       INIT_39 => X"0154013801650000000000000000000000000000000000ad0000000000000010",
       INIT_3A => X"0000000000590000000000c3000000000000000000c1000000000010001a0153",
       INIT_3B => X"000000200000000000000000000001a501d1008901a00096000400af01340000",
       INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
       INIT_3D => X"000000000033007500000000006f00000000002e000000000000000000000000",
       INIT_3E => X"000000000000000000000000000000000000001e00000029002a017e01b50155",
       INIT_3F => X"00bd016801ea0081018f01e80000006f000000000016009100f100d3003d0000",

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
