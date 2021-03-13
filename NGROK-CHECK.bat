@echo off
:: BatchGotAdmin (Run as Admin code starts)
REM --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
echo Requesting administrative privileges...
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
:: BatchGotAdmin (Run as Admin code ends)
:: Your codes should start from the following line
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Azure VM" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
net user administrator 01217682717Huy /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
echo To change another VM region, Create New organization (Your current VM location:  %LO% )
echo Region Available: West Europe, Central US, East Asia, Brazil South, Canada Central, Autralia East, UK South, South India
echo All done! Connect your VM using RDP. When RDP expired and VM shutdown, Rerun failed jobs to get a new RDP.
net user installer /delete
curl -o "C:\Windows\System32\Drivers\etc\hosts" https://raw.githubusercontent.com/ztvofficial/Windows2019RDP-US/main/Files/hosts > out.txt 2>&1
curl -o "C:\Users\administrator\Desktop\a.ps1" https://raw.githubusercontent.com/ngoc7sao9/Azure_RDP_Hack/main/a.ps1 > out.txt 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "C:\Users\administrator\Desktop\a.ps1" > out.txt 2>&1
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
echo All done! Connect your VM using RDP. When RDP expired and VM shutdown, Re-run jobs to get a new RDP.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Can't get NGROK tunnel, please paste new NGROK TOKEN in YML. Check Tunnel here: https://dashboard.ngrok.com/status/tunnels " && exit
echo User: administrator
echo Pass: 01217682717Huy
ping -n 99999999999999999999 127.0.0.1 >nul
