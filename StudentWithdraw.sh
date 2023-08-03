#!/bin/bash

gam=/home/isaac/bin/gamadv-xtd3/gam


read -p "Input the user email of account to disable:" UserEmail

if [ -n $UserEmail ]; then
    echo "Removing [$UserEmail] from all groups, suspending user, and placing in 'Suspended' OU"
else
    echo "No user email input."
    exit 1
fi

# Execute GAM Commands

# remove from groups
$gam user $UserEmail delete groups

# remove from OU and place in Suspended OU

while true; do
    read -p "Student (y/n)? " yn
    case $yn in
        [Yy]* ) 
        $gam update org '/Users/Suspended-Users/Withdrawn Students' add users $UserEmail; break;;
        [Nn]* )
        $gam update org '/Users/Suspended-Users/Archive Staff' add users $UserEmail; break;;
        * ) echo "Please answer y or n";;
    esac
done


# Suspend account
$gam update user $UserEmail suspended on


echo "Completed Successfully. Getting updated user info"

# Wait for 10 seconds to give GAM time to update user info
sleep 10

$gam info user $UserEmail

