#! /bin/bash
## takes variable name followed by value. e.g. _envAdd "_ROOT" "/saturn"
#puppetEnvFile=/saturn/puppet/envList
function envAdd {
	local targetFile=/etc/environment

	if ! cat /etc/sudoers | grep "Defaults" | grep "env_keep" | grep "_" > /dev/null 2>&1 ; then
		echo '# Getting all of my server ENV vars into sudo for script execution' | sudo EDITOR='tee -a' visudo
		echo 'Defaults	env_keep += "_*"' | sudo EDITOR='tee -a' visudo
	fi
	touch ${targetFile}
	echo "export $1=$2" >> ${targetFile}
	export $1=$2
	echo "Added '$1=$2' and export directive to '${targetFile}'"
	touch ${env['_PUPPET_ENV']}
	echo "\$$1 = \"$2\"" >> ${env['_PUPPET_ENV']}
	echo "Added '\$$1 = \"$2\"' to '${env['_PUPPET_ENV']}'"
}
