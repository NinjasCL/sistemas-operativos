with Ada.Text_IO;
with GNAT.OS_Lib;  

procedure Process is
   use GNAT.OS_Lib;

   Result    : Integer;
   Arguments : Argument_List :=
                 (  1=> new String'("-al")
                 );
   
begin

   Spawn
   (  Program_Name           => "/bin/ls",
      Args                   => Arguments,
      Output_File_Descriptor => Standout,
      Return_Code            => Result
   );

   for Index in Arguments'Range loop
      Free (Arguments (Index)); 
   end loop;

end Process;
