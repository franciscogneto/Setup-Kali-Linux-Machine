#!/bin/bash


BLUE='\033[0;34m';
WHITE='\033[0;37m';
RED='\033[0;31m';


echo -e "\n${RED} Don't forget to run with SUDO\n\n"



echo -e "${BLUE} ======================= Updating... ==============\n ${WHITE}"
apt update -y;
apt update -y --fix-missing;
apt upgrade -y;
apt upgrade -y --fix-missing;
apt upgrade --fix-broken;

echo -e "${BLUE} ============== VirtualBox Guest Additions ==============\n ${WHITE}"
apt install -y virtualbox-guest-x11

echo -e "${BLUE} ======================= Web Step ============== \n - gobuster \n - feroxbuster ${WHITE}"
apt install gobuster;
apt install -y feroxbuster;

echo -e "${BLUE} ==================== Wordlist Step ============== \n - seclists ${WHITE}"
apt install -y seclists;


echo -e "${BLUE} ====================== Tor Step ============== \n - tor ${WHITE}"
apt install -y tor;


echo -e "${BLUE} ===================== Proxy Step ============== \n - Proxy Chains ${WHITE}"
apt install -y proxychains;


echo -e "${BLUE} ============== Service Enumeration Step ============== \n - snmp-mibs-downloader ${WHITE}"
apt install -y snmp-mibs-downloader;

echo -e "${BLUE} ============= Adding Architecture x86 ============== \n ${WHITE}"
dpkg --add-architecture i386 && apt update;

echo -e "${BLUE} ============= Auxiliary Libs for cross-compiling (to architecture x86) ============ \n - gcc-multilib ${WHITE}"
apt install -y gcc-multilib

echo -e "${BLUE} ============= Windows auxiliary Tools Step ============== \n - wine \n - mingw-w64 ${WHITE}"
apt install -y wine32:i386;
apt install -y wine32;
apt install -y libwine mingw-w64 wine winetricks;

echo -e "${BLUE} ============= Openssl & Openssl dev  ============== \n ${WHITE}"
apt install -y openssl libssl-dev;


echo -e "${BLUE} ============= Python3 Auxiliary packages  ============== \n ${WHITE}"
pip3 install setuptools;
pip3 install pyftpdlib;


echo -e "${BLUE} ============= Python2 Auxiliary packages  ============== \n${WHITE}"
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py;
python2 get-pip.py;
rm get-pip.py;
pip2 install --upgrade setuptools;
#
# Impacket now require dsinternals, since dsinternals is a library from 2021, 
# we can search a impacket version older than dsinternals and instal it. Remember to do it with python 2
#https://stackoverflow.com/questions/76407565/error-package-dsinternals-requires-a-different-python-2-7-18-not-in-3-4
pip2 install impacket==0.9.22


echo -e "${BLUE} ============= Binary Analysis Tools Step ============== \n - gdb \n - edb-debugger \n - strace \n - ltrace ${WHITE}"
apt install -y gdb edb-debugger;


echo -e "${BLUE} ==================== Hex Editor ============== \n - imhex ${WHITE}"
apt install -y imhex;


echo -e "${BLUE} ==================== NetExec (the new crackmapexec) ============== \n - netexec ${WHITE}"
apt install -y pipx git;
pipx ensurepath;
pipx install git+https://github.com/Pennyw0rth/NetExec;
pipx ensurepath;


echo -e "${BLUE} ==================== Chisel - Tunneling Tool + binaries in /usr/share/chisel ============== \n - chisel ${WHITE}"
apt install -y chisel;
mkdir /usr/share/chisel;
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_amd64.gz -O /usr/share/chisel/chisel_linux_x64.gz;
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_386.gz -O /usr/share/chisel/chisel_linux_x86.gz;
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_windows_amd64.gz -O /usr/share/chisel/chisel_windows_x64.gz;
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_windows_386.gz -O /usr/share/chisel/chisel_windows_x86.gz;

echo -e "${BLUE} ==================== Golang + gccgo ============== \n - golang, gccgo ${WHITE}"
apt install -y golang-go;
apt install -y gccgo-go;

echo -e "${BLUE} ==================== Ngrok ============== \n - ngrok ${WHITE}"
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && apt update && apt install ngrok ;


echo -e "${BLUE} ============= Update Step ============== \n - metasploit \n - searchsploit \n - locate ${WHITE}"
apt install -y metasploit-framework;
searchsploit -u;
updatedb;

