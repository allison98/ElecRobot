@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
<<<<<<< HEAD
cd "\Users\Binte\Documents\GitHub\ElecRobot\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\Binte\Documents\GitHub\ElecRobot\Sam_Test.c"
if not exist hex2mif.exe goto done
if exist Sam_Test.ihx hex2mif Sam_Test.ihx
if exist Sam_Test.hex hex2mif Sam_Test.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\Binte\Documents\GitHub\ElecRobot\Sam_Test.hex
=======
cd "\Users\SHININA\Documents\GitHub\ElecRobot\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\SHININA\Documents\GitHub\ElecRobot\sensor.c"
if not exist hex2mif.exe goto done
if exist sensor.ihx hex2mif sensor.ihx
if exist sensor.hex hex2mif sensor.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\SHININA\Documents\GitHub\ElecRobot\sensor.hex
>>>>>>> 5af2065a1ae13c1ba34f8726f346e97b1aac2136
