# Table of contents
- [Overview](#overview)
- [Getting Started](#getting-started)
- [Troubleshooting](#troubleshooting)

## Overview
*Dockermox* (Docker**prox**mox) is a docker based solution to run Proxmox VE in a docker container inside linux hosts. Theres no support for arm64 at the moment and probably wont be.


There is full support for LXC containers, Click ![here](./lxc/main.md) for more information.

![Screenshot of dockermox](./showcase_container_1.png)
![Screenshot of dockermox](./image2.png)
Default username and password:

**Username**: root 

**Password**: root

## Getting Started
*Dockermox* can be ran by using this docker command
```bash
docker run -itd --name proxmoxve --hostname pve -p 8006:8006 --privileged rtedpro/proxmox:8.4.x
```

**WARNNING** No vmbr0 bridge is created by default, click ![here](./vmbr0/README.md) to set it up

## Troubleshooting
Please create a issue and describe the issue you have.
