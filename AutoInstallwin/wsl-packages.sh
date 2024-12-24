#!/bin/bash

set -e 

GREEN='\033[0;32m'
NC='\033[0m' # No Color

sudo apt update --allow-insecure-repositories || sudo apt update --allow-releaseinfo-change
sudo apt --fix-broken install -y

sudo apt install -y libclang-cpp19 libllvm19 

echo -e "${GREEN}[+] developpement tools installations...${NC}"
sudo apt install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
    g++-mingw-w64 \
    gcc-mingw-w64 \
    clang-tools-19 \
    g++-mingw-w64-x86-64-win32 \
    binutils-mingw-w64-x86-64 \
    llvm-19

#offsec tools
echo -e "${GREEN}[+] offsec tools installation...${NC}"
sudo apt install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
    python3-pip \
    python3-impacket \
    pipx \
    git \
    certipy-ad \
    netexec \
    netcat-traditional \
    socat \
    responder \
    coercer \
    evil-winrm \
    burpsuite \
    sqlmap \
    feroxbuster \
    wireshark \
    ligolo-ng \
    chisel \
    enum4linux \
    exploitdb \
    metasploit-framework \
    sshuttle \
    mimikatz \
    powersploit \
    proxychains4 \
    ptunnel \
    udptunnel \
    wpscan \
    weevely

echo -e "${GREEN}[+] Clone some other tools...${NC}"
TOOLS_DIR="/home/Tools"
sudo mkdir -p "$TOOLS_DIR"
cd "$TOOLS_DIR"

git clone https://github.com/CobblePot59/ADcheck || echo "ADcheck already cloned."
git clone https://github.com/lgandx/PCredz || echo "PCredz already cloned."
git clone https://github.com/synacktiv/DLHell || echo "DLHell already cloned."
git clone https://github.com/fatedier/frp || echo "frp already cloned."
git clone https://github.com/TheCyb3rAlpha/BobTheSmuggler || echo "BobTheSmuggler already cloned."
git clone https://github.com/klezVirus/SysWhispers3 || echo "SysWhispers3 already cloned."
git clone https://github.com/dirkjanm/krbrelayx || echo "krbrelayx already cloned."
git clone https://github.com/juanfont/headscale || echo "headscale already cloned."

echo -e "${GREEN}[+] PCredz...${NC}"
#sudo apt install -y libpcap-dev
#pip3 install Cython python-libpcap

echo -e "${GREEN}[+] DLHell...${NC}"
#cd "$TOOLS_DIR/DLHell"
#pip3 install -r requirements.txt

echo -e "${GREEN}[+] DonPAPI...${NC}"
pipx install donpapi

# 11. Installer BobTheSmuggler
echo -e "${GREEN}[+] BobTheSmuggler...${NC}"
#pip install python-magic py7zr pyminizip

echo -e "${GREEN}[+] finish...${NC}"
