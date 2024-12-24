# Force le réseau à privé pour éviter les restrictions
try {
    $NetworkListManager = [Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]"{DCB00C01-570F-4A9B-8D69-199FDBA5723B}"))
    $Connections = $NetworkListManager.GetNetworkConnections()
    $Connections | ForEach-Object { $_.GetNetwork().SetCategory(1) }
} catch {
    Write-Host "Erreur réseau: $_"
}

try {
    Get-NetConnectionProfile | Where-Object NetworkCategory -eq "Public" | Set-NetConnectionProfile -NetworkCategory Private
} catch {
    Write-Host "Erreur changement de profil réseau: $_"
}

# Activation de WinRM
Enable-PSRemoting -Force
winrm quickconfig -q
winrm quickconfig -transport:http
winrm set winrm/config '@{MaxTimeoutms="1800000"}'
winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="800"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/client/auth '@{Basic="true"}'
winrm set winrm/config/listener?Address=*+Transport=HTTP '@{Port="5985"}'

# Activation du firewall
netsh advfirewall firewall set rule group="Windows Remote Administration" new enable=yes
netsh advfirewall firewall set rule name="Windows Remote Management (HTTP-In)" new enable=yes action=allow remoteip=any

# Assurer que WinRM démarre automatiquement
Set-Service winrm -startuptype "auto"

# Redémarre le service
Restart-Service winrm

# Vérification que WinRM écoute bien sur le port 5985 (boucle de 2 min)
$timeout = 120
$startTime = Get-Date
while ((Get-Date) -lt $startTime.AddSeconds($timeout)) {
    if ((Test-NetConnection -ComputerName localhost -Port 5985).TcpTestSucceeded) {
        Write-Host "WinRM est prêt"
        break
    }
    Start-Sleep -Seconds 5
    Write-Host "En attente de WinRM..."
}

# Si WinRM ne répond toujours pas après 2 min
if (!(Test-NetConnection -ComputerName localhost -Port 5985).TcpTestSucceeded) {
    Write-Host "WinRM n'a pas démarré à temps"
    exit 1
}
