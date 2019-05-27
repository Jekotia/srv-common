#! /bin/bash
function system_add_host_entry {
	isRoot "exit"
	
    # $1 - The IP address to set a hosts entry for
    # $2 - The FQDN to set to the IP
    IPADDR="$1"
    FQDN="$2"

    if [ -z "$IPADDR" -o -z "$FQDN" ]; then
        echo "IP address and/or FQDN Undefined"
        return 1;
    fi
    
    echo $IPADDR $FQDN  >> /etc/hosts
}