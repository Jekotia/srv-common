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

_insert "${_COMMON_PUPPETFILES}/envList"
_insert "${_ROOT_PUPPETFILES}/envList"

_insert "${_COMMON_PUPPETFILES}/general.pp"
_insert "${_ROOT_PUPPETFILES}/general.pp"

# _insert "${_COMMON_PUPPETFILES}"

for f in ${_COMMON_PUPPETFILES}/services/*
do
	_insert "${f}"
done

for f in ${_ROOT_PUPPETFILES}/services/*
do
	_insert "${f}"
done

_insert "${_COMMON_PUPPETFILES}/packages.pp"
_insert "${_ROOT_PUPPETFILES}/packages.pp"
