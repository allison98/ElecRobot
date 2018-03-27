@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
<<<<<<< HEAD
cd "\Users\SHININA\Documents\GitHub\ElecRobot\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\SHININA\Documents\GitHub\ElecRobot\reciever_so_far.c"
=======
cd "\Users\Bruno\Documents\GitHub\ElecRobot\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\Bruno\Documents\GitHub\ElecRobot\reciever_so_far.c"
>>>>>>> 3c574dd647f819c6ffa83734a09d1e02fb3c38ff
if not exist hex2mif.exe goto done
if exist reciever_so_far.ihx hex2mif reciever_so_far.ihx
if exist reciever_so_far.hex hex2mif reciever_so_far.hex
:done
echo done
<<<<<<< HEAD
echo Crosside_Action Set_Hex_File C:\Users\SHININA\Documents\GitHub\ElecRobot\reciever_so_far.hex
=======
echo Crosside_Action Set_Hex_File C:\Users\Bruno\Documents\GitHub\ElecRobot\reciever_so_far.hex
>>>>>>> 3c574dd647f819c6ffa83734a09d1e02fb3c38ff
