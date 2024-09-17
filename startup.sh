#!/bin/bash
# Install necessary packages
apt-get update && apt-get install -y openssh-server sudo

# Set root password
echo "root:${SSH_PASSWORD}" | chpasswd

# Start SSH service
service ssh start

# Ensure systemd is set up correctly
if [[ "$OS_VERSION" == "ubuntu2004" || "$OS_VERSION" == "debian10" ]]; then
  apt-get install -y systemd systemd-sysv
  service systemd start
fi

# Keep container running
tail -f /dev/null
