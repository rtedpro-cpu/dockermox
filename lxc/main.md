# LXC in dockermox
The service lxcfs needs to be patched out, edit the file in container (/lib/systemd/system/lxcfs.service)

And uncomment the line with "ConditionVirtualization", by putting a "#" before it.

Save it and run 

```bash
systemctl daemon-reload
systemctl restart lxcfs
```

Assuming you have VMBR0 networking already done and working, continue then.

WARRING: For not everyone all you gotta do is edit the lxcfs and not use nesting in unprivileged container and it would work out of the box.
ONLY PROCEED IF IT DIDNT WORK

# Making a container

Usually create the container in Proxmox VE and if you get a disk error while creating, you will need to execute "modprobe loop" in the host.
Make sure you also have assigned a ip address and gateway and finally DNS (example... 192.168.2.2,192.168.2.1,1.1.1.1)
After creating, edit the lxc container config (nano /var/lib/lxc/CTIDHERE/config)

Remove any line with apparmor in it.
At the end of all lines, add this line.
```bash
lxc.apparmor.profile=unconfined
```
Then start the container.
```bash
lxc-start -n CTIDHERE
```

Then you should be done and you can access the lxc container. You have to do this every time if you wanna start the container.
