Echo Off
Cls
Title Asnet - Beta Public
color 0a
set LOG_FILE=Log_Data.txt
setlocal enabledelayedexpansion
Goto MenuUtamaAdmin


:MenuUtamaAdmin
Cls
Echo [92m[=================================================================================][0m
Echo [92m       / \        /---      /  \          /    / -----    ----------[0m
Echo [32m      /   \      /         /    \        /     \               \[0m
Echo [96m     /     \     \        /      \      /      /               /[0m
Echo [36m    /-------\     \      /        \    /       \ -----         \[0m
Echo [94m   /         \     \    /          \  /        /               /[0m
Echo [34m  /           \ ---/   /            \/         \ -----         \[0m   [32m Beta Public[0m
Echo [92m[=================================================================================][0m
Echo   [92mSelamat Datang,[0m [97m[%username%][0m [92mdari Komputer[0m [97m[%COMPUTERNAME%]![0m
Echo   [92mAda yang bisa dibantu? Tulis nomor sesuai perintah yang tersedia :D[0m
Echo [92m[=================================================================================][0m
Echo   [92m1) Cek Pengguna yang terhubung ke Hotspot Anda[0m
Echo   [92m2) Cek Kekuatan Sinyal Wifi[0m
Echo   [92m3) Cek semua informasi Wifi[0m
Echo   [92m4) Cek Latensi Internet[0m
Echo   [92m5) Scan/Cari Wifi yang Terdeteksi[0m
Echo   [92m6) Cek Jalur Jaringan dan Kehilangan Paket[0m
Echo   [92m7) Settings (Pengaturan)[0m
Echo [92m[=================================================================================]

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
Echo Daftar Alamat IP dan Pengguna Hotspot
Echo ======================================================
Echo Alamat IP ------- Pyshical Address --- Tipe

arp -a > HotspotIPTemp.txt
for /f "tokens=1,2,3 delims= " %%A in (HotspotIPTemp.txt) do (
    echo  %%A | findstr "192.168.137." >nul
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
Echo Selesai!
Echo Klik [A] untuk pergi ke menu dan menyelesaikan 
Echo pengecekan atau Tunggu selama 10 detik hingga proses 
Echo pengecekan dilakukan ulang dan Daftar diperbarui.
choice /c AX /t 10 /d X >nul

rem Periksa hasil
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
Echo Selesai!
Echo Klik [A] untuk pergi ke menu dan menyelesaikan 
Echo pengecekan atau Tunggu selama 1 detik hingga proses 
Echo pengecekan dilakukan ulang. 
choice /c AX /t 1 /d X >nul

rem Periksa hasil
if errorlevel 2 (
    goto CekSinyalWifi
) else (
    goto MenuUtamaAdmin
)


:CekSemuaDataWifi
Cls
Echo Data Perangkat Wifi
Echo ==========================================
netsh wlan show interfaces
Echo ==========================================
Echo Klik tombol apapun untuk pergi ke Menu Utama
Pause
Goto MenuUtamaAdmin


:CekLatensiInternet4Kali
Cls
Echo Daftar Hasil Latensi Internet (4 kali, per 1 kilobytes)
Echo ================================================
ping 8.8.8.8 -n 4 -l 1024
Echo ================================================
Echo Selesai!
Pause
Goto MenuCekLatensiInternet


:CekLatensiInternet10Kali
Cls
Echo Daftar Hasil Latensi Internet (10 kali, per 1 kilobytes)
Echo ================================================
ping 8.8.8.8 -n 10 -l 1024
Echo ================================================
Echo Selesai!
Pause
Goto MenuCekLatensiInternet


:CekLatensiInternet25Kali
Cls
Echo Daftar Hasil Latensi Internet (25 kali, per 1 kilobytes)
Echo ================================================
ping 8.8.8.8 -n 25 -l 1024
Echo ================================================
Echo Selesai!
Pause
Goto MenuCekLatensiInternet


:CekLatensiInternet100Kali
Cls
Echo Daftar Hasil Latensi Internet (100 kali, per 1 kilobytes)
Echo ================================================
ping 8.8.8.8 -n 100 -l 1024
Echo ================================================
Echo Selesai!
Pause
Goto MenuCekLatensiInternet



:MenuCekLatensiInternet
Cls
Echo Pilih berapa kali anda ingin mengecek Latensi Internet
Echo ==================================================
Echo 1) 4 Kali, Singkat tetapi Tidak Akurat
Echo 2) 10 Kali, Cepat dan Kurang Akurat
Echo 3) 25 Kali, Normal dan Akurat
Echo 4) 100 Kali, Lama tetapi Sangat Akurat
Echo 5) Kembali ke Menu Utama
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
Echo Daftar Wifi yang terdeteksi
Echo =======================================================
netsh wlan show networks mode=bssid | findstr /C:"SSID "  /C:"Signal"
Echo =======================================================
Echo Selesai!
Pause
Goto MenuUtamaAdmin



:CekJalurJaringan
Cls
Set JalurJaringan=
Echo Daftar Alamat IP dan Nama Host yang tersedia
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
Echo Mohon pilih dan tulis Alamat IP yang ingin dicek.
Echo Ketik "Keluar" jika ingin keluar dari menu cek.
Echo ==============================================
set /p JalurJaringan=Arah Tujuan : 
If %JalurJaringan% == Keluar goto MenuUtamaAdmin
If %JalurJaringan% == keluar goto MenuUtamaAdmin
Cls
Echo Cek Jalur Jaringan dan Kehilangan Paket
echo ========================================
echo   Alamat IP : [ %JalurJaringan% ]
echo ========================================
echo.
Echo ===========================================================
pathping %JalurJaringan%
Echo ===========================================================
Echo Selesai!
Pause
Goto MenuUtamaAdmin


:Settings
Cls
Call SettingsSys_Ind.bat

