@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\Binte\Documents\GitHub\ElecRobot\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\Binte\Documents\GitHub\ElecRobot\reciever_so_far.c"
if not exist hex2mif.exe goto done
if exist reciever_so_far.ihx hex2mif reciever_so_far.ihx
if exist reciever_so_far.hex hex2mif reciever_so_far.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\Binte\Documents\GitHub\ElecRobot\reciever_so_far.hex
