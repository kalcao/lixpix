#!/bin/bash

# Select the OS version based on the environment variable
case $OS_VERSION in
    "ubuntu:20.04")
        image="ubuntu:20.04"
        ;;
    "debian:10")
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

# Ensure SSH service is running
service ssh start

# Run the selected OS
exec /sbin/init
