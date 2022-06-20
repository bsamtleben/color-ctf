#!/usr/bin/env bash

HOME_DIR="/home/$USERNAME"

# Update everything
export DEBIAN_FRONTEND=noninteractive
# Hold grub-pc package to prevent issues with non-interactive upgrade
echo "grub-pc hold" | sudo dpkg --set-selections
apt-get update && apt-get -y dist-upgrade && apt-get -y autoremove

# Set correct keyboard layout
KEYBOARD_FILE=/etc/default/keyboard
sed -ie '/^XKBMODEL=/s/".*"/"'$XKBMODEL'"/' $KEYBOARD_FILE
sed -ie '/^XKBLAYOUT=/s/".*"/"'$XKBLAYOUT'"/' $KEYBOARD_FILE
sed -ie '/^XKBVARIANT=/s/".*"/"'$XKBVARIANT'"/' $KEYBOARD_FILE
udevadm trigger --subsystem-match=input --action=change

# Set time zone
timedatectl set-timezone $TIMEZONE

# Create new user with sudo privileges
useradd -m "$USERNAME" -s /usr/bin/zsh
echo "$USERNAME:$PASSWORD" | chpasswd
usermod -a -G sudo "$USERNAME"
chown -R "$USERNAME":"$USERNAME" "$HOME_DIR"

# ZSH configuration
cat <<EOF > "$HOME_DIR/.zshrc-custom"
# Some ls aliases
alias ll='ls -lah'
alias la='ls -lah'
alias l='ll'
EOF

# Include custom zshrc
echo 'source ~/.zshrc-custom' >> "$HOME_DIR/.zshrc"

# Disable display timeout
PERCHANNEL_DIR=/home/$USERNAME/.config/xfce4/xfconf/xfce-perchannel-xml
mkdir -p $PERCHANNEL_DIR
cat <<EOF > $PERCHANNEL_DIR/xfce4-power-manager.xml
<?xml version="1.0" encoding="UTF-8"?>

<channel name="xfce4-power-manager" version="1.0">
  <property name="xfce4-power-manager" type="empty">
    <property name="power-button-action" type="empty"/>
    <property name="show-panel-label" type="empty"/>
    <property name="show-tray-icon" type="bool" value="false"/>
    <property name="lock-screen-suspend-hibernate" type="bool" value="false"/>
    <property name="logind-handle-lid-switch" type="bool" value="false"/>
    <property name="dpms-enabled" type="bool" value="true"/>
    <property name="blank-on-ac" type="int" value="0"/>
    <property name="dpms-on-ac-sleep" type="uint" value="0"/>
    <property name="dpms-on-ac-off" type="uint" value="0"/>
  </property>
</channel>
EOF

# Transfer file ownership
chown -R "$USERNAME":"$USERNAME" "$HOME_DIR"

reboot
