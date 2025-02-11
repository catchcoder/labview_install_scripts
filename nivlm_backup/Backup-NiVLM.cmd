@echo off
:: Kill if NIVLM.exe is running
Taskkill  /F /IM NiVlm.exe  /T
:: Backup NIVLM
cd:\
cd "C:\Program Files (x86)\National Instruments\Volume License Manager\"
NiVlm.exe /backup "c:\backups"
:: Backup LM Log file
cd \
cd logs
copy /Y "C:\ProgramData\National Instruments\License Manager\Data\lmgrd.log" "c:\logs\"
:: Remove old backup files
c:
cd \
cd backups
ForFiles /d -10 /m *.vlmbak /c "cmd /c del /F @file"