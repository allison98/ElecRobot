@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\SHININA\Documents\GitHub\ElecRobot\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\SHININA\Documents\GitHub\ElecRobot\sensor.c"
if not exist hex2mif.exe goto done
if exist sensor.ihx hex2mif sensor.ihx
if exist sensor.hex hex2mif sensor.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\SHININA\Documents\GitHub\ElecRobot\sensor.hex
