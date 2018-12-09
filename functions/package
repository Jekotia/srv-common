#! /bin/bash
function package {
	isRoot "exit"

	local installCmd=
	local updateCmd=
	local upgradeCmd=

	if apt-get --version > /dev/null 2>&1 ; then
		installCmd="apt-get install -y"
		updateCmd="apt-get update"
		upgradeCmd="apt-get upgrade -y"
	fi

	case $1 in
		install)
			${installCmd} "${@:2}"
		;;
		update)
			${updateCmd}
		;;
		upgrade)
			${upgradeCmd} "${@:2}"
		;;
	esac
}
