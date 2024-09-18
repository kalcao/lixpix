#!/bin/bash
# Install necessary packages
apt-get update && apt-get install -y openssh-server sudo

# Set root password
echo "root:${SSH_PASSWORD}" | chpasswd
case $OS_VERSION in
    "ubuntu2004")
        image="ubuntu:20.04"
        ;;
    "debian10")
        image="debian:10"
        ;;
    "alpine")
        image="alpine"
        ;;
    *)
        echo "Unsupported OS version. Exiting..."
        exit 1
        ;;
esac
if [[ "$OS_VERSION" == "ubuntu2004" || "$OS_VERSION" == "debian10" ]]; then
  apt-get install -y systemd systemd-sysv
  service systemd start
fi

# Ensure SSH service is running
service ssh start

# Run the selected OS
exec /sbin/init

tail -f /dev/null
