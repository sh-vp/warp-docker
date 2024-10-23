#!/bin/bash

red='\033[1;91m'          # Red
green='\033[1;92m'        # Green
yellow='\033[1;93m'       # Yellow
White='\033[0m'           # White
blue='\033[1;94m'         # blue

# check root
[[ $EUID -ne 0 ]] && echo -e "${red}Fatal error: ${plain} Please run this script with root privilege \n " && exit 1

# Check OS and set release variable
if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    release=$ID
elif [[ -f /usr/lib/os-release ]]; then
    source /usr/lib/os-release
    release=$ID
else
    echo "Failed to check the system OS, please contact the author!" >&2
    exit 1
fi
echo "The OS release is: $release"

    case "${release}" in
    centos | almalinux | rocky)
        yum -y update && yum install docker docker-compose -y -q
        ;;
    *)
    apt-get update && apt-get install docker docker-compose -y -q
        ;;
    esac
  mkdir /etc/warp
  wget --no-check-certificate -O /etc/warp/docker-compose.yml https://raw.githubusercontent.com/sh-vp/warp-docker/main/docker-compose.yml
  cd /etc/warp && docker-compose up -d
  clear 
echo ""    
echo -e "${yellow} _       __                    _____           _       __ ${White}"
echo -e "${yellow}| |     / /___ __________     / ___/__________(_)___  / /_${White}"
echo -e "${yellow}| | /| / / __  / ___/ __ \    \__ \/ ___/ ___/ / __ \/ __/${White}"
echo -e "${yellow}| |/ |/ / /_/ / /  / /_/ /   ___/ / /__/ /  / / /_/ / /_  ${White}"
echo -e "${yellow}|__/|__/\__,_/_/  / .___/   /____/\___/_/  /_/ .___/\__/  ${White}"
echo -e "${yellow}                 /_/                        /_/           ${White}"
echo -e ""
echo -e "${red}============================================"
echo -e ""
echo -e "${yellow}  https://github.com/sh-vp/Warp-Docker"
echo -e ""
echo -e "${green}  Author: Shadow-dev  "
echo -e ""
echo -e "${red}============================================"
echo -e ""
echo -e "${yellow}Warp Service${green} Activated Successfully! ${White}"
echo -e ""
echo -e "${red}Protocol : ${green}Socks5"
echo -e "${red}Port : ${green}40000${White}""
echo -e ""
