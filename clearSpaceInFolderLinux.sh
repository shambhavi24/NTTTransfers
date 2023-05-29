#!/bin/bash

folder_path=$1

# Check if the folder exists
if [ -d "$folder_path" ]; then
# Delete all files in the folder
rm -f "$folder_path"/*

# Delete all subfolders in the folder
rm -rf "$folder_path"/*/

echo "Contents deleted successfully."
else
echo "Folder does not exist."
fi