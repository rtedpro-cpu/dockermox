FROM debian:12                                                                    
RUN apt-get update && \
    echo 'root:root' | chpasswd && \
    printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d && \ 
    apt-get install -y systemd systemd-sysv dbus dbus-user-session wget curl sudo && \
    printf "systemctl start systemd-logind" >> /etc/profile

RUN echo "deb [arch=amd64] http://download.proxmox.com/debian/pve bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
RUN wget https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg
RUN apt update && apt full-upgrade
RUN apt install proxmox-ve postfix open-iscsi chrony -y
CMD ["bash"]
ENTRYPOINT ["/sbin/init"]
