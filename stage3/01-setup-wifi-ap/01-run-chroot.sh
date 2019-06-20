echo "interface wlan0" >> /etc/dhcpcd.conf
echo "    static ip_address=192.168.1.1/24" >> /etc/dhcpcd.conf
echo "    nohook wpa_supplicant" >> /etc/dhcpcd.conf
echo "    static domain_name_servers=192.168.1.1" >> /etc/dhcpcd.conf
