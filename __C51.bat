@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
<<<<<<< HEAD
cd "\Users\Binte\Documents\GitHub\ElecRobot\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\Binte\Documents\GitHub\ElecRobot\reciever_so_far.c"
=======
cd "\Users\SHININA\Documents\GitHub\ElecRobot\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\SHININA\Documents\GitHub\ElecRobot\sensor.c"
>>>>>>> ec206e392d1433cc28de83b8d6cef4518d152379
if not exist hex2mif.exe goto done
if exist sensor.ihx hex2mif sensor.ihx
if exist sensor.hex hex2mif sensor.hex
:done
echo done
<<<<<<< HEAD
echo Crosside_Action Set_Hex_File C:\Users\Binte\Documents\GitHub\ElecRobot\reciever_so_far.hex
=======
echo Crosside_Action Set_Hex_File C:\Users\SHININA\Documents\GitHub\ElecRobot\sensor.hex
>>>>>>> ec206e392d1433cc28de83b8d6cef4518d152379
