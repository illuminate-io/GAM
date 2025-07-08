#!/bin/bash

# Source shared configuration
source "$(dirname "$0")/../shared-config.sh"

"$GAM_PATH" csv suspend-students.csv "$GAM_PATH" update user ~email ou "$SUSPENDED_STUDENTS_OU"
"$GAM_PATH" csv suspend-students.csv "$GAM_PATH" user ~email delete groups
"$GAM_PATH" csv suspend-students.csv "$GAM_PATH" update user ~email suspended on

echo "Completed Successfully."

read -p "Press any key to continue..." -n 1 -r