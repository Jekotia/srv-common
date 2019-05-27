#! /bin/bash
function ssh_disable_root {
	isRoot "exit"
    # Disables root SSH access.
    sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
    touch /tmp/restart-ssh
    
}