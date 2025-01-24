Echo off
Cls
color 0a
Title Asnet -- Your Assistant Computer Network
Goto SettingsMenu

:SettingsMenu
Cls
Echo ===========================================
Echo Settings -- Asnet
Echo ===========================================
Echo 1) View All Log History
Echo 2) Delete All Log History
Echo 3) Reset Everything
Echo 4) About the Batch and its Creator
Echo 5) Main Menu
Echo ===========================================
set /p AnsSettings=Menu : 
If %AnsSettings% == 1 goto ViewLogHistory
If %AnsSettings% == 2 goto DeleteLogHistory
If %AnsSettings% == 3 goto ConfirmReset
If %AnsSettings% == 4 goto AboutBatchCreator
If %AnsSettings% == 5 goto ToMainMenu
Goto SettingsMenu


:ToMainMenu
cd ..
cd Checking
Call LanguageSelection.bat


:ViewLogHistory
cls
set "LogHistory_File=Log_Data.txt"
if exist "%LogHistory_File%" (
    Echo Application Log Data
    Echo [=======================================================================================]
    type "%LogHistory_File%"
    Echo [=======================================================================================]
) else (
    echo File "%LogHistory_File%" not found.
)
pause
goto SettingsMenu


:DeleteLogHistory
cls
set "LogHistory_File=Log_Data.txt"
if exist "%LogHistory_File%" (
    Goto ConfirmDeleteLog
) else (
    echo Sorry, file "%LogHistory_File%" not found.
    Pause
    Goto SettingsMenu
)


:ConfirmDeleteLog
Echo =============================================
Echo (Warning) Are you sure you want to delete?
Echo =============================================
Echo All Log History Data (Command and
Echo application history will be deleted, including
Echo the .txt file in the system. (When you log in/
Echo issue a command, the log file will be
Echo automatically recreated.
Echo =============================================
set /p ConfirmDeleteLog=Y/N? 
if %ConfirmDeleteLog% == y goto DeleteLog
if %ConfirmDeleteLog% == Y goto DeleteLog
if %ConfirmDeleteLog% == n goto SettingsMenu
if %ConfirmDeleteLog% == N goto SettingsMenu
Goto SettingsMenu


:DeleteLog
cls
del Log_Data.txt
echo. Log_Data.txt
type SignIn_Data.txt > Log_Data.txt
cls
Echo =========================================
Echo Log data and its file have been deleted.
Echo Press any key to confirm.
Echo =========================================
pause
Goto SettingsMenu


:AboutBatchCreator
Cls
set "File_Batch_Creator=MeetTheCreator-Data.txt"

if exist "%File_Batch_Creator%" (
    type "%File_Batch_Creator%"
) else (
    echo File "%File_Batch_Creator%" not found!.
)

pause
goto SettingsMenu


:ConfirmReset
Cls
Echo  Reset All Data (Strong Warning!)
Echo [====================================================================]
Echo All saved data (Log Data, Sign In, and Language)
Echo will be automatically deleted, and the system will assume
Echo that this is your first time using this batch file.
Echo.
Echo All deleted data cannot be restored.
Echo After resetting, the system will restart the batch
Echo back to the preparation menu.
Echo [====================================================================]
Echo Do you agree to reset? (If yes, the system will
Echo immediately reset everything.)
set /p ConfirmResetAll=Reset Now? (Y/N) : 
if %ConfirmResetAll% == y goto CallingResetSys
if %ConfirmResetAll% == Y goto CallingResetSys
if %ConfirmResetAll% == n goto SettingsMenu
if %ConfirmResetAll% == N goto SettingsMenu
Goto SettingsMenu

:CallingResetSys
cd ..
cd Reset
Call ResetSys.bat
