#/bin/bash
# NOTE THIS IS THE SCRIPT OF VICTIM 1, THE ONLY CHANGE FOR VICTIM 2 IS THAT THE IP ADDRESS IS CHANGED TO 192.168.1.3 
# AND PING TO 192.168.1.2 INSTEAD OF .3

ip addr add 192.168.1.2/24 dev enp0s8 # set ip address
ip link set up enp0s8 # turn on internet gateway thing
sleep 20s # sleep to wait for other nodes to turn on so we can ping them
ping -c 1 192.168.1.1 & # ping other nodes
ping -c 1 192.168.1.3 &
