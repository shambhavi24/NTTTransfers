#!/bin/bash

username=$1
password=$2

# Update the user's password
echo "$username:$password" | chpasswd

if [[ $? -eq 0 ]]; then
echo "Password updated successfully for user: $username"
else
echo "Failed to update password for user: $username"
fi
exit 1