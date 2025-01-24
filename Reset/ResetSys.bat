@echo off
set /a BarCount=1
set load=
cls

:Reset1
cd ..
cd Checking
del LanguageSelection-Data.txt
echo. > LanguageSelection-Data.txt
Goto Loading1

:Loading1
set load=%load%/
cls
echo Loading... Please Wait...
echo ---------------------------------
echo %load%
echo ---------------------------------
if %BarCount%==10 goto Reset2
set /a BarCount=%BarCount% +1
ping localhost -n 1 >nul
goto Loading1


:Reset2
cd ..
cd SystemBatch
del Log_Data.txt
echo. > Log_Data.txt
Goto Loading2


:Loading2
set load=%load%/
cls
echo Loading... Please Wait...
echo ---------------------------------
echo %load%
echo ---------------------------------
if %BarCount%==20 goto Reset3
set /a BarCount=%BarCount% +1
ping localhost -n 1 >nul
goto Loading2

:Reset3
del SignIn_Data.txt
echo. > SignIn_Data.txt
Goto Loading3


:Loading3
set load=%load%/
cls
echo Loading... Please Wait...
echo ---------------------------------
echo %load%
echo ---------------------------------
if %BarCount%==30 goto LoadBatch
set /a BarCount=%BarCount% +1
ping localhost -n 1 >nul
goto Loading3


:LoadBatch
Echo.
Echo Done, Restarting...
timeout /t 5 /nobreak 
cd ..
cd Checking
Call "CheckBatchSys.bat"

