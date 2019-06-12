#!/usr/bin/env bash

# create a user
DOCKER_USER_ID=${DOCKER_USER_ID:-9001} 
DOCKER_PASSWORD=${DOCKER_PASSWORD:-$DOCKER_USER} 
DOCKER_GROUP=${DOCKER_GROUP:-docker} 
DOCKER_GROUP_ID=${DOCKER_GROUP_ID:-9001}
/scripts/create_user.sh $DOCKER_USER $DOCKER_USER_ID $DOCKER_PASSWORD $DOCKER_GROUP $DOCKER_GROUP_ID

export HOME=/home/$DOCKER_USER # do NOT remove!!! Necessary for it to work.
mkdir -p $HOME/.config
if [[ ! -d $HOME/.config/xfce4 ]]; then
    mv /root/.config/xfce4 $HOME/.config/
    chown -R $DOCKER_USER:$DOCKER_GROUP $HOME/.config/
fi
if [[ ! -d $HOME/.config/terminator ]]; then
    mv /root/.config/terminator $HOME/.config/
    chown -R $DOCKER_USER:$DOCKER_GROUP $HOME/.config/
fi
/scripts/launch.sh
