$admin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if ($admin) {
    Write-Host "You are already administrator - We continue Installation !" -ForegroundColor green
} else {
    throw "It's necessary to run the script with administrator privileges !"
    exit
}

function dlwsl {    
    # Clone a GitHub repository and run a script inside WSL
    wsl --set-default-version 2
    wsl --update
    wsl --install -d kali-linux
    wsl --setdefault kali-linux
}

function InstallWSL {    
    #Clone a GitHub repository and run a script inside WSL
    wsl.exe -e sudo bash -c "sudo apt update && git clone https://github.com/Oni-kuki/RedTeam-Operator_Workstation && cd RedTeam-Operator_Workstation/AutoInstallwin/wsl2 && sudo bash sh ./wsl-packages.sh"
}

dlwsl
InstallWSL
