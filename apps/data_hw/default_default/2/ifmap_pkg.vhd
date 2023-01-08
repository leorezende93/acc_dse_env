library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
package ifmap_package_package is
  type mem is array(0 to 4000000) of integer;

  constant input_map : mem := (

    -- ifmap
    -- channel=0
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    
    -- channel=1
    0, 0, 0, 96, 108, 55, 33, 
    56, 12, 76, 0, 0, 0, 23, 
    0, 15, 42, 0, 0, 21, 7, 
    0, 43, 95, 97, 17, 19, 0, 
    0, 0, 41, 0, 93, 115, 0, 
    67, 70, 184, 90, 0, 0, 0, 
    23, 214, 35, 0, 0, 0, 0, 
    
    -- channel=2
    5, 0, 0, 28, 58, 31, 39, 
    314, 14, 0, 29, 194, 36, 56, 
    128, 111, 0, 23, 463, 34, 0, 
    0, 22, 0, 96, 242, 0, 0, 
    0, 378, 146, 0, 0, 10, 0, 
    0, 157, 206, 0, 13, 0, 0, 
    123, 0, 124, 12, 0, 3, 0, 
    
    -- channel=3
    0, 0, 15, 0, 0, 0, 0, 
    0, 0, 0, 0, 17, 0, 0, 
    0, 0, 0, 0, 54, 0, 0, 
    0, 0, 56, 0, 0, 0, 0, 
    0, 0, 0, 75, 0, 0, 119, 
    0, 157, 0, 0, 0, 45, 0, 
    21, 0, 0, 0, 19, 0, 33, 
    
    -- channel=4
    0, 6, 0, 0, 0, 0, 0, 
    0, 0, 0, 13, 0, 0, 121, 
    0, 110, 0, 0, 0, 106, 0, 
    0, 6, 0, 0, 0, 203, 0, 
    0, 0, 60, 57, 27, 55, 0, 
    0, 0, 0, 0, 6, 0, 0, 
    50, 182, 0, 8, 0, 10, 0, 
    
    -- channel=5
    57, 103, 0, 12, 32, 17, 46, 
    0, 42, 0, 21, 54, 9, 23, 
    0, 0, 0, 9, 11, 25, 6, 
    0, 23, 0, 13, 41, 9, 0, 
    8, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 23, 0, 13, 
    9, 0, 22, 38, 26, 19, 0, 
    
    -- channel=6
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    5, 0, 1, 2, 0, 0, 0, 
    0, 0, 27, 0, 14, 17, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 15, 0, 0, 0, 0, 
    59, 2, 0, 1, 6, 24, 21, 
    
    -- channel=7
    0, 0, 0, 0, 0, 11, 0, 
    5, 0, 0, 17, 6, 28, 64, 
    1, 0, 31, 12, 5, 23, 45, 
    8, 33, 18, 8, 19, 34, 48, 
    0, 0, 56, 49, 0, 46, 26, 
    0, 8, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    
    -- channel=8
    34, 0, 0, 74, 74, 42, 50, 
    0, 9, 9, 10, 0, 17, 50, 
    0, 0, 0, 5, 0, 62, 4, 
    25, 31, 0, 91, 0, 78, 0, 
    0, 0, 22, 0, 93, 91, 0, 
    13, 0, 131, 95, 0, 0, 0, 
    0, 91, 28, 0, 0, 0, 0, 
    
    -- channel=9
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 41, 0, 25, 0, 
    0, 0, 0, 60, 0, 23, 0, 
    54, 0, 0, 16, 0, 0, 0, 
    31, 0, 8, 23, 14, 0, 0, 
    0, 0, 170, 59, 86, 39, 47, 
    0, 39, 135, 86, 77, 76, 114, 
    
    -- channel=10
    104, 97, 81, 148, 45, 0, 77, 
    0, 56, 37, 0, 24, 12, 10, 
    0, 155, 45, 0, 14, 28, 0, 
    0, 0, 116, 57, 57, 54, 27, 
    0, 0, 19, 0, 75, 29, 2, 
    77, 80, 146, 80, 0, 0, 0, 
    36, 158, 0, 0, 0, 18, 21, 
    
    -- channel=11
    50, 75, 28, 0, 0, 0, 0, 
    0, 0, 0, 0, 78, 0, 0, 
    0, 55, 44, 0, 37, 0, 0, 
    0, 0, 100, 0, 63, 0, 17, 
    19, 0, 0, 0, 0, 0, 0, 
    95, 2, 0, 7, 0, 20, 11, 
    4, 83, 4, 24, 50, 46, 23, 
    
    -- channel=12
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 13, 13, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    13, 0, 0, 0, 22, 0, 14, 
    30, 0, 0, 6, 0, 0, 1, 
    33, 0, 0, 0, 0, 18, 27, 
    0, 0, 0, 57, 56, 65, 46, 
    
    -- channel=13
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 34, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 35, 
    0, 23, 124, 3, 0, 26, 0, 
    0, 26, 0, 21, 6, 24, 23, 
    0, 0, 12, 30, 36, 53, 64, 
    
    -- channel=14
    129, 146, 39, 108, 25, 0, 51, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 112, 0, 0, 0, 5, 0, 
    0, 0, 28, 79, 56, 56, 0, 
    54, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 19, 0, 0, 0, 0, 0, 
    
    -- channel=15
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 28, 66, 101, 38, 
    102, 0, 0, 98, 78, 89, 86, 
    119, 25, 0, 77, 96, 53, 71, 
    183, 116, 12, 40, 37, 24, 57, 
    133, 120, 57, 80, 110, 132, 138, 
    154, 139, 169, 146, 156, 171, 187, 
    
    -- channel=16
    0, 0, 10, 166, 181, 169, 103, 
    80, 70, 151, 77, 0, 0, 28, 
    45, 17, 28, 0, 0, 33, 0, 
    29, 104, 29, 0, 0, 0, 0, 
    0, 0, 43, 47, 55, 52, 106, 
    64, 36, 209, 103, 86, 115, 66, 
    23, 97, 0, 0, 0, 0, 0, 
    
    -- channel=17
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 15, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 6, 0, 0, 33, 0, 
    104, 0, 179, 155, 125, 156, 124, 
    193, 125, 160, 152, 169, 194, 176, 
    
    -- channel=18
    6, 28, 0, 0, 0, 0, 0, 
    0, 17, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    
    -- channel=19
    98, 97, 75, 81, 80, 73, 65, 
    97, 136, 83, 91, 94, 90, 42, 
    104, 90, 96, 118, 95, 115, 60, 
    118, 109, 78, 123, 70, 65, 93, 
    92, 151, 70, 59, 79, 16, 21, 
    35, 46, 47, 0, 0, 0, 0, 
    0, 13, 0, 0, 0, 0, 0, 
    
    -- channel=20
    99, 115, 123, 87, 86, 75, 72, 
    69, 112, 67, 64, 5, 18, 68, 
    43, 50, 34, 30, 0, 36, 60, 
    7, 93, 0, 9, 0, 33, 33, 
    0, 6, 0, 21, 25, 23, 43, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    
    -- channel=21
    90, 94, 74, 44, 38, 49, 71, 
    60, 54, 0, 38, 38, 58, 62, 
    80, 14, 2, 70, 49, 46, 45, 
    63, 53, 38, 90, 68, 53, 73, 
    68, 28, 0, 8, 44, 0, 29, 
    0, 2, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    
    -- channel=22
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 23, 0, 
    10, 0, 50, 17, 0, 17, 0, 
    76, 0, 0, 46, 0, 2, 0, 
    118, 28, 0, 17, 0, 0, 0, 
    110, 18, 123, 134, 26, 24, 62, 
    0, 175, 61, 51, 53, 72, 76, 
    
    -- channel=23
    278, 266, 190, 209, 116, 108, 193, 
    190, 240, 150, 21, 53, 3, 43, 
    85, 62, 123, 28, 52, 0, 16, 
    64, 100, 87, 17, 10, 0, 64, 
    31, 64, 48, 39, 47, 23, 118, 
    55, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    
    -- channel=24
    0, 0, 0, 43, 0, 108, 0, 
    9, 0, 0, 151, 0, 101, 132, 
    111, 0, 0, 237, 0, 176, 98, 
    196, 121, 0, 83, 0, 146, 0, 
    70, 0, 37, 118, 83, 31, 0, 
    0, 0, 162, 0, 36, 0, 0, 
    6, 17, 0, 11, 0, 0, 0, 
    
    -- channel=25
    6, 0, 30, 17, 92, 50, 36, 
    158, 80, 138, 52, 70, 44, 38, 
    66, 54, 89, 46, 151, 34, 54, 
    34, 42, 49, 53, 39, 0, 31, 
    23, 175, 166, 43, 55, 102, 33, 
    28, 154, 189, 40, 0, 16, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    
    -- channel=26
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 11, 
    31, 0, 0, 0, 0, 0, 0, 
    48, 24, 5, 42, 32, 25, 0, 
    71, 126, 134, 138, 167, 179, 176, 
    208, 125, 174, 163, 172, 191, 225, 
    
    -- channel=27
    0, 2, 0, 0, 0, 0, 0, 
    0, 4, 47, 42, 0, 78, 0, 
    0, 101, 0, 83, 0, 58, 0, 
    17, 5, 0, 80, 0, 37, 0, 
    28, 0, 139, 0, 0, 0, 0, 
    0, 0, 0, 0, 34, 0, 4, 
    0, 0, 18, 24, 13, 36, 10, 
    
    -- channel=28
    0, 0, 0, 0, 77, 0, 4, 
    80, 18, 0, 0, 51, 0, 30, 
    0, 63, 0, 0, 145, 0, 0, 
    0, 37, 0, 0, 0, 0, 0, 
    0, 68, 10, 0, 0, 119, 0, 
    0, 0, 0, 0, 103, 66, 5, 
    166, 0, 97, 48, 65, 56, 11, 
    
    -- channel=29
    0, 3, 0, 0, 0, 0, 0, 
    0, 41, 78, 35, 0, 34, 0, 
    35, 0, 45, 111, 0, 5, 46, 
    92, 0, 0, 0, 0, 0, 0, 
    43, 3, 46, 44, 0, 0, 0, 
    0, 0, 0, 0, 94, 94, 83, 
    0, 0, 0, 48, 54, 48, 57, 
    
    -- channel=30
    144, 176, 162, 103, 103, 74, 104, 
    106, 180, 121, 37, 59, 20, 67, 
    52, 106, 66, 0, 52, 0, 36, 
    0, 34, 44, 0, 39, 0, 60, 
    0, 51, 23, 8, 0, 0, 70, 
    0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 
    
    -- channel=31
    0, 0, 0, 0, 0, 23, 0, 
    0, 0, 0, 0, 22, 10, 45, 
    1, 0, 0, 3, 23, 18, 47, 
    69, 30, 0, 8, 21, 2, 0, 
    96, 66, 57, 39, 58, 58, 38, 
    105, 7, 72, 126, 126, 136, 150, 
    187, 102, 146, 150, 158, 169, 171, 
    
    
    others => 0);
end ifmap_package_package;
