#! /bin/bash
function install_puppet {
	isRoot "exit"

	install_package "https://apt.puppetlabs.com/puppet5-release-stretch.deb"
	package update
	package install puppet
}
