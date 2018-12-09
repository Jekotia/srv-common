#! /bin/bash
function user_add_pubkey {
    # Adds the users public key to authorized_keys for the specified user. Make sure you wrap your input variables in double quotes, or the key may not load properly.
    #
    #
    # $1 - Required - username
    # $2 - Required - public key
    USERNAME="$1"
    USERPUBKEY="$2"
    
    if [ ! -n "$USERNAME" ] || [ ! -n "$USERPUBKEY" ]; then
        echo "Must provide a username and the location of a pubkey"
        return 1;
    fi
    
    if [ "$USERNAME" == "root" ]; then
        mkdir /root/.ssh
        echo "$USERPUBKEY" >> /root/.ssh/authorized_keys
        return 1;
    fi
    
    mkdir -p /home/$USERNAME/.ssh
    echo "$USERPUBKEY" >> /home/$USERNAME/.ssh/authorized_keys
    chown -R "$USERNAME":"$USERNAME" /home/$USERNAME/.ssh
}