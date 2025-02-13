pushd %~dp0
@echo off
setlocal

REM Define variables - change with each version
set "NIPM=NIPackageManager25.0.0.exe" # Define executable for NIPM
set "compareNumber=25.0.0" # Define version for NI Package Manager software

REM Set variables
set "regKey=HKLM\SOFTWARE\National Instruments\NI Package Manager\CurrentVersion" # Registry location for NIPM
set "regValue=Version" # Registry Key for NIPM version to check

REM Check if NI Package Manager is installed
reg query "%regKey%" /v "%regValue%" >nul 2>&1

REM Review the exit error value from the last command
if %errorlevel% neq 0 (
    goto :install
)

REM Get install version for NIPM
for /f "tokens=3" %%A in ('reg query "%regKey%" /v "%regValue%" 2^>nul') do (
    set "regNumber=%%A"
)

REM Compare install version with required version
if %regNumber% GEQ %compareNumber% (
    echo The latest version for the NI Package Manager is already installed.
) else (
    start /wait ./%NIPM% --quiet --accept-eulas --prevent-reboot
)

:install
REM Install Client License Software 
start /wait ./_Src/Install.exe --passive --accept-eulas --prevent-reboot
REM Install NI LabVIEW
start /wait ./Client/vlmclient.exe /q /acceptlicenses yes /groups "{524F9E9B-7126-4E97-B112-B54680D4D71A},{E1D7A7F4-06C1-4FD1-AAF5-607B03CFE294}"

REM NI-MAX and other services require a reboot to complete the install
PowerShell -Command "Add-Type -AssemblyName "^
 "PresentationFramework;[System.Windows.MessageBox]::Show("^
 "'This computer must be restarted to complete the install'"^
 " + [System.Environment]::NewLine + [System.Environment]::NewLine"^
 " + 'For additional toolkits and drivers please use the NI Package Manager application',"^
 " 'LabVIEW Install',"^
 " 'Ok','Exclamation')"

popd
