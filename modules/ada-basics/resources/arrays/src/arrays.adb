with Ada.Text_IO;

procedure Arrays is
   type Numeros is array(1..5) of Integer;
   mis_numeros : Numeros;
begin
   mis_numeros(1) := 10;
   mis_numeros(2) := 20;
   mis_numeros(3) := 30;
   mis_numeros(4) := 40;
   mis_numeros(5) := 50;

   for i in 1..5 loop
      Ada.Text_IO.Put_Line(mis_numeros(i)'Image);
   end loop;
end Arrays;