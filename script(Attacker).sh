#/bin/bash

ip addr add 192.168.1.1/24 dev enp0s8 # set ip address
ip link set up enp0s8 # turn on internet gateway thing
sleep 20s # sleep to wait for other nodes to turn on so we can ping them
ping -c 1 192.168.1.2 & # ping other nodes
ping -c 1 192.168.1.3 &
sysctl net.ipv4.ip_nonlocal_bind=1 # allow us to bind to an ip address that is not our own
sysctl net.ipv4.ip_forward=1 # allow us to route packets through us
sleep 5s
