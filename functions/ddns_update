#! /bin/bash
function ddns_update () {
	source ${_ROOT_CONFIG}/ddns.conf
	duckURL="https://www.duckdns.org/update?domains=${duckDomains}&token=${duckToken}&ip=${duckIP}"
	echo url="${duckURL}" | curl -k -o ${_LOGS}/ddns.log -K -
}
