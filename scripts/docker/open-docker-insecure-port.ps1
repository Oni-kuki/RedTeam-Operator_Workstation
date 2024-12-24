Write-Output "WARNING: DO NOT USE DOCKER IN PRODUCTION WITHOUT TLS"
Write-Output "Opening Docker insecure port 2375"

if (!(Get-NetFirewallRule | Where-Object {$_.Name -eq "Dockerinsecure2375"})) {
    New-NetFirewallRule -Name "Dockerinsecure2375" -DisplayName "Docker insecure on TCP/2375" -Protocol tcp -LocalPort 2375 -Action Allow -Enabled True
}
