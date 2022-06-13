### System Information

Current Release Information \
`lsb_release -a`

Kernal information \
`uname -a`

ARM CPU Temperature \
`cat /sys/class/thermal/thermal_zone0/temp`

GPU Temperature \
`vcgencmd measure_temp` \
**OR** (if `/opt/vc/bin` isn't in your path) \
`/opt/vc/bin/vcgencmd measure_temp`

CPU Frequency information \
(useful if pi is overclocked) \
`sudo apt install cpufrequtils` \
`sudo cpufreq-info -sm` (view frequency distribution) \
`watch -n 1 -x sudo cpufreq-info -fm` (watch frequency, updated every 1 sec)


### Process Management

View all enabled/running service \
`sudo systemctl --type=service`

Reload system processes after a service file change \
`systemctl daemon-reload`

Start service at boot \
`systemctl enable <service_name>.service`

Control/check service \
`systemctl [start|stop|restart|status] <service_name>.service`

Follow logs for a service \
`journalctl -u <service_name>.service -f`

Grep logs \
`journalctl -u <service_name>.service | grep -i error`

### Memory/Hardware Management

Free memory
`free -h`

Memory configuration, maximum, and speed informatio \
`sudo dmidecode -t memory`

CPU Frequency
`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq`

CPU information
`lscpu`

Using hwinfo \
`sudo apt install hwinfo` \
`hwinfo --short` # show short version of hwinfo \
`hwinfo --disk` # show disk info


### Disk Management

Size of directory \
`du -shc /dir`

View partions \
`parted -l`

Partion drives \
`parted <device>`
`(parted) select <device>`
`(parted) gpt` (options: aix, amiga, bsd, dvh, gpt, mac, ms-dos, pc98, sun, loop)
`(parted) print` (to view changes)
`(parted) mkpart <name> ext4 0% 100%` (to use full drive)
`quit` (to save changes)

Remove partions \
`parted <device>`
`rm <partion_num>`

Format Hard Disk \
`mkfs -t ext4 <device>` (eg. `/dev/sda1`)

Mount disk \
``

Unmount Disk \
``

### Disk Information

View block devices with extended information \
`lsblk -fm`

List partitions \
`sudo fdisk -l`

## Networking

Use curl over a specific interface
`curl --interface eth0 https://api64.ipify.org`
`curl --interface tun0 google.com https://api.ipify.org`

#### Network Namespaces

Enter shell with network namespace \
`ip netns exec ns1 /bin/bash --rcfile <(echo "PS1=\"namespace ns1> \"")`

### RSync

Running rsync in the background - and viewing output. \
`nohup rsync -avp [src] [dst] &` \
`tail -f nohup.out`

### Screen

Name you screen sessions \
`screen -S <session-name>` (name for refrence when using `screen -ls`)

List open screens \
`screen -ls`

Reattach to screen \
`screen -r <pid>`
