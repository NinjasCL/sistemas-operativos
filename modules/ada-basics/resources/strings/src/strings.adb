with Ada.Text_IO;
with Ada.Wide_Text_IO;
with Ada.Wide_Wide_Text_IO;

procedure Strings is
   ñandú : constant String := "ñandú";
   π : constant := 3.14;
   hello : constant Wide_String := "Привіт";
   fire : constant Wide_Wide_String := "🔥";
   -- Not allowed: 🚂 := constant Wide_Wide_String := "🚂";
begin
   
   Ada.Text_IO.Put_Line(ñandú);
   Ada.Text_IO.Put_Line(π'Image);
   Ada.Wide_Text_IO.Put_Line (hello);
   Ada.Wide_Wide_Text_IO.Put_Line (fire);

end Strings;
