with Ada.Text_IO, Ada.Integer_Text_IO;

procedure Guess is
   primero, segundo : Integer;
begin
   Ada.Text_IO.Put ("Ingresa dos números: ");
   Ada.Integer_Text_IO.Get (primero);
   Ada.Integer_Text_IO.Get (segundo);
   Ada.Text_IO.Put ("La suma es:");
   Ada.Integer_Text_IO.Put (primero + segundo);
   Ada.Text_IO.New_Line;
end Guess;