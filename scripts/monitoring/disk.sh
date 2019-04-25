#! /bin/bash

hostname=$(hostname -s)
source /srv/${hostname}/config/monitoring.conf

CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
if [ "$CURRENT" -gt "$DISK_THRESHOLD" ] ; then
	echo "ALERTING FOR DISK USAGE"
	#-# https://gist.github.com/ElijahLynn/72cb111c7caf32a73d6f
	echo "Your root partition remaining free space on $hostname is critically low. Used: $CURRENT%" \
	| docker exec -i mailer mail -s "Disk Space Alert for $hostname" -r "mercury@jekotia.net" $NOTIFY_ADDRESS
else
	echo "NOT ALERTING FOR DISK USAGE"
fi
