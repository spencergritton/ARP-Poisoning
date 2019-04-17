#/bin/bash
# Simple defense looking for dupicate ARP table entries and if found clearing ARP cache

while [ 1==1 ]
do
  # finds any MAC address that is repeated in the ARP table
  output="$(/usr/sbin/arp | awk '{print $3}' | uniq -d)" # print #3 is the third column of arp table which holds MAC's
  # finds the length of output (if it's above 16 then it's a MAC address, if less than 16 there are no duplicates)
  outputLen=${#output}
  
  # Red, green, and normal are just text colors to spice up the feedback
  red='\033[0;31m'
  green='\033[0;32m'
  normal='\033[0m'
  
  if [ "$((outputLen > 16))" == 1 ]; then
    echo -e "\n${red}ARP Poisoning detected ${normal}"
    echo -e "${red}Clearing cache ${normal}"
    # tur ARP table off and on again to clear cache
    ip link set arp off dev enp0s8
    echo -e "${red}...${normal}"
    ip link set arp on dev enp0s8
    echo -e "${green}Cache cleared${normal}"
  fi
  sleep 5
done
