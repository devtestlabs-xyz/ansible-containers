#!/bin/bash
#set -e

printf "\n######################################################################"
printf "\n# Ansible control node for secure control of Linux and Windows hosts #"
printf "\n######################################################################\n"

# If "-e uid={custom/local user id}" flag is not set for "docker run" command, use 9999 as default
_GROUP=${GROUP:-ansible}
_USER=${USER:-ansible}
_UID=${UID:-9999}
_GID=${GID:-9999}

# Notify user about the UID selected
echo "Current UID : $_UID"

# Notify user about the UID selected
echo "Current GID : $_GID"

# NOTE: Had to resort to useradd and groupadd in shadow package due to the issue described in https://stackoverflow.com/questions/41807026/cant-add-a-user-with-a-high-uid-in-docker-alpine/53604334#53604334

# Create group called "container" or ${_GROUP} value with CURRENT_GID
/usr/sbin/groupadd --gid $_GID $_GROUP

# Create user with selected UID
/usr/sbin/useradd --system --create-home --shell /bin/bash --home /home/${_USER} --uid $_UID --gid $_GID $_USER

# Change ownership of /puml (source) and /images (out) paths to current UID:GID
chown -R $_UID:$_GID /puml
chown -R $_UID:$_GID /images

#exec "$@"
su-exec $_UID "$@"