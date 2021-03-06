#! /bin/bash
function user_add_sudo {
	isRoot "exit"
    # Installs sudo if needed and creates a user in the sudo group.
    #
    # $1 - Required - username
    # $2 - Required - password
    USERNAME="$1"
    USERPASS="$2"

    if [ ! -n "$USERNAME" ] || [ ! -n "$USERPASS" ]; then
        echo "No new username and/or password entered"
        return 1;
    fi
    
    aptitude -y install sudo
    adduser $USERNAME --disabled-password --gecos ""
    echo "$USERNAME:$USERPASS" | chpasswd
    usermod -aG sudo $USERNAME
}