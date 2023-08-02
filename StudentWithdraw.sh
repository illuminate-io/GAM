#!/bin/sh

read -p "Input the user email of withdrawn student:" UserEmail

if [ -n $UserEmail ]; then
    echo "Removing [$UserEmail] from all groups, suspending user, and placing in 'Withdrawn Students' OU"
else
    echo "No user email input."
    exit 1
fi

# Execute GAM Commands

# remove from groups
/home/isaac/bin/gamadv-xtd3/gam user $UserEmail delete groups

# remove from OU and place in Suspended OU
/home/isaac/bin/gamadv-xtd3/gam update org '/Users/Suspended-Users/Withdrawn Students' add users $UserEmail

# Suspend account
/home/isaac/bin/gamadv-xtd3/gam update user $UserEmail suspended on


echo "Completed Successfully. Getting updated user info"

# Wait for 10 seconds to give GAM time to update user info
sleep 10

/home/isaac/bin/gamadv-xtd3/gam info user $UserEmail
