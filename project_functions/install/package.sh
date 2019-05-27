#! /bin/bash
function install_package {
	isRoot "exit"

	URL="${@}"

	if dpkg --version ; then
		wget -O /tmp/package.deb ${URL}
		dpkg -i /tmp/package.deb
		rm -f /tmp/package.deb
	else
		return 1
	fi
}
