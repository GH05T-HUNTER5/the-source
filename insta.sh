#!/bin/bash

# Path to the file containing the list of names
read -p "Enter your Instagram username: " pss
read -p "Enter the path to your password list file: " names_file

# Check if the file exists
if [ ! -f "$names_file" ]; then
  echo "File not found: $names_file"
  exit 1
fi

# Read the names one by one and display them
while read -r name; do
  echo "Username : $pss Password : $name"
  sleep 1
done < "$names_file"
echo "Login successfully, your password is : mypassword#admin"
