@echo off
@echo ---------------------------------------------------------------------------------
@echo -------------------------------CREATE FOLDERS------------------------------------
@echo ---------------------------------------------------------------------------------
mkdir C:\TEMP
mkdir C:\!DOWNLOADS
mkdir C:\!APPS
mkdir C:\!GAMES
mkdir C:\!MYCOR
@echo .
@echo .
timeout 2 > NUL /nobreak
@echo .
@echo .
@echo ---------------------------------------------------------------------------------
@echo -------------------------------EDITING SWAP--------------------------------------
@echo ---------------------------------------------------------------------------------
wmic pagefile list /format:list
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=false
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=8000,MaximumSize=8000
@echo .
@echo .
timeout 2 > NUL /nobreak
@echo .
@echo .
@echo ---------------------------------------------------------------------------------
@echo -------------------------------DISABLE SERVICES----------------------------------
@echo ---------------------------------------------------------------------------------
sc config "ShellHWDetection" start= disabled
@echo .
@echo .
timeout 2 > NUL /nobreak
@echo .
@echo .
@echo ---------------------------------------------------------------------------------
@echo -------------------------------REMOVE WINDOWS DEFENDER---------------------------
@echo ---------------------------------------------------------------------------------
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d "Off" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t "REG_DWORD" /d "0" /f
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SpyNetReporting /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v DontReportInfectionInformation /t REG_DWORD /d 1 /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /f
@echo .
@echo .
timeout 2 > NUL /nobreak
@echo .
@echo .
@echo ---------------------------------------------------------------------------------
@echo -----------------------------INSTALLING POWER PLAN-------------------------------
@echo ---------------------------------------------------------------------------------
powercfg -import "C:\Windows\_BitsumHighestPerformance.pow" 77777777-7777-7777-7777-777777777777
powercfg -SETACTIVE "77777777-7777-7777-7777-777777777777"
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a
powercfg -attributes SUB_PROCESSOR 75b0ae3f-bce0-45a7-8c89-c9611c25e100 -ATTRIB_HIDE
powercfg -setdcvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 75b0ae3f-bce0-45a7-8c89-c9611c25e100 3000
powercfg -setacvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 75b0ae3f-bce0-45a7-8c89-c9611c25e100 3000
powercfg -change -monitor-timeout-ac 20
powercfg -change -monitor-timeout-dc 20
@echo .
@echo .
timeout 2 > NUL /nobreak
@echo .
@echo .
@echo ---------------------------------------------------------------------------------
@echo -------------------------------DISABLING HIBERNATE-------------------------------
@echo ---------------------------------------------------------------------------------
powercfg -h off
@echo .
@echo .
timeout 2 > NUL /nobreak
@echo .
@echo .
@echo ---------------------------------------------------------------------------------
@echo ----------------------------------INSTALLING C++---------------------------------
@echo ---------------------------------------------------------------------------------
C:\Windows\_C++.exe /ai
@echo .
@echo .
timeout 10 > NUL /nobreak
@echo .
@echo .
@echo .
@echo .
timeout 2 > NUL /nobreak
@echo .
@echo .
@echo ---------------------------------------------------------------------------------
@echo -----------------------------------INSTALLING DX---------------------------------
@echo ---------------------------------------------------------------------------------
C:\Windows\_DX\DXSETUP.exe /silent
@echo .
@echo .
timeout 10 > NUL /nobreak
@echo .
@echo .
@echo ---------------------------------------------------------------------------------
@echo ----------------------------IMPORTING REGISTRY TWEAKS----------------------------
@echo ---------------------------------------------------------------------------------
regedit.exe /s "C:\Windows\_Registry.reg"
@echo .
@echo .
timeout 2 > NUL /nobreak
@echo .
@echo .
@echo ---------------------------------------------------------------------------------
@echo ----------------------------DISABLING NETWORK DISCOVERY--------------------------
@echo ---------------------------------------------------------------------------------
netsh advfirewall firewall set rule group="Network Discovery" new enable=No
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=No
@echo .
@echo .
timeout 2 > NUL /nobreak
@echo .
@echo .
@echo .
@echo .
timeout 2 > NUL /nobreak
@echo .
@echo .
@echo ---------------------------------------------------------------------------------
@echo ------------------------------------RESTARTING PC--------------------------------
@echo ---------------------------------------------------------------------------------
@echo .
@echo .
timeout 5 > NUL /nobreak
C:\Windows\System32\shutdown.exe /r /t 0
del "C:\_PostInstall.cmd"