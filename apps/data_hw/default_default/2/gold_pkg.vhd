library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
package gold_package_package is
  type mem is array(0 to 4000000) of integer;

  constant gold : mem := (

    -- gold
    160, 18, 64, 
    260, 81, 188, 
    257, 0, 0, 
    
    71, 0, 28, 
    0, 0, 186, 
    0, 0, 0, 
    
    0, 49, 0, 
    0, 146, 0, 
    0, 0, 0, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0, 
    
    260, 0, 0, 
    2, 0, 0, 
    0, 0, 0, 
    
    168, 0, 56, 
    0, 0, 0, 
    0, 0, 2, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 83, 55, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0, 
    
    0, 0, 15, 
    0, 0, 0, 
    0, 0, 0, 
    
    168, 378, 308, 
    55, 275, 130, 
    183, 53, 0, 
    
    0, 45, 121, 
    0, 333, 98, 
    0, 0, 0, 
    
    0, 0, 126, 
    16, 53, 0, 
    106, 0, 209, 
    
    0, 0, 0, 
    0, 176, 176, 
    0, 160, 51, 
    
    119, 210, 129, 
    198, 0, 0, 
    8, 169, 87, 
    
    0, 101, 200, 
    0, 161, 60, 
    0, 88, 122, 
    
    0, 0, 0, 
    6, 0, 92, 
    0, 0, 0, 
    
    0, 44, 230, 
    0, 119, 72, 
    0, 255, 36, 
    
    0, 0, 25, 
    0, 54, 0, 
    0, 0, 0, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 93, 77, 
    
    181, 108, 170, 
    0, 0, 0, 
    0, 0, 63, 
    
    0, 27, 48, 
    21, 0, 0, 
    0, 281, 179, 
    
    0, 18, 0, 
    170, 0, 189, 
    182, 38, 0, 
    
    0, 40, 0, 
    0, 0, 0, 
    0, 0, 0, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0, 
    
    192, 292, 324, 
    335, 208, 104, 
    23, 0, 64, 
    
    0, 0, 9, 
    87, 22, 0, 
    207, 93, 0, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0, 
    
    168, 1, 184, 
    30, 40, 150, 
    144, 21, 99, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 283, 158, 
    
    0, 0, 108, 
    0, 0, 0, 
    0, 121, 248, 
    
    67, 4, 255, 
    103, 18, 17, 
    0, 0, 28, 
    
    0, 105, 65, 
    0, 134, 78, 
    49, 0, 0, 
    
    145, 108, 81, 
    23, 38, 70, 
    0, 176, 253, 
    
    224, 0, 120, 
    0, 16, 0, 
    0, 0, 0, 
    
    0, 89, 171, 
    193, 251, 239, 
    106, 143, 219, 
    
    59, 83, 20, 
    16, 0, 0, 
    123, 70, 171, 
    
    98, 90, 316, 
    162, 109, 140, 
    122, 291, 81, 
    
    151, 161, 0, 
    0, 0, 0, 
    60, 0, 7, 
    
    0, 0, 0, 
    0, 0, 0, 
    260, 0, 0, 
    
    0, 0, 30, 
    79, 162, 303, 
    140, 0, 0, 
    
    347, 314, 353, 
    131, 161, 114, 
    312, 18, 0, 
    
    0, 136, 112, 
    220, 224, 173, 
    318, 205, 174, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0, 
    
    200, 31, 191, 
    70, 75, 78, 
    27, 38, 0, 
    
    30, 115, 315, 
    159, 54, 30, 
    6, 170, 165, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0, 
    
    106, 67, 118, 
    257, 102, 124, 
    0, 0, 0, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0, 
    
    0, 89, 105, 
    0, 49, 0, 
    0, 0, 0, 
    
    61, 0, 0, 
    16, 49, 114, 
    237, 0, 0, 
    
    0, 0, 0, 
    0, 0, 0, 
    112, 300, 383, 
    
    208, 0, 0, 
    0, 0, 50, 
    0, 103, 8, 
    
    57, 33, 222, 
    109, 68, 118, 
    132, 321, 235, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0, 
    
    178, 120, 110, 
    63, 127, 146, 
    0, 0, 0, 
    
    0, 0, 28, 
    401, 0, 30, 
    52, 135, 328, 
    
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 88, 
    
    74, 70, 0, 
    0, 0, 0, 
    243, 215, 197, 
    
    
    others => 0);
end gold_package_package;
