#! /bin/bash
function install_docker_compose {
	isRoot "exit"

	package update
	package install \
		"python \
		python-pip"
	pip install docker-compose
}
