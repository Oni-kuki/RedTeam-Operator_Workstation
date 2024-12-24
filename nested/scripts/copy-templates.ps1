mkdir $env:USERPROFILE\packer-windows
Set-Location $env:USERPROFILE\packer-windows
Copy-Item \vagrant\*.json .
Copy-Item \vagrant\vag* .
Copy-Item -re \vagrant\answer_files\ answer_files
Copy-Item -re \vagrant\floppy\ floppy
Copy-Item -re \vagrant\scripts\ scripts
if (Test-Path \vagrant\packer_cache\) {  
  Copy-Item -re \vagrant\packer_cache\ packer_cache
}
