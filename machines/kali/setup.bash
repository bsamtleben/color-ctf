#!/bin/bash

HOME_DIR="/home/$USERNAME"
DESKTOP_DIR="$HOME_DIR/Desktop"

# Update everything
export DEBIAN_FRONTEND=noninteractive
# Hold grub-pc package to prevent issues with non-interactive upgrade
echo "grub-pc hold" | sudo dpkg --set-selections
apt-get update && apt-get -y dist-upgrade && apt-get -y autoremove

# Set correct keyboard layout
setxkbmap -model $XKBMODEL -layout $XKBLAYOUT -variant $XKBVARIANT

# Set time zone
timedatectl set-timezone $TIMEZONE

# Create new user with sudo privileges
useradd -m "$USERNAME" -s /usr/bin/zsh
echo "$USERNAME:$PASSWORD" | chpasswd
usermod -a -G sudo "$USERNAME"
chown -R "$USERNAME":"$USERNAME" "$HOME_DIR"

# ZSH configuration
cat > "$HOME_DIR/.zshrc-custom" <<- EOF
# Some ls aliases
alias ll='ls -lah'
alias la='ls -lah'
alias l='ll'
EOF

# Include custom zshrc
echo 'source ~/.zshrc-custom' >> "$HOME_DIR/.zshrc"

# Transfer file ownership
chown -R "$USERNAME":"$USERNAME" "$HOME_DIR"

reboot
