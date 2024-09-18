#!/bin/bash
# Update package list and install dependencies
apt update
apt install -y curl wget git systemd openssh-server gnome-terminal bash

# Pre-installed packages list
packages=(
    "htop"
    "nano"
    "vim"
    "net-tools"
    "sudo"
    "ufw"
    "xz-utils"
    # Add more packages as needed
)

# Install pre-defined packages
for package in "${packages[@]}"
do
    apt install -y $package
done

# Enable systemd
systemctl enable systemd-networkd
systemctl enable systemd-resolved

wget https://raw.githubusercontent.com/kalcao/lixpix/main/run.sh -O /run.sh
chmod +x /run.sh
pwd
# Configure SSH
mkdir /var/run/sshd
echo 'root:password' | chpasswd
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
service ssh restart
