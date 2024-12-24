# for debugging
# wait until a file has been removed from desktop
$file = "C:\users\vagrant\Desktop\delete-to-continue.txt"

if (-Not (Test-Path $file)) {
  Write-Output "Remove me" | Out-File $file
}

Write-Output "Wait until someone removes $file"

while (Test-Path $file) {
  Start-Sleep 1
}

Write-Output "Done waiting!"
