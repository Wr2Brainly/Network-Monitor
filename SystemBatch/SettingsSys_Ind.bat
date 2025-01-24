Echo off
Cls
color 0a
Title Asnet -- Your Assistant Computer Network
Goto MenuPengaturan

:MenuPengaturan
Cls
Echo ===========================================
Echo Pengaturan -- Asnet
Echo ===========================================
Echo 1) Lihat Semua Histori Log
Echo 2) Hapus semua Histori Log
Echo 3) Reset Semua
Echo 4) Tentang Batch dan Pembuatnya
Echo 5) Menu Utama
Echo ===========================================
set /p AnsSettings=Menu : 
If %AnsSettings% == 1 goto LihatHistoriLog
If %AnsSettings% == 2 goto HapusHistoriLog
If %AnsSettings% == 3 goto KonfirmasiReset
If %AnsSettings% == 4 goto DariPembuatBatch
If %AnsSettings% == 5 goto KeMenuUtama
Goto MenuPengaturan


:KeMenuUtama
cd ..
cd Checking
Call LanguageSelection.bat


:LihatHistoriLog
cls
set "LogHistory_File=Log_Data.txt"
if exist "%LogHistory_File%" (
    Echo Data Log Aplikasi
    Echo [=======================================================================================]
    type "%LogHistory_File%"
    Echo [=======================================================================================]
) else (
    echo File "%LogHistory_File%" tidak ditemukan.
)
pause
goto MenuPengaturan


:HapusHistoriLog
cls
set "LogHistory_File=Log_Data.txt"
if exist "%LogHistory_File%" (
    Goto KonfirmasiHapusLog
) else (
    echo Mohon maaf, File "%LogHistory_File%" tidak ditemukan.
    Pause
    Goto MenuPengaturan
)


:KonfirmasiHapusLog
Echo =============================================
Echo (Warning) Yakin ingin menghapus?
Echo =============================================
Echo Semua Data Histori Log (Riwayat Perintah
Echo dan aplikasi akan terhapus, Termasuk File
Echo .txt yang ada di sistem. (Saat Anda masuk/
Echo Memberi perintah, Maka File Log akan dibuat
Echo ulang secara otomatis.
Echo =============================================
set /p KonfirmasiHapusLog=Y/N? 
if %KonfirmasiHapusLog% == y goto HapusLog
if %KonfirmasiHapusLog% == Y goto HapusLog
if %KonfirmasiHapusLog% == n goto MenuPengaturan
if %KonfirmasiHapusLog% == N goto MenuPengaturan
Goto MenuPengaturan


:HapusLog
cls
del Log_Data.txt
echo. Log_Data.txt
type SignIn_Data.txt > Log_Data.txt
cls
Echo =========================================
Echo Data Log berserta Filenya telah dihapus.
Echo Klik tombol apapun untuk mengonfirmasi.
Echo =========================================
pause
Goto MenuPengaturan


:DariPembuatBatch
Cls
set "File_Pembuat_Patch=KenalanDenganPembuat-Data.txt"

if exist "%File_Pembuat_Patch%" (
    type "%File_Pembuat_Patch%"
) else (
    echo File "%File_Pembuat_Patch%" Tidak ditemukan!.
)

pause
goto MenuPengaturan


:KonfirmasiReset
Cls
Echo  Reset Semua Data (Peringatan KERAS!)
Echo [====================================================================]
Echo Semua data yang pernah tersimpan (Data Log, Sign In, dan Bahasa)
Echo Akan terhapus secara otomatis dan sistem akan menganggap bahwa
Echo anda baru pertama kali menggunakan Batch ini.
Echo.
Echo Semua Data yang telah dihapus benar-benar tidak dapat dikembalikan
Echo ulang. Setelah direset, Sistem akan merestart batch kembali ke
Echo Menu persiapan.
Echo [====================================================================]
Echo Anda Menyetujuinya, untuk reset? (Jika Iya, Sistem Akan langsung
Echo mereset semuanya.
set /p ConfirmResetAll=Reset Sekarang? (Y/N) : 
if %ConfirmResetAll% == y goto CallingResetSys
if %ConfirmResetAll% == Y goto CallingResetSys
if %ConfirmResetAll% == n goto MenuPengaturan
if %ConfirmResetAll% == N goto MenuPengaturan
Goto MenuPengaturan

:CallingResetSys
cd ..
cd Reset
Call ResetSys.bat