#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/init

_atlas="/srv/atlas"
_saturn="/srv/saturn"

if hostname | grep atlas ; then
	envList="${_atlas}/puppet/envList"
	_root="${_atlas}"
elif hostname | grep saturn ; then
	envList="${_saturn}/puppet/envList"
	_root="${_saturn}"
else
	echo "ERROR: Could not detect 'atlas' or 'saturn' in the output of 'hostname'"
	exit 1
fi

source ${_root}/config/environment.conf

#_root defined in above if structure
_root_config="${_root}/config"
_root_puppet="${_root}/puppet/puppet" # root puppet
_root_puppetfiles="${_root}/puppet/puppetfiles" # root puppet files
_common="/srv/common"
_common_config="${_common}/config"
_common_functions="${_common}/functions"
_common_puppet="${_common}/puppet/puppet" # common puppet
_common_puppetfiles="${_common}/puppet/puppetfiles" # common puppet files

_script_root="${DIR}" # Root directory for server scripts
_script_init="${_common}/scripts/init" # init script to bootstrap things
_script_ddns="${_common}/scripts/ddns.sh"



_isRoot "exit"

rm -f ${envList}
> /etc/environment

_envAdd	"_ROOT"			"${_root}"
_envAdd "_ROOT_CONFIG"		"${_root_config}"
_envAdd "_ROOT_PUPPET"		"${_root_puppet}"
_envAdd "_ROOT_PUPPETFILES"	"${_root_puppetfiles}"
_envAdd "_COMMON"		"${_common}"
_envAdd	"_COMMON_CONFIG"	"${_common_config}"
_envAdd "_COMMON_FUNCTIONS"	"${_common_functions}"
_envAdd "_COMMON_PUPPET"	"${_common_puppet}"
_envAdd "_COMMON_PUPPETFILES"	"${_common_puppetfiles}"

_envAdd	"_SCRIPT_ROOT"		"${_script_root}"
_envAdd	"_SCRIPT_INIT"		"${_script_init}"
_envAdd "_SCRIPT_DDNS"		"${_script_ddns}"

chown ${_UID}:${_GID} ${puppetEnvFile}
