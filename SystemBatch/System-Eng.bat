Echo Off
Color 0a
Title Asnet - Beta Public
set LOG_FILE=Log_Data.txt
setlocal enabledelayedexpansion
Cls
Goto MenuUtamaAdmin


:MenuUtamaAdmin
Cls
Echo [92m[====================================================================================]
Echo [92m       / \        /---      /  \          /    / -----    ----------[0m
Echo [32m      /   \      /         /    \        /     \               \[0m
Echo [96m     /     \     \        /      \      /      /               /[0m
Echo [36m    /-------\     \      /        \    /       \ -----         \[0m
Echo [94m   /         \     \    /          \  /        /               /[0m
Echo [34m  /           \ ---/   /            \/         \ -----         \[0m   [32m Beta Public[0m
Echo [92m[====================================================================================]
Echo   [92mWelcome,[0m [97m[%username%][0m [92mfrom komputer[0m [97m[%COMPUTERNAME%]![0m
Echo   [92mHow can we assist you? Please enter the number corresponding to the command :D
Echo [92m[====================================================================================]
Echo   [92m1) Check users connected to your Hotspot[0m
Echo   [92m2) Check Wi-Fi signal strength[0m
Echo   [92m3) View all Wi-Fi information[0m
Echo   [92m4) Check Internet latency[0m
Echo   [92m5) Scan/Detect available Wi-Fi[0m
Echo   [92m6) Trace network route and packet loss[0m
Echo   [92m7) Settings[0m
Echo [92m[====================================================================================]

set /p Ans1= Menu : 
echo   [Command: %Ans1%] [%date% %time%] >> %LOG_FILE%
If %Ans1% == 1 goto CheckUserHotspot
If %Ans1% == 2 goto CekSinyalWifi
If %Ans1% == 3 goto CekSemuaDataWifi
If %Ans1% == 4 goto MenuCekLatensiInternet
If %Ans1% == 5 goto ScanWifiYangTerdeteksi
If %Ans1% == 6 goto CekJalurJaringan
If %Ans1% == 7 goto Settings
Goto InpMenuErr


:InpMenuErr
Cls
echo     Error Message Send! [1NPUS3RM3NU] [%date% %time%] >> %LOG_FILE%
Echo [===========================]
Echo  ERROR!
Echo  ErrCode : 1NPUS3RM3NU
Echo [===========================]
timeout /t 10 /nobreak
Set Ans1=0
Goto MenuUtamaAdmin



:CheckUserHotspot
Cls
Echo List of IP addresses and Hotspot users
Echo ======================================================
echo IP Address        Physical Address     Type
arp -a > HotspotIPTemp.txt
for /f "tokens=1,2,3 delims= " %%A in (HotspotIPTemp.txt) do (
    echo %%A | findstr "192.168.137." >nul
    if not errorlevel 1 (
        if not %%A==192.168.137.255 (
            set IP=%%A
            set MAC=%%B
            set TYPE=%%C

            :: Format output dengan spasi tetap menggunakan delayed expansion
            echo !IP!    !MAC!    !TYPE!
        )
    )
)
del HotspotIPTemp.txt

Echo ======================================================
Echo Done!
Echo Press [A] to go to the menu or wait 
Echo for 10 seconds for the process
Echo to be rechecked and the list updated.
choice /c AX /t 10 /d X >nul

rem Check result
if errorlevel 2 (
    goto CheckUserHotspot
) else (
    goto MenuUtamaAdmin
)



:CekSinyalWifi
Cls
Echo ====================================
netsh wlan show interfaces | findstr "Signal"
Echo ====================================
Echo Done!
Echo Press [A] to go to the menu or wait 1 second for the process
Echo to be repeated.
choice /c AX /t 1 /d X >nul

rem Check result
if errorlevel 2 (
    goto CekSinyalWifi
) else (
    goto MenuUtamaAdmin
)


:CekSemuaDataWifi
Cls
Echo Wi-Fi Device Information
Echo ==========================================
netsh wlan show interfaces
Echo ==========================================
Echo Press any key to go to the Main Menu
Pause
Goto MenuUtamaAdmin


:CekLatensiInternet4Kali
Cls
Echo Internet Latency Results (4 times, 1 kilobyte each)
Echo ================================================
ping 8.8.8.8 -n 4 -l 1024
Echo ================================================
Echo Done!
Pause
Goto MenuCekLatensiInternet


:CekLatensiInternet10Kali
Cls
Echo Internet Latency Results (10 times, 1 kilobyte each)
Echo ================================================
ping 8.8.8.8 -n 10 -l 1024
Echo ================================================
Echo Done!
Pause
Goto MenuCekLatensiInternet


:CekLatensiInternet25Kali
Cls
Echo Internet Latency Results (25 times, 1 kilobyte each)
Echo ================================================
ping 8.8.8.8 -n 25 -l 1024
Echo ================================================
Echo Done!
Pause
Goto MenuCekLatensiInternet


:CekLatensiInternet100Kali
Cls
Echo Internet Latency Results (100 times, 1 kilobyte each)
Echo ================================================
ping 8.8.8.8 -n 100 -l 1024
Echo ================================================
Echo Done!
Pause
Goto MenuCekLatensiInternet



:MenuCekLatensiInternet
Cls
Echo Choose how many times you want to check Internet Latency
Echo ==================================================
Echo 1) 4 Times, Fast but Not Accurate
Echo 2) 10 Times, Quick and Less Accurate
Echo 3) 25 Times, Normal and Accurate
Echo 4) 100 Times, Long but Very Accurate
Echo 5) Return to Main Menu
Echo ==================================================
set /p MenuLatensiInp=
If %MenuLatensiInp% == 1 goto CekLatensiInternet4Kali
If %MenuLatensiInp% == 2 goto CekLatensiInternet10Kali
If %MenuLatensiInp% == 3 goto CekLatensiInternet25Kali
If %MenuLatensiInp% == 4 goto CekLatensiInternet100Kali
If %MenuLatensiInp% == 5 goto MenuUtamaAdmin
Goto MenuCekLatensiInternet


:ScanWifiYangTerdeteksi
Cls
Echo Detected Wi-Fi List
Echo =======================================================
netsh wlan show networks mode=bssid | findstr /C:"SSID "  /C:"Signal"
Echo =======================================================
Echo Done!
Pause
Goto MenuUtamaAdmin



:CekJalurJaringan
Cls
Set JalurJaringan=
Echo List of IP Addresses and Host Names Available
Echo ==============================================
Echo 8.8.8.8 [google]
Echo 1.1.1.1 [one.one.one.one]
arp -a > HotspotIPTemp.txt
for /f "tokens=1,2,3 delims= " %%A in (HotspotIPTemp.txt) do (
    echo  %%A | findstr "192.168." >nul
    if not errorlevel 1 (
        if not %%A==192.168.137.255 (
            set IP=%%A
            set MAC=%%B
            set TYPE=%%C
        if not %%A==192.168.0.255 (
            set IP=%%A
            set MAC=%%B
            set TYPE=%%C
        if not %%A==192.168.1.255 (
            set IP=%%A
            set MAC=%%B
            set TYPE=%%C

            echo !IP!    !MAC!    !TYPE!
        )
    )
)
)
)
del HotspotIPTemp.txt

Echo ==============================================
Echo Please select and enter the IP Address to check.
Echo Type "Quit" to leave the check menu.
Echo ==============================================
set /p JalurJaringan=Target Destination: 
If %JalurJaringan% == Quit goto MenuUtamaAdmin
If %JalurJaringan% == quit goto MenuUtamaAdmin
Cls
Echo Check Network Route and Packet Loss
Echo Target IP: %JalurJaringan%
Echo ===========================================
pathping %JalurJaringan%
Echo ===========================================
Echo Done!
Pause
Goto MenuUtamaAdmin


:Settings
Cls
Call SettingsSys_Eng.bat
