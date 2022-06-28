#!/usr/bin/env bash

# Refresh access and modification times for all files
# => prevent an attacker from simply looking up which files were changed most recently
# Note that this method is not 100% perfect since the "birth date" cannot be changed easily without messing with inodes (see debugfs for more info)
find /etc /home /opt /root /srv /usr /var -exec touch -a -m {} + 2>/dev/null

# Delete this shell script from /tmp
rm /tmp/vagrant-shell
