# Windows Command scripts

## LabVIEW for Windows install script

This script will check what version of the `NI Package Manager` is installed, if the version is less that the version required by the installer it will update the `NI Package Manager` and then install LabVIEW

## NI VLM Backup script

This script will:

1. **stop** the `NiVlm.exe` application is it is running.
2. It will execute `NiVlm.exe` with the `/backup` switch with the path to save the backup.
3. Backup NI VLM log file
4. Remove any backups that are older than 10 day
