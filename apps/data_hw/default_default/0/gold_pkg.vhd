library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
package gold_package_package is
  type mem is array(0 to 4000000) of integer;

  constant gold : mem := (

    -- gold
    18, 18, 15, 20, 23, 13, 15, 29, 29, 10, 0, 1, 6, 12, 21, 
    22, 18, 15, 19, 19, 4, 8, 3, 0, 4, 0, 0, 0, 5, 11, 
    0, 11, 19, 27, 18, 27, 32, 30, 0, 0, 0, 0, 0, 0, 1, 
    1, 0, 12, 25, 11, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
    0, 0, 4, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 
    0, 0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 11, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 13, 0, 0, 0, 0, 0, 4, 7, 0, 0, 
    0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 26, 15, 
    63, 10, 0, 0, 0, 50, 58, 56, 37, 32, 34, 41, 37, 39, 32, 
    44, 58, 0, 0, 30, 29, 29, 32, 32, 31, 36, 30, 34, 40, 33, 
    48, 47, 47, 14, 15, 33, 25, 29, 34, 35, 47, 51, 52, 40, 58, 
    41, 51, 49, 65, 42, 48, 42, 31, 23, 28, 33, 45, 26, 28, 41, 
    
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 3, 24, 14, 6, 0, 0, 0, 
    0, 11, 0, 0, 0, 0, 2, 1, 0, 27, 0, 6, 0, 0, 0, 
    0, 30, 0, 0, 17, 20, 5, 3, 0, 29, 16, 0, 8, 0, 3, 
    15, 23, 0, 0, 26, 10, 6, 4, 0, 68, 3, 0, 11, 0, 2, 
    23, 11, 0, 0, 12, 30, 11, 0, 0, 55, 0, 4, 10, 17, 2, 
    32, 20, 6, 0, 6, 45, 0, 0, 0, 32, 0, 0, 17, 8, 0, 
    29, 40, 4, 17, 8, 0, 0, 11, 11, 0, 16, 0, 6, 0, 0, 
    24, 36, 0, 39, 14, 9, 18, 18, 21, 0, 0, 0, 12, 0, 0, 
    43, 35, 0, 88, 13, 40, 45, 17, 0, 0, 27, 34, 31, 11, 0, 
    54, 35, 18, 69, 0, 7, 31, 33, 26, 30, 34, 40, 46, 47, 47, 
    42, 56, 51, 37, 0, 39, 37, 36, 36, 42, 47, 54, 47, 46, 58, 
    44, 46, 82, 0, 19, 43, 38, 42, 42, 47, 46, 47, 42, 69, 40, 
    43, 51, 44, 25, 25, 40, 35, 36, 46, 49, 45, 46, 67, 58, 31, 
    
    0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 10, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 16, 8, 23, 0, 31, 28, 3, 0, 0, 
    42, 0, 0, 0, 0, 0, 43, 17, 0, 0, 66, 45, 63, 0, 0, 
    113, 0, 0, 0, 14, 0, 40, 44, 37, 0, 90, 38, 59, 42, 0, 
    108, 5, 35, 0, 52, 36, 93, 72, 60, 0, 47, 82, 30, 62, 0, 
    89, 49, 55, 0, 0, 44, 97, 62, 96, 0, 115, 92, 18, 49, 37, 
    72, 115, 21, 56, 0, 0, 90, 74, 106, 0, 117, 71, 18, 12, 55, 
    77, 101, 40, 49, 0, 6, 139, 56, 70, 0, 79, 80, 6, 37, 19, 
    104, 66, 132, 11, 42, 19, 46, 44, 0, 41, 22, 91, 4, 0, 0, 
    74, 58, 159, 0, 100, 24, 0, 77, 48, 59, 90, 23, 0, 0, 12, 
    15, 60, 148, 0, 147, 76, 32, 113, 131, 65, 26, 29, 35, 32, 49, 
    29, 43, 78, 0, 216, 115, 58, 60, 71, 56, 61, 60, 62, 64, 79, 
    95, 18, 0, 130, 175, 66, 73, 63, 62, 57, 56, 64, 80, 72, 61, 
    106, 69, 0, 203, 90, 57, 77, 66, 60, 65, 72, 77, 78, 56, 123, 
    118, 75, 62, 84, 72, 53, 67, 68, 56, 68, 85, 58, 26, 111, 128, 
    
    0, 0, 8, 8, 6, 3, 5, 0, 4, 0, 0, 0, 0, 6, 5, 
    7, 10, 12, 7, 10, 73, 26, 0, 0, 0, 36, 6, 0, 0, 4, 
    0, 0, 4, 4, 7, 0, 0, 0, 13, 26, 21, 7, 23, 0, 0, 
    40, 37, 9, 5, 13, 0, 55, 27, 5, 0, 0, 0, 0, 1, 0, 
    38, 90, 19, 11, 128, 86, 6, 14, 0, 0, 37, 37, 15, 24, 0, 
    0, 0, 8, 0, 0, 0, 42, 26, 31, 58, 0, 0, 0, 9, 39, 
    6, 7, 0, 4, 0, 33, 0, 10, 9, 17, 0, 11, 0, 23, 29, 
    21, 7, 28, 16, 25, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    16, 4, 11, 4, 28, 0, 0, 26, 4, 0, 0, 0, 0, 3, 47, 
    0, 0, 9, 4, 17, 0, 0, 74, 12, 0, 0, 0, 27, 31, 0, 
    0, 0, 0, 70, 156, 133, 40, 0, 0, 0, 32, 65, 27, 0, 0, 
    0, 0, 15, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    2, 0, 0, 0, 0, 0, 0, 0, 0, 4, 7, 18, 0, 0, 17, 
    0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 19, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 20, 19, 4, 0, 40, 34, 0, 
    
    157, 163, 162, 165, 164, 157, 172, 183, 173, 148, 124, 124, 132, 146, 146, 
    162, 173, 168, 172, 160, 140, 169, 160, 122, 58, 46, 62, 78, 110, 139, 
    137, 106, 172, 176, 175, 142, 115, 72, 45, 7, 30, 10, 39, 58, 103, 
    77, 43, 164, 170, 162, 89, 77, 39, 21, 12, 51, 45, 27, 37, 58, 
    23, 31, 148, 96, 78, 71, 67, 47, 31, 0, 49, 57, 23, 28, 47, 
    22, 18, 142, 153, 37, 59, 69, 49, 45, 0, 62, 42, 16, 18, 23, 
    14, 42, 98, 159, 47, 50, 62, 45, 47, 0, 50, 40, 16, 14, 38, 
    28, 10, 44, 98, 55, 38, 46, 39, 41, 30, 47, 45, 9, 34, 65, 
    20, 0, 43, 14, 85, 34, 54, 48, 13, 84, 66, 38, 15, 45, 121, 
    16, 5, 36, 0, 53, 32, 8, 40, 45, 52, 29, 6, 9, 98, 138, 
    0, 21, 35, 0, 23, 26, 0, 0, 6, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 6, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    
    34, 35, 37, 32, 30, 39, 38, 36, 29, 23, 26, 38, 36, 30, 24, 
    35, 44, 42, 31, 40, 32, 15, 29, 14, 29, 0, 9, 32, 43, 28, 
    6, 57, 40, 33, 39, 26, 0, 6, 33, 46, 0, 0, 0, 37, 44, 
    0, 76, 33, 41, 15, 36, 4, 0, 0, 72, 0, 9, 0, 0, 74, 
    0, 38, 2, 86, 9, 11, 0, 0, 0, 89, 0, 0, 6, 0, 43, 
    0, 10, 0, 26, 62, 19, 0, 0, 0, 142, 0, 0, 20, 0, 0, 
    0, 0, 32, 0, 63, 54, 0, 0, 0, 102, 0, 0, 10, 21, 0, 
    0, 0, 0, 0, 56, 66, 0, 0, 0, 66, 0, 0, 29, 15, 8, 
    0, 2, 0, 33, 4, 17, 0, 0, 36, 0, 37, 0, 30, 33, 35, 
    0, 0, 0, 44, 0, 15, 39, 0, 2, 5, 0, 12, 48, 52, 20, 
    42, 4, 0, 120, 0, 0, 34, 0, 0, 0, 8, 9, 1, 0, 0, 
    32, 20, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 33, 67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 
    
    43, 48, 45, 44, 47, 41, 48, 58, 55, 42, 37, 38, 39, 42, 49, 
    44, 53, 48, 46, 45, 0, 31, 41, 59, 12, 0, 0, 14, 31, 37, 
    28, 41, 46, 53, 50, 59, 45, 35, 0, 0, 0, 0, 0, 4, 26, 
    0, 0, 35, 50, 37, 25, 0, 0, 0, 0, 0, 0, 6, 0, 17, 
    0, 0, 18, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 
    0, 0, 11, 56, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 7, 58, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 
    0, 0, 0, 0, 0, 26, 5, 0, 0, 15, 3, 24, 4, 0, 8, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 17, 10, 0, 0, 31, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    
    10, 17, 8, 8, 4, 12, 12, 11, 11, 33, 45, 35, 17, 8, 6, 
    0, 10, 10, 12, 8, 0, 5, 35, 66, 0, 0, 0, 10, 23, 10, 
    53, 51, 5, 8, 5, 55, 22, 9, 0, 0, 0, 0, 0, 14, 12, 
    0, 0, 5, 8, 8, 0, 0, 2, 0, 26, 4, 16, 6, 0, 14, 
    1, 0, 2, 14, 0, 0, 9, 0, 7, 0, 0, 0, 0, 0, 0, 
    15, 0, 6, 3, 62, 40, 0, 0, 0, 0, 20, 21, 7, 0, 0, 
    0, 0, 28, 24, 18, 0, 49, 0, 17, 0, 17, 0, 0, 0, 0, 
    0, 0, 0, 0, 2, 53, 53, 33, 14, 0, 9, 0, 5, 14, 0, 
    0, 1, 0, 0, 0, 38, 0, 0, 0, 0, 38, 48, 0, 0, 0, 
    12, 0, 4, 0, 35, 9, 0, 0, 0, 78, 54, 17, 0, 0, 24, 
    3, 0, 7, 0, 0, 0, 30, 81, 55, 0, 0, 0, 0, 5, 10, 
    53, 33, 12, 0, 86, 40, 4, 5, 3, 0, 0, 0, 0, 0, 0, 
    0, 22, 0, 24, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 24, 79, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 
    0, 0, 0, 34, 0, 3, 18, 0, 0, 0, 0, 0, 0, 0, 0, 
    
    13, 19, 10, 14, 9, 21, 8, 6, 12, 28, 34, 27, 19, 6, 2, 
    8, 11, 9, 13, 15, 54, 15, 26, 31, 52, 53, 36, 33, 26, 10, 
    38, 36, 11, 10, 8, 81, 51, 40, 32, 83, 94, 75, 43, 25, 26, 
    51, 20, 14, 18, 25, 46, 69, 47, 54, 91, 93, 66, 59, 21, 27, 
    113, 94, 21, 53, 126, 68, 100, 59, 51, 59, 103, 56, 57, 37, 1, 
    127, 158, 40, 19, 189, 126, 125, 75, 46, 91, 127, 80, 71, 60, 21, 
    122, 148, 67, 23, 90, 117, 168, 101, 78, 120, 129, 70, 59, 76, 51, 
    142, 165, 64, 57, 57, 165, 133, 106, 80, 95, 120, 76, 72, 75, 38, 
    176, 184, 102, 115, 56, 102, 89, 78, 81, 51, 101, 65, 44, 43, 14, 
    192, 179, 134, 117, 111, 51, 95, 121, 66, 90, 64, 37, 47, 39, 39, 
    199, 171, 139, 162, 158, 101, 145, 185, 121, 60, 64, 71, 90, 113, 104, 
    193, 203, 157, 201, 231, 165, 138, 133, 124, 111, 120, 128, 136, 138, 142, 
    140, 161, 177, 229, 175, 122, 117, 112, 113, 118, 132, 140, 149, 154, 163, 
    157, 133, 166, 239, 136, 128, 121, 115, 119, 130, 140, 155, 147, 163, 171, 
    151, 143, 127, 167, 116, 127, 137, 126, 124, 136, 134, 133, 154, 175, 141, 
    
    0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 28, 11, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 11, 20, 51, 0, 0, 20, 30, 0, 0, 
    63, 0, 0, 0, 0, 62, 28, 40, 0, 0, 0, 0, 7, 30, 0, 
    25, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 26, 6, 14, 0, 
    0, 0, 9, 0, 0, 0, 15, 4, 29, 0, 0, 8, 0, 0, 37, 
    47, 0, 2, 79, 3, 0, 0, 0, 6, 0, 38, 28, 0, 0, 0, 
    0, 24, 13, 13, 0, 0, 5, 0, 9, 0, 24, 8, 0, 0, 0, 
    2, 0, 7, 0, 0, 0, 61, 30, 0, 0, 0, 28, 0, 16, 0, 
    0, 0, 46, 0, 34, 50, 3, 0, 0, 54, 38, 58, 13, 0, 0, 
    0, 0, 10, 0, 18, 21, 0, 0, 46, 31, 49, 1, 0, 0, 8, 
    0, 0, 34, 0, 0, 0, 0, 25, 15, 13, 0, 0, 0, 22, 33, 
    65, 0, 0, 0, 162, 82, 63, 55, 12, 6, 0, 2, 0, 0, 0, 
    13, 54, 0, 65, 86, 0, 2, 0, 0, 0, 0, 0, 3, 0, 0, 
    2, 0, 37, 62, 6, 0, 0, 1, 0, 0, 7, 10, 0, 0, 66, 
    12, 0, 24, 54, 36, 19, 9, 0, 0, 0, 5, 0, 0, 0, 4, 
    
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 4, 31, 0, 0, 0, 0, 0, 
    0, 11, 0, 0, 0, 0, 0, 0, 5, 45, 0, 7, 0, 2, 1, 
    0, 2, 0, 0, 0, 0, 0, 0, 2, 59, 0, 0, 3, 0, 16, 
    1, 6, 0, 0, 44, 0, 0, 0, 0, 93, 0, 0, 14, 0, 0, 
    0, 0, 0, 0, 28, 15, 0, 0, 0, 82, 0, 0, 18, 19, 0, 
    4, 0, 0, 0, 12, 23, 0, 5, 0, 45, 0, 0, 29, 3, 0, 
    0, 22, 0, 17, 0, 18, 0, 0, 8, 0, 17, 0, 27, 0, 0, 
    9, 25, 0, 59, 0, 3, 16, 0, 5, 0, 0, 18, 18, 0, 0, 
    51, 13, 0, 88, 0, 0, 45, 4, 0, 2, 40, 51, 62, 44, 29, 
    112, 54, 0, 59, 0, 46, 78, 78, 68, 73, 79, 86, 88, 90, 83, 
    90, 111, 72, 8, 0, 73, 72, 74, 76, 84, 91, 91, 87, 93, 94, 
    90, 96, 138, 0, 49, 80, 69, 77, 83, 87, 97, 100, 97, 116, 94, 
    80, 103, 103, 65, 73, 95, 85, 73, 82, 82, 82, 94, 107, 83, 69, 
    
    47, 46, 51, 46, 47, 47, 49, 47, 43, 35, 28, 39, 38, 39, 36, 
    50, 50, 53, 45, 52, 85, 19, 37, 4, 33, 19, 21, 36, 45, 40, 
    26, 59, 52, 46, 56, 44, 0, 0, 26, 79, 10, 11, 4, 39, 57, 
    0, 121, 44, 54, 37, 35, 26, 8, 24, 83, 0, 18, 0, 14, 83, 
    0, 99, 10, 73, 44, 26, 0, 0, 8, 95, 11, 0, 30, 0, 57, 
    0, 56, 0, 46, 73, 0, 0, 0, 0, 191, 0, 0, 35, 4, 13, 
    0, 21, 12, 0, 97, 80, 10, 0, 0, 164, 0, 0, 30, 39, 13, 
    0, 0, 1, 0, 69, 104, 0, 8, 0, 124, 0, 0, 42, 34, 18, 
    0, 23, 0, 60, 17, 3, 0, 28, 49, 6, 34, 0, 38, 58, 68, 
    10, 24, 0, 74, 0, 25, 42, 14, 23, 10, 0, 5, 72, 86, 28, 
    81, 17, 0, 163, 0, 11, 86, 0, 0, 0, 20, 40, 45, 30, 0, 
    64, 40, 0, 152, 0, 0, 0, 0, 0, 9, 16, 16, 14, 17, 0, 
    3, 65, 72, 31, 0, 9, 5, 10, 8, 16, 20, 23, 16, 8, 23, 
    0, 16, 116, 0, 0, 17, 0, 9, 13, 16, 13, 9, 0, 38, 0, 
    0, 13, 25, 0, 0, 22, 12, 9, 24, 16, 0, 11, 49, 3, 0, 
    
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 1, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    4, 18, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 
    1, 39, 0, 0, 56, 8, 0, 0, 0, 0, 0, 0, 0, 4, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 15, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 18, 0, 0, 0, 0, 17, 0, 0, 
    0, 0, 0, 30, 48, 62, 0, 0, 0, 0, 28, 36, 1, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 
    
    47, 54, 51, 53, 53, 48, 57, 59, 54, 43, 32, 32, 37, 40, 39, 
    48, 56, 54, 57, 51, 66, 59, 57, 35, 2, 2, 6, 6, 17, 39, 
    48, 19, 54, 57, 55, 61, 30, 0, 0, 0, 4, 0, 1, 0, 23, 
    21, 0, 50, 55, 64, 18, 30, 0, 0, 0, 23, 0, 0, 0, 0, 
    0, 18, 52, 16, 68, 51, 37, 6, 0, 0, 16, 9, 0, 0, 0, 
    0, 15, 49, 56, 11, 13, 43, 8, 11, 0, 42, 0, 0, 0, 0, 
    0, 44, 7, 61, 14, 17, 46, 23, 8, 3, 19, 0, 0, 0, 0, 
    4, 25, 0, 37, 0, 34, 46, 10, 0, 19, 15, 0, 0, 2, 0, 
    21, 17, 9, 0, 28, 0, 0, 12, 0, 44, 0, 0, 0, 0, 33, 
    22, 14, 20, 0, 3, 0, 0, 31, 6, 5, 0, 0, 0, 30, 40, 
    5, 20, 21, 0, 44, 6, 17, 23, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 50, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 79, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    
    39, 34, 35, 41, 44, 32, 40, 43, 47, 50, 41, 29, 30, 41, 46, 
    40, 36, 36, 44, 33, 14, 67, 48, 46, 5, 33, 41, 25, 21, 44, 
    63, 2, 40, 41, 42, 32, 40, 36, 16, 0, 28, 12, 50, 26, 11, 
    92, 0, 46, 36, 56, 12, 39, 37, 25, 0, 35, 24, 26, 38, 0, 
    44, 5, 65, 0, 19, 39, 42, 36, 37, 0, 20, 56, 18, 43, 26, 
    36, 0, 55, 47, 0, 0, 22, 37, 67, 0, 52, 42, 7, 29, 32, 
    17, 36, 14, 70, 0, 0, 21, 28, 57, 0, 43, 40, 13, 0, 37, 
    11, 6, 41, 52, 2, 0, 53, 11, 24, 0, 17, 44, 0, 17, 13, 
    13, 0, 63, 0, 52, 0, 14, 27, 0, 63, 5, 43, 0, 0, 26, 
    0, 0, 57, 0, 42, 20, 0, 29, 44, 15, 47, 15, 0, 16, 47, 
    0, 0, 56, 0, 41, 50, 0, 5, 39, 43, 15, 8, 8, 17, 33, 
    0, 0, 0, 0, 82, 5, 0, 0, 0, 7, 3, 0, 0, 0, 3, 
    20, 0, 0, 34, 46, 0, 6, 2, 5, 1, 0, 0, 2, 0, 0, 
    9, 0, 0, 34, 13, 0, 9, 6, 0, 0, 1, 0, 0, 0, 21, 
    19, 0, 0, 4, 20, 0, 0, 0, 0, 0, 12, 0, 0, 18, 26, 
    

    others => 0);
end gold_package_package;
