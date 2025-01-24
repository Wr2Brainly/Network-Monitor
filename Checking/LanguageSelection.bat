echo off
cls
color 0a
set language_file=LanguageSelection-Data.txt
set LOG_FILE=Log_Data.txt
set SIGN_FILE=SignIn_Data.txt
if not exist "%language_file%" goto SelectLanguage

for /f "delims=" %%L in (%language_file%) do set user_language=%%L
if /i "%user_language%"=="English " goto LaunchEnglishSystem
if /i "%user_language%"=="Indonesia " goto LaunchIndonesianSystem

goto SelectLanguage

:SelectLanguage
cls
echo [===================================]
echo   Select your system language.
echo   Once selected, you
echo   cannot change the language again.
echo [===================================]
echo   1) English
echo   2) Bahasa Indonesia
echo [===================================]
set /p lang_choice=Enter your choice (1/2): 


if "%lang_choice%"=="1" (
    echo English > %language_file%
    cd ..
    cd SystemBatch
    echo Sign In, [%COMPUTERNAME%] [Username : %username%] [%date% %time%] >> %SIGN_FILE%
    echo  ====================================================================================  >> %SIGN_FILE%
    type SignIn_Data.txt > Log_Data.txt
    goto LaunchEnglishSystem
) else if "%lang_choice%"=="2" (
    echo Indonesia > %language_file%
    cd ..
    cd SystemBatch
    echo Sign In, [%COMPUTERNAME%] [Username : %username%] [%date% %time%] >> %SIGN_FILE%
    echo  =====================================================================================  >> %SIGN_FILE%
    type SignIn_Data.txt > Log_Data.txt
    goto LaunchIndonesianSystem
) else (
    echo [========================================]
    echo  Invalid selection. Please try again.
    echo  ErrCode : S31ECL4NGU4GE
    echo [========================================]
    Set lang_choice=0
    timeout /t 8 /nobreak
    goto SelectLanguage
)


:LaunchEnglishSystem
cls
cd ..
cd SystemBatch
echo Login -- [%COMPUTERNAME%] [Username : %username%] [%date% %time%] >> %LOG_FILE%
call System-Eng.bat


:LaunchIndonesianSystem
cls
cd ..
cd SystemBatch
echo Login -- [%COMPUTERNAME%] [Username : %username%] [%date% %time%] >> %LOG_FILE%
call System-Ind.bat

