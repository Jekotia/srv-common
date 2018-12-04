#! /bin/bash

cat <<EOT >> /etc/profile
PATH="${PATH}:$_COMMON_BIN"
export PATH
EOT

_puppet_install

source ${_COMMON}/pi-boot/setup.sh

env-update
