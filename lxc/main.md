# LXC in dockermox
lxcfs needs to be patched out, edit the file in container (/lib/systemd/system/lxcfs.service)

and uncomment the line with "ConditionVirtualization"

save it and refresh the systemctl dameon.


make sure you already have vmbr0 networking 


# Making a container

```bash
lxc-create --name container --template download
```

(alpine is only currently tested)

edit the lxc container config (nano /var/lib/lxc/container/config)

change "lxc.net.0.link = lxcbr0" to "lxc.net.0.link = vmbr0"

and add these lines
```bash
lxc.apparmor.profile=unconfined

lxc.net.0.ipv4.address = 192.168.2.76/24

lxc.net.0.ipv4.gateway = 192.168.2.1
```

start the container

```bash
lxc-start -n container
```

attach to the container

```bash
lxc-attach -n container
```

Inside the container:

```bash
vi /etc/network/interfaces
```

(if you dont know how to use vim search on google)

replace everything with this config in the file

```bash
auto eth0
iface eth0 inet static
    address 192.168.2.76
    netmask 255.255.255.0
    gateway 192.168.2.1
```

NOW add dns

echo "nameserver 8.8.8.8" > /etc/resolv.conf

echo "nameserver 1.1.1.1" >> /etc/resolv.conf
