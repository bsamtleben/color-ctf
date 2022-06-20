#!/usr/bin/env bash

TIMEZONE="GMT"

# Fix "Cannot change locale (en_US.UTF-8)"
echo "LC_ALL=en_US.UTF-8" >> /etc/environment
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen en_US.UTF-8

# Set timezone (needed for some programs like Apache)
ln -fs /usr/share/zoneinfo/$TIMEZONE /etc/localtime

# Keep everything up-to-date
apt-get update && apt-get upgrade -y && apt-get -y autoremove

# Install tools for convenience
apt-get install -y vim
