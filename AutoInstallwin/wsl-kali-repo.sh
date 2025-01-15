#!/bin/bash

set -e 

# color
GREEN='\033[0;32m'
NC='\033[0m'

# add kali repo
echo -e "${GREEN}[+] Adding kali repo...${NC}"
KALI_LIST="/etc/apt/sources.list.d/kali.list"

if [ ! -f "$KALI_LIST" ]; then
    echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee "$KALI_LIST"
else
    echo "kali repo are already configured."
fi

# adding key
echo -e "${GREEN}[+] Adding key...${NC}"
KALI_KEYRING="/usr/share/keyrings/kali-archive-keyring.gpg"

wget -q -O - https://archive.kali.org/archive-key.asc | sudo gpg --dearmor -o "$KALI_KEYRING"

# key dl
wget -q -O - https://archive.kali.org/archive-key.asc | sudo tee /etc/apt/trusted.gpg.d/kali-archive-key.asc

# Ubuntu first
echo -e "${GREEN}[+] Prioritizing Ubuntu...${NC}"
KALI_PREF="/etc/apt/preferences.d/kali.pref"

sudo tee "$KALI_PREF" > /dev/null <<EOL
Package: *
Pin: release o=Kali
Pin-Priority: 50
EOL

# Priority for specific tools from Kali
echo -e "${GREEN}[+] Prioritizing Kali tools...${NC}"
sudo tee -a "$KALI_PREF" > /dev/null <<EOL
Package: metasploit-framework*
Pin: release o=Kali
Pin-Priority: 900

Package: nmap*
Pin: release o=Kali
Pin-Priority: 900

Package: burpsuite*
Pin: release o=Kali
Pin-Priority: 900

Package: libruby*
Pin: release o=Kali
Pin-Priority: 900

Package: ruby*
Pin: release o=Kali
Pin-Priority: 900

Package: ruby-ffi*
Pin: release o=Kali
Pin-Priority: 900

Package: ruby-nokogiri*
Pin: release o=Kali
Pin-Priority: 900

Package: ruby-sdbm*
Pin: release o=Kali
Pin-Priority: 900
EOL

# Force install ruby from Kali
echo -e "${GREEN}[+] Forcing ruby install from Kali...${NC}"
sudo apt install --fix-broken ruby libruby ruby-ffi ruby-nokogiri ruby-sdbm -y

# updates packets 
echo -e "${GREEN}[+] Updating...${NC}"
sudo apt update

echo -e "${GREEN}[+] Kali Linux repo was added.${NC}"