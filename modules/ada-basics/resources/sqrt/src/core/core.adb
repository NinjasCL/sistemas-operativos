with Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;

package body Core is 
   procedure Raiz(numero : Float) is 
      use Ada.Text_IO;
      use Ada.Numerics.Elementary_Functions;
   begin
      Put_Line(Sqrt(numero)'Image);
   end Raiz;
end Core;