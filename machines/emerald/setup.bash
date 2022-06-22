#!/usr/bin/env bash

TOKEN1='EMERALD{}'
TOKEN2='EMERALD{}'

# This script performs the following steps:
#   0. Place the tokens

# Create non-root user (without password since the user won't need to login)
useradd -m "emerald" -s /bin/bash

# Put the first token in the user's home directory
HOME_DIR=/home/emerald/
echo "This one's for you: $TOKEN1" > $HOME_DIR/token
chown -R aqua:aqua $HOME_DIR
chmod 755 $HOME_DIR
chmod 644 $HOME_DIR/token

# Put the second token in root's home directory
echo "Here's a little secret for you: $TOKEN2" > /root/token

