@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\allisony\Documents\ElecRobot\Freq_Gen(Original)23\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\allisony\Documents\ElecRobot\Freq_Gen(Original)23\Freq_Gen.c"
if not exist hex2mif.exe goto done
if exist Freq_Gen.ihx hex2mif Freq_Gen.ihx
if exist Freq_Gen.hex hex2mif Freq_Gen.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\allisony\Documents\ElecRobot\Freq_Gen(Original)23\Freq_Gen.hex
