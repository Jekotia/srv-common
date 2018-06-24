#! /bin/bash
source $_SCRIPT_INIT
cd ${_ROOT_PUPPET}

outputFile="puppetfile.pp"

function _insert () {
	echo >> ${outputFile}
	echo "#---- `pwd`/$1" ----# >> ${outputFile}
	cat $1 >> ${outputFile}
}

rm -f ${outputFile}

##=> Insert enviroment variables from the output of environment.sh
_insert "${_COMMON_PUPPETFILES}/envList"
_insert "${_ROOT_PUPPETFILES}/envList"

##=> Insert the contents of any services/*.pp files
##=> From common
for f in ${_COMMON_PUPPETFILES}/services/*.pp
do
	_insert "${f}"
done

##=> From root
for f in ${_ROOT_PUPPETFILES}/services/*.pp
do
	_insert "${f}"
done


_insert "${_COMMON_PUPPETFILES}/general.pp"
_insert "${_ROOT_PUPPETFILES}/general.pp"

# _insert "${_COMMON_PUPPETFILES}"

_insert "${_COMMON_PUPPETFILES}/packages.pp"
_insert "${_ROOT_PUPPETFILES}/packages.pp"
