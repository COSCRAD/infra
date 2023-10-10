#!/bin/bash
set -u
# TODO Patch the server and install os level requirements (this was done when building the base image but is now stale)

HOME_DIR="/home/$LINUX_USER"

APP_DIR="$HOME_DIR/apps"

# copy the build to the target directory 
echo "moving the build"
chown $LINUX_USER:$LINUX_USER /tmp/index.js
su - $LINUX_USER -c "mkdir $APP_DIR"
su - $LINUX_USER -c "mv /tmp/index.js $APP_DIR"

# copy the pm2 startup script to the target directory
chown $LINUX_USER:$LINUX_USER /tmp/startup.sh
su - $LINUX_USER -c "mv /tmp/startup.sh $HOME_DIR"