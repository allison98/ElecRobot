@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\Bruno\Documents\GitHub\ElecRobot\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\Bruno\Documents\GitHub\ElecRobot\reciever new (2).c"
if not exist hex2mif.exe goto done
if exist reciever new (2).ihx hex2mif reciever new (2).ihx
if exist reciever new (2).hex hex2mif reciever new (2).hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\Bruno\Documents\GitHub\ElecRobot\reciever new (2).hex
