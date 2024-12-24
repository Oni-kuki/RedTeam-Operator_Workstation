# install chocolatey
Invoke-WebRequest 'https://chocolatey.org/install.ps1' -UseBasicParsing -OutFile $env:TEMP\install.ps1
.\$env:TEMP\install.ps1
Remove-Item $env:TEMP\install.ps1 -Force -ErrorAction SilentlyContinue
choco feature disable --name showDownloadProgress

choco install -y packer
choco install -y vagrant
choco install -y docker
choco install -y docker-machine
