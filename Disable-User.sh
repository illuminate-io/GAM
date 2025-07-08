#!/bin/bash

# Source shared configuration
source "$(dirname "$0")/shared-config.sh"


read -p "Input the user email of account to disable:" UserEmail

if [ -n "$UserEmail" ]; then
    echo "Removing [$UserEmail] from all groups, suspending user, and placing in 'Suspended' OU"
else
    echo "No user email input."
    exit 1
fi

# Execute GAM Commands

# remove from groups
"$GAM_PATH" user "$UserEmail" delete groups

# remove from OU and place in Suspended OU

while true; do
    read -p "Is this a Student (y/n)? " yn
    case $yn in
        [Yy]* ) 
        "$GAM_PATH" update org "$SUSPENDED_STUDENTS_OU" add users "$UserEmail"; break;;
        [Nn]* )
        "$GAM_PATH" update org "$SUSPENDED_STAFF_OU" add users "$UserEmail"; break;;
        * ) echo "Please answer y or n";;
    esac
done


# Suspend account
"$GAM_PATH" update user "$UserEmail" suspended on


echo "Completed Successfully. Getting updated user info"

# Wait for 10 seconds to give GAM time to update user info
sleep 10

"$GAM_PATH" info user "$UserEmail"

