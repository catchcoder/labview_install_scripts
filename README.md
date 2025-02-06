# LabVIEW for Windows install script

## Steps of the script

1. Check if NI Package Manager (NIPM) is already installed
2. If NIPM is installed, if yes then retrieve the version that is installed
3. Install client-side License software
4. Install LabVIEW and NI-MAX with a few toolkits
5. Restart computer

## Edits required in the script

### NIPM Executable name

Edit line **set "NIPM=NIPackageManager25.0.0.exe"** with the NIPM fullname with extension

### Variable **compareNumber** Version required

Edit line **set "compareNumber=25.0.0"** with required version - Same as NIPM executable

## Where to get the latest NIPM install package

Download NIPM **offline** version from [NI.COM Support](https://www.ni.com/en/support/downloads/software-products/download.package-manager.html#322516)
