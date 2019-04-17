# Security-ARP-Poisoning
Part of a group project in CS:4640, Computer Security. All code for this portion of the project is my work.

Shows simple arp attacks and defense using: arp, ping, and iputils-arping
<br/>Note: These were manually re-typed on git so syntax errors here are possible

# script.sh, Runs on startup
- each VM runs its own version of script.sh to setup its IP address and generate an ARP table with its neighbors.

# listen.sh
- Just shows packets coming in so we can see them for the demo

# poison.sh (Part 1)
- In order to poison the other two nodes we know of in the network the attacker runs poison.sh

# defense.sh (Part 2)
- To defend against arp poisoning victim 1 runs defense.sh which clears the arp cache any time duplicate MAC addresses are detected

# poisonSpam.sh (Part 3)
- This is meant to spam and arp poison everyone in the network that we know of
- This loops through the arp table and spams everyone in it with arp update requests saying we are everyone else
- This attack is meant to always win as sometimes with poison.sh the two victim nodes will figure out they are being spoofed eventually
