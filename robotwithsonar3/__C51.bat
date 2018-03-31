@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c"
if not exist hex2mif.exe goto done
if exist Sam_Test.ihx hex2mif Sam_Test.ihx
if exist Sam_Test.hex hex2mif Sam_Test.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.hex
