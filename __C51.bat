@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\Dalto\Documents\GitHub\ElecRobot\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon.c"
if not exist hex2mif.exe goto done
if exist idkwhatsgoingon.ihx hex2mif idkwhatsgoingon.ihx
if exist idkwhatsgoingon.hex hex2mif idkwhatsgoingon.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon.hex
