#!/bin/bash

gam=/home/isaac/bin/gamadv-xtd3/gam

read -p "Input the name of the group to print list (includes members from nested groups):" GroupEmail

if [ -n $GroupEmail ]; then
    echo "Searching..."
else
    echo "No group email input."
    exit 1
fi

# Execute GAM Commands

# remove from groups
$gam print group-members group $GroupEmail recursive noduplicates > ../../CSV/$GroupEmail-groupmembers.csv


echo "Completed Successfully"
