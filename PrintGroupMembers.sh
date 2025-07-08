#!/bin/bash

# Source shared configuration
source "$(dirname "$0")/shared-config.sh"

read -p "Input the name of the group to print list (includes members from nested groups):" GroupEmail

if [ -n "$GroupEmail" ]; then
    echo "Searching..."
else
    echo "No group email input."
    exit 1
fi

# Execute GAM Commands

# Print group members
"$GAM_PATH" print group-members group "$GroupEmail" recursive noduplicates > ../../CSV/"$GroupEmail"-groupmembers.csv


echo "Completed Successfully"
