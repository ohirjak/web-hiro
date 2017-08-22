# Useful Commands
## Generic
```
# Maven skip tests
mvn install -Dmaven.test.skip=true
 
# Pengutronix build
ptxdist distclean
ptxdist clean
ptxdist platform configs/cupid/platformconfig
ptxdist select configs/cupid/ptxconfig
ptxdist go
ptxdist menuconfig
 
# Update git submodules
git submodule update --init --recursive <path>
 
# Journal/logs
journalctl -xe
journalctl -u ntpd
 
# FS
mount -n -o rw,remount,noatime /
mount -n -o ro,remount /
 
# Connect to PostgreSQL
sudo -u postgres psql -U user -W -d DB
 
# Upload file to SK nexus
curl -v --user 'admin:admin123' --upload-file <file> http://docker/repository/artefacts/<project>/<file>

# Query cert info
openssl pkcs12 -info -in cert.p12 
```
## Network
```
# Create tunnel
ssh root@192.168.15.239 -L 127.0.0.1:7779:172.17.130.2:7778 -L 127.0.0.1:7780:172.17.130.3:7778
# Configure static IP
sudo ifconfig en5 172.17.130.10/28 add
ip link set dev enp0s20u3 down
ip link set dev enp0s20u3 up

# tcpdump
tcpdump -i enp0s20u3 -vvv port 67 or port 68 -nn -e

# Add port to firewall
firewall-cmd --zone=public --add-port=1602/tcp

# Delete route
route del -net 169.254.0.0 gw 0.0.0.0 netmask 255.255.0.0 dev enp2s0f2

# Check running devices
nmap -sP 192.168.1.0/24

# Send mail
echo "success" | mail -s "This is test mail" -r "test@domain.com" ohirjak@gmail.com
```
## Docker
```
ssh root@192.168.15.187 -L 10.20.0.17:1601:192.168.0.1:1601
docker run -d -p 18004:18001 docker:443/admin/<image>
docker exec -ti <instance> bash
docker rm <instance>

docker tag 35a5a2e242a0 docker:443/admin/<image>

docker login --email=o.hirjak@gmail.com --username=admin --password=admin123 docker:443
docker push docker:443/admin/<image>
```
## Simple listener
```
#!/usr/bin/python
from socket import *

#ip = "192.168.255.255"
#ip = "255.255.255.255"
#ip = ""
ip = "0.0.0.0"
#ip = "169.254.255.255"
#ip = "192.168.0.1"
port = 67

print "bind to " + repr(ip) + ":" + repr(port)

s = socket(AF_INET, SOCK_DGRAM)
s.setsockopt(SOL_SOCKET, SO_BROADCAST, 1)
s.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
s.bind((ip, port))

while True:
    print "receive"
    m = s.recvfrom(1500)
    print "got"
    print m[0]
    print ":".join("{:02x}".format(ord(c)) for c in m[0])
```
## Hardware

HW USB switch
- https://befinitiv.wordpress.com/2014/02/02/hacking-per-port-power-switching-to-an-usb-hub-2/
- http://www.ibuyopenwrt.com/index.php/15-yun-compatible/hardware-yun/36-usb-hub-per-port-power-switching-2
- https://www.cyberport.at/?DEEP=5302-107&APID=66&STOREID=-1

UPS like style
- https://www.conrad.at/de/steckdosenleiste-mit-schalter-6fach-schwarz-schutzkontakt-gembird-eg-pm2-554162.html

RasPi UPS
- http://www.modmypi.com/raspberry-pi/breakout-boards/pi-modules/ups-pico

Cables
- https://www.sos.sk/products/ftdi/usb-nmc-2-5m-2419947-131329
