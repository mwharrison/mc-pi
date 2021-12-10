### System Information

Current Release Information \
`lsb_release -a`

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

### Networking

Use curl over a specific interface
`curl --interface eth0 https://api64.ipify.org`
`curl --interface tun0 google.com https://api.ipify.org`

#### Network Namespaces

Enter shell with network namespace \
`ip netns exec ns1 /bin/bash --rcfile <(echo "PS1=\"namespace ns1> \"")`

### Screen

Name you screen sessions \
`screen -S <session-name>` (name for refrence when using `screen -ls`)

List open screens \
`screen -ls`

Reattach to screen \
`screen -r <pid>`
