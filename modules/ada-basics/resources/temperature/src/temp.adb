with Ada.Text_IO;
with Ada.Float_Text_IO;

procedure Temp is
   use Ada.Text_IO;
   use Ada.Float_Text_IO;

   fahrenheit, celcius : Float;
   lower, upper, step : Float;
begin
   lower := 0.0;
   upper := 300.0;
   step := 20.0;

   Put_Line("   F°" & ASCII.HT & "C°");
   fahrenheit := lower;
   
   while (fahrenheit <= upper) loop
      celcius := 5.0 * (fahrenheit - 32.0) / 9.0;
         
      Put(Item => fahrenheit, Fore => 5, Aft => 1, Exp => 0);
      
      Put(Item => celcius, Fore => 5, Aft => 1, Exp => 0);

      New_Line;

      fahrenheit := fahrenheit + step;
   end loop;
end Temp;
