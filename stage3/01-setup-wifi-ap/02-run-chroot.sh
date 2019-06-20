echo "interface=wlan0" > /etc/dnsmasq.conf # Overwrite file
echo "dhcp-range=192.168.1.2,192.168.1.254,255.255.255.0,24h" >> /etc/dnsmasq.conf
echo "address=/#/192.168.1.1" >> /etc/dnsmasq.conf
