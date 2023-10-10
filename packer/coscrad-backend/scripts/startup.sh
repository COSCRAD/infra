set -u

# set pm2 to run as a service with systemd
sudo env PATH=$PATH:/home/$LINUX_USER/.nvm/versions/node/v18.12.0/bin /home/$LINUX_USER/.nvm/versions/node/v18.12.0/lib/node_modules/pm2/bin/pm2 startup systemd -u $LINUX_USER --hp /home/$LINUX_USER

# start the app
pm2 start /home/coscradmin/apps/index.js --name backend

# save the pm2 process list so app will restart on reboot
pm2 save