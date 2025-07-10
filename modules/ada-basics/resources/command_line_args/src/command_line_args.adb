with Ada.Text_IO;
with Ada.Command_Line;

procedure Command_Line_Args is
   use Ada.Text_IO;
   use Ada.Command_Line;
begin
   for next in 1 .. Argument_Count loop
      Put_Line(Argument(next));
   end loop;
end Command_Line_Args;
