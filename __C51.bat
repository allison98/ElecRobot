@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
<<<<<<< HEAD
cd "\Users\Binte\Documents\GitHub\ElecRobot\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\Binte\Documents\GitHub\ElecRobot\bitcodefinalish.c"
=======
cd "\Users\Bruno\Documents\GitHub\ElecRobot\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\Bruno\Documents\GitHub\ElecRobot\idkwhatsgoingon.c"
>>>>>>> a50e97a52563a27273f05b43787fb857f0df21ab
if not exist hex2mif.exe goto done
if exist bitcodefinalish.ihx hex2mif bitcodefinalish.ihx
if exist bitcodefinalish.hex hex2mif bitcodefinalish.hex
:done
echo done
<<<<<<< HEAD
echo Crosside_Action Set_Hex_File C:\Users\Binte\Documents\GitHub\ElecRobot\bitcodefinalish.hex
=======
echo Crosside_Action Set_Hex_File C:\Users\Bruno\Documents\GitHub\ElecRobot\idkwhatsgoingon.hex
>>>>>>> a50e97a52563a27273f05b43787fb857f0df21ab
