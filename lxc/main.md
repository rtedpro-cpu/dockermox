# LXC in dockermox
lxcfs needs to be patched out, edit the file in container (/lib/systemd/system/lxcfs.service)

And uncomment the line with "ConditionVirtualization"

save it and "systemctl daemon-reload" then "systemctl restart lxcfs" \\inside container\\


Make sure you already have vmbr0 networking or else it wont work.


# Making a container
Usually create the container in Proxmox VE and if you get a disk error while creating, you will need to execute "modprobe loop" in the host.
After creating, edit the lxc container config (nano /var/lib/lxc/CTIDHERE/config)

Remove any line with apparmor in it.
At the end add this line
```bash
lxc.apparmor.profile=unconfined
```
Then start the container.
```bash
lxc-start -n CTIDHERE
```

Then you should be done and you can access the lxc container. You have to do this every time if you wanna start the container.


WARRING: For sometimes all you gotta do is edit the lxcfs and not use nesting in unprivileged container and it would work out of the box.
