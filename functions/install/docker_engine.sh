#! /bin/bash
function install_docker_engine {
	isRoot "exit"

	apt-get install -y \
		apt-transport-https \
		ca-certificates \
		curl \
		gnupg2 \
		software-properties-common

	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

	if ! apt-key fingerprint 0EBFCD88 ; then echo "Failed to match gpg key fingerprint!" ; exit 1 ; fi

	add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/debian \
		$(lsb_release -cs) \
		stable"

	package update

	package install docker-ce

	docker run hello-world

	#	cat >> /home/pi/.profile <<EOF
	#
	#if [ -d "/saturn/docker/bin" ] ; then
	#	PATH='/saturn/docker/bin:$PATH'
	#fi
	#EOF
}
