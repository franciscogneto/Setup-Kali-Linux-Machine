#!/bin/bash


BLUE='\033[0;34m';
WHITE='\033[0;37m';
RED='\033[0;31m';


echo -e "\n${RED} Don't forget to run with SUDO\n\n"



echo -e "${BLUE} ======================= Updating... ==============\n ${WHITE}"
apt update;
apt upgrade;

echo -e "${BLUE} ======================= Web Step ============== \n - gobuster ${WHITE}"
apt install gobuster;


echo -e "${BLUE} ==================== Wordlist Step ============== \n - seclists ${WHITE}"
apt install -y seclists;


echo -e "${BLUE} ====================== Tor Step ============== \n - tor ${WHITE}"
apt install -y tor;


echo -e "${BLUE} ===================== Proxy Step ============== \n - Proxy Chains ${WHITE}"
apt install -y proxychains;


echo -e "${BLUE} ============== Service Enumeration Step ============== \n - snmp-mibs-downloader ${WHITE}"
apt install -y snmp-mibs-downloader;


echo -e "${BLUE} ============= Windows auxiliary Tools Step ============== \n - wine \n - mingw-w64 ${WHITE}"
apt install -y mingw-w64 wine;


echo -e "${BLUE} ============= Binary Analysis Tools Step ============== \n - gdb \n - edb-debugger \n - strace \n - ltrace ${WHITE}"
apt install -y gdb edb-debugger;


echo -e "${BLUE} ==================== Hex Editor ============== \n - imhex ${WHITE}"
apt install -y imhex;


echo -e "${BLUE} ==================== NetExec (the new crackmapexec) ============== \n - netexec ${WHITE}"
apt install pipx git;
pipx ensurepath;
pipx install git+https://github.com/Pennyw0rth/NetExec;
pipx ensurepath;


echo -e "${BLUE} ============= Update Step ============== \n - metasploit \n - searchsploit \n - locate ${WHITE}"
apt install -y metasploit-framework;
searchsploit -u;
updatedb;

