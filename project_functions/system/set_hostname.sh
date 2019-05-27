#! /bin/bash
function system_set_hostname {
	isRoot "exit"

    # $1 - The hostname to define
    HOSTNAME="$1"
        
    if [ ! -n "$HOSTNAME" ]; then
        echo "Hostname undefined"
        return 1;
    fi
    
    echo "$HOSTNAME" > /etc/hostname
    hostname -F /etc/hostname
}