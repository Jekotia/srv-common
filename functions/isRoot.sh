#! /bin/bash
function isRoot {
	if [[ `id -u` == "0" ]] ; then
		return
	else
		echo "This script requires root/sudo!"
                if [[ "$1" == "exit" ]] ; then
                        exit 99
                else
                        return 1
                fi
	fi
}
