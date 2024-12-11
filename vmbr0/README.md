As of writing this (11/12/2024-DD-MM-YEAR)


I have made the vmbr0 work without needing the proxnet service

Start by creating a network

```bash
docker network create \
  --driver bridge \
  --subnet=192.168.2.0/24 \
  eth2
```

Assign to a container

```bash
docker network connect eth2 proxmoxve
```

Redirect traffic

```bash
sudo iptables -t nat -A POSTROUTING -s 192.168.2.0/24 ! -o eth2 -j MASQUERADE
```

Create a Linux Bridge and bridge it to eth1, then apply the configuration.
![vmbr0](./image.png)


Thats all! Tho you will have to apply static ips in VMs to have network access (Or create your own DHCP SERVER)
