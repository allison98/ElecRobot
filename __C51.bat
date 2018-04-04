@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\allisony\Documents\ElecRobot\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\allisony\Documents\ElecRobot\idkwhatsgoingon_new.c"
if not exist hex2mif.exe goto done
if exist idkwhatsgoingon_new.ihx hex2mif idkwhatsgoingon_new.ihx
if exist idkwhatsgoingon_new.hex hex2mif idkwhatsgoingon_new.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\allisony\Documents\ElecRobot\idkwhatsgoingon_new.hex
