#!/usr/bin/env bash

TOKEN1='CANTALOUPE{}'
TOKEN2='CANTALOUPE{}'

USERNAME=cantaloupe

# This script performs the following steps:
#   0. Place the tokens
#   1. Set up FTP server (vsftpd)

# Create non-root user (without password)
useradd -m $USERNAME -s /bin/bash

# Put the first token in the user's home directory
HOME_DIR=/home/$USERNAME
echo "Wait... is this a... TOKEN?! $TOKEN1" > $HOME_DIR/token
chown -R $USERNAME:$USERNAME $HOME_DIR
chmod 755 $HOME_DIR
chmod 644 $HOME_DIR/token

# Put the second token in root's home directory
echo "Well done, my friend: $TOKEN2" > /root/token

# Install vsftpd and copy configuration file
apt-get -y install vsftpd
cp $FILES_DIR/ftp/vsftpd.conf /etc/vsftpd.conf

# Create FTP data directory and copy files
mkdir -p /var/ftp
cp -r $FILES_DIR/ftp/public /var/ftp/public
chown -R nobody:nogroup /var/ftp/public

# Enable and start vsftpd service
systemctl start vsftpd
systemctl enable vsftpd
