@echo off
color 0a

cls
Echo Checking your operating system version data ... (Eng)
Echo Mengecek Data Versi Operasi Sistem anda ... (Ina)
Echo ==================================================

ver | findstr /i "5.0" >nul
if %errorlevel% equ 0 (
    cls
    echo Windows 2000 detected.
    echo [===================================================]
    echo Sorry, this Batch system has exited because most of the 
    echo commands are not suitable for this system operation!
    echo [===================================================]
    pause
    Exit
)

ver | findstr /i "5.1" >nul
if %errorlevel% equ 0 (
    cls
    echo Windows XP detected.
    echo [===================================================]
    echo Sorry, this Batch system has exited because most of the 
    echo commands are not suitable for this system operation!
    echo [===================================================]
    pause
    Exit
)

ver | findstr /i "6.0" >nul
if %errorlevel% equ 0 (
    cls
    echo Windows Vista detected.
    echo [===================================================]
    echo Sorry, this Batch system has exited because most of the 
    echo commands are not suitable for this system operation!
    echo [===================================================]
    pause
    Exit
)

ver | findstr /i "6.1" >nul
if %errorlevel% equ 0 (
    echo Windows 7 detected.
    call LanguageSelection.bat
)

ver | findstr /i "6.2" >nul
if %errorlevel% equ 0 (
    echo Windows 8 detected.
    call LanguageSelection.bat
)

ver | findstr /i "6.3" >nul
if %errorlevel% equ 0 (
    echo Windows 8.1 detected.
    call LanguageSelection.bat
)

ver | findstr /i "10" >nul
if %errorlevel% equ 0 (
    echo Windows 10/11 detected.
    call LanguageSelection.bat
)




