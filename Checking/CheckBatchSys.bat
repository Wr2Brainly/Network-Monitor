Title Checking Batch and System ...
@echo off
color 0a
set /a loadnum=0
cls
cd ..
set folder_path=Checking


set file_to_check=CheckOSVersion.bat
if exist "%folder_path%\%file_to_check%" (
    set /a loadnum=%loadnum% +1
) else (
    set /a loadnum=%loadnum%
)


set file_to_check=LanguageSelection.bat
if exist "%folder_path%\%file_to_check%" (
    set /a loadnum=%loadnum% +1
) else (
    set /a loadnum=%loadnum%
)

set file_to_check=LanguageSelection-Data.txt
if exist "%folder_path%\%file_to_check%" (
    set /a loadnum=%loadnum% +1
) else (
    set /a loadnum=%loadnum%
)


set folder_path=SystemBatch
set file_to_check=MeetTheCreator-Data.txt
if exist "%folder_path%\%file_to_check%" (
    set /a loadnum=%loadnum% +1
) else (
    set /a loadnum=%loadnum%
)

set file_to_check=KenalanDenganPembuat-Data.txt
if exist "%folder_path%\%file_to_check%" (
    set /a loadnum=%loadnum% +1
) else (
    set /a loadnum=%loadnum%
)

set file_to_check=Log_Data.txt
if exist "%folder_path%\%file_to_check%" (
    set /a loadnum=%loadnum% +1
) else (
    set /a loadnum=%loadnum%
)

set file_to_check=SettingsSys_Eng.bat
if exist "%folder_path%\%file_to_check%" (
    set /a loadnum=%loadnum% +1
) else (
    set /a loadnum=%loadnum%
)

set file_to_check=SettingsSys_Ind.bat
if exist "%folder_path%\%file_to_check%" (
    set /a loadnum=%loadnum% +1
) else (
    set /a loadnum=%loadnum%
)

set file_to_check=SignIn_Data.txt
if exist "%folder_path%\%file_to_check%" (
    set /a loadnum=%loadnum% +1
) else (
    set /a loadnum=%loadnum%
)

set file_to_check=System-Eng.bat
if exist "%folder_path%\%file_to_check%" (
    set /a loadnum=%loadnum% +1
) else (
    set /a loadnum=%loadnum%
)

set file_to_check=System-Ind.bat
if exist "%folder_path%\%file_to_check%" (
    set /a loadnum=%loadnum% +1
) else (
    set /a loadnum=%loadnum%
)


echo Check Batch File (System)
echo [=====================================================]
echo  %loadnum% out of 11 files found.
set /a DisplayValue=100*loadnum/11
echo  Percentage of Data Found :  %DisplayValue% Percent.
echo [=====================================================]
if "%loadnum%"=="11" (
    goto SuceesScanning
) else (
    echo Sorry, System are corrupted!
    goto PauseEX
)


:PauseEX
timeout /t 30
Exit /b


:SuceesScanning
timeout /t 10
cd Checking
Call CheckOSVersion.bat