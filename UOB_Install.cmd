pushd %~dp0
@echo off
setlocal

REM Define the key to search for
set "regKey=HKLM\SOFTWARE\National Instruments\NI Package Manager\CurrentVersion"
set "regValue=Version"

REM Define the number to compare against
set "compareNumber=25.0.0"

REM Check if NI Package Manager is installed
reg query "%regKey%" /v "%regValue%" >nul 2>&1

REM If registry query failed then skip to :install
if %errorlevel% neq 0 (
    goto :install
)

REM Get the registry value
for /f "tokens=3" %%A in ('reg query "%regKey%" /v "%regValue%" 2^>nul') do (
    set "regNumber=%%A"
)

REM Check if the registry value is greater than or equal to the compare number
if %regNumber% GEQ %compareNumber% (
    echo The latest version for the NI Package Manager is already installed.
) else (
    echo .
    echo start /wait ./NIPackageManager25.0.0.exe --quiet --accept-eulas --prevent-reboot
)

:install
endlocal
REM Intall Labview
echo start /wait ./_Src/Install.exe --passive --accept-eulas --prevent-reboot
echo start /wait ./Client/vlmclient.exe /q /acceptlicenses yes /group {524F9E9B-7126-4E97-B112-B54680D4D71A}

REM NI-MAX and others require a reboot to complete the install
PowerShell -Command "Add-Type -AssemblyName PresentationFramework;[System.Windows.MessageBox]::Show('This computer must be restarted to complete the install', 'LabVIEW Install', 'Ok','Exclamation')
pause
popd

