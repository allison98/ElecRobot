@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\allisony\Documents\ElecRobot\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout ht (c) 2010-2018 Jesus Calvino-Fraga "C:\Users\allisony\Documents\ElecRobot\robotControl.c"
if not exist hex2mif.exe goto done
if exist robotControl.ihx hex2mif robotControl.ihx
if exist robotControl.hex hex2mif robotControl.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\allisony\Documents\ElecRobot\robotControl.hex
