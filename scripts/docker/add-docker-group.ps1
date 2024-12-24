Write-Output Creating group docker
net localgroup docker /add
$username = $env:USERNAME
Write-Output Adding user $username to group docker
net localgroup docker $username /add
