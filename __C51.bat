@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\Binte\Documents\GitHub\ElecRobot\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\Binte\Documents\GitHub\ElecRobot\can we make this better.c"
if not exist hex2mif.exe goto done
if exist can we make this better.ihx hex2mif can we make this better.ihx
if exist can we make this better.hex hex2mif can we make this better.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\Binte\Documents\GitHub\ElecRobot\can we make this better.hex
