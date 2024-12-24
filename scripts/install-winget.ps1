curl.exe -Lo $env:TEMP\VCLibs.appx https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage $env:TEMP\VCLibs.appx

curl.exe -Lo $env:TEMP\WinGet.msixbundle https://github.com/microsoft/winget-cli/releases/download/v1.1.12653/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Add-AppxPackage $env:TEMP\WinGet.msixbundle
