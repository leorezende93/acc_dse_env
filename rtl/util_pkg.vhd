library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
use std.textio.all;

package util_package is

  type type_array_int is array(0 to 4000000) of integer;
  impure function read_data(file_name : in string) return type_array_int;

end package util_package;


package body util_package is

  --https://nandland.com/file-input-output/
  -- https://www.fpga4student.com/2018/08/how-to-read-image-in-vhdl.html
  impure function read_data(file_name : in string) return type_array_int is
      file file_ptr : text open read_mode is file_name;
      variable line_ptr : line;
      variable tmp_int : integer := 0;
      variable i : integer := 0;
      variable tmp_arr : type_array_int := (others=>0);
  begin
      while not endfile(file_ptr) loop
      --for i in type_array_int'range loop
          readline(file_ptr, line_ptr);
          read(line_ptr, tmp_int);
          tmp_arr(i) := tmp_int;
          --report integer'image(i) & " " &  integer'image(tmp_int) & " " & integer'image(tmp_arr(i)) & " " & file_name;
          i := i + 1;
      end loop;
      return tmp_arr;
  end function;

end package body util_package;