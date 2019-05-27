#! /bin/bash
function install_shell {
	isRoot "exit"

	if ! curl --version ; then
		package install "curl"
	fi
		
	curl -L https://github.com/Jekotia/.zsh/raw/master/shell-setup.sh | bash -s "$1"
}
