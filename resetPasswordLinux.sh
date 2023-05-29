#!/bin/bash

# Check if the script is being run as root
if [[ $(id -u) -ne 0 ]]; then
echo "This script must be run as root."
exit 1
fi

# Check if a username is provided as an argument
if [[ $# -ne 1 ]]; then
echo "Usage: $0 "
exit 1
fi

username=$1
password=$2

# Update the user's password
echo "$username:$password" | chpasswd

if [[ $? -eq 0 ]]; then
echo "Password updated successfully for user: $username"
else
echo "Failed to update password for user: $username"
fi