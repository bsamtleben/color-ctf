#!/usr/bin/env bash

TOKEN1='EMERALD{d1r3ct0ry_bust1ng_g03s_brrrrr}'
TOKEN2='EMERALD{setu1d_0n_wr0ng_b1n4ries_is_b4d}'

USERNAME=clemence

# This script performs the following steps:
#   0. Place the tokens
#   1. Install nginx and deploy static website containing unlisted directory with SSH key
#   2. Set the SETUID bit on /bin/chown for privilege escalation

# Create non-root user (without password)
useradd -m $USERNAME -s /bin/bash

# Put the first token in the user's home directory
HOME_DIR=/home/$USERNAME
echo "This one's for you: $TOKEN1" > $HOME_DIR/token
chown -R $USERNAME:$USERNAME $HOME_DIR
chmod 755 $HOME_DIR
chmod 644 $HOME_DIR/token

# Put the second token in root's home directory
echo "Here's a little secret for you: $TOKEN2" > /root/token

# Install nginx for static website
apt-get install -y nginx

# Deploy web contents
rm -r /var/www/html
cp -r $FILES_DIR/html /var/www/html
chown -R www-data:www-data /var/www/html

# Add public key to authorized_keys file
mkdir -p $HOME_DIR/.ssh
cat $FILES_DIR/html/drive/id_rsa.pub > $HOME_DIR/.ssh/authorized_keys
chown -R $USERNAME:$USERNAME $HOME_DIR/.ssh
chmod 700 $HOME_DIR/.ssh
chmod 600 $HOME_DIR/.ssh/authorized_keys

# Deploy nginx config
rm /etc/nginx/sites-available/default
cp $FILES_DIR/default /etc/nginx/sites-available/default

# Restart nginx
systemctl restart nginx

# Set SETUID for chown executable
chmod u+s /bin/chown
