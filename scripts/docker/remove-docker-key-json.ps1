# Do not restart Docker as it creates the key.json with an unique ID
# This should not exist in the Vagrant basebox so you can spin up
# multiple Vagrant boxes for a Docker swarm etc.

Write-Output "Stopping Docker"
Stop-Service docker

Write-Output "Removing key.json to recreate key.json on first vagrant up"
Remove-Item C:\ProgramData\docker\config\key.json
