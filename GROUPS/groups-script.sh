#!/bin/bash

# Source the config file
source config.sh

# Source shared configuration
source "$(dirname "$0")/../shared-config.sh"

# Color codes for prettifying output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No color

# Calculate class years based on graduation year
declare -A CLASS_YEARS=(
    ["PK1"]=$((gradyear + 10))
    ["PK2"]=$((gradyear + 9))
    ["K"]=$((gradyear + 8))
    ["STAR1"]=$((gradyear + 7))
    ["STAR2"]=$((gradyear + 6))
    ["CENT3"]=$((gradyear + 5))
    ["CENT4"]=$((gradyear + 4))
    ["BADG5"]=$((gradyear + 3))
    ["BADG6"]=$((gradyear + 2))
    ["MS7"]=$((gradyear + 1))
    ["MS8"]=$gradyear
)

# Organizational Units
declare -A OUs=(
    ["UNION"]="Users/Staff/Teachers/Unicorn"
    ["GRASSHOPPER"]="Users/Staff/Teachers/Grasshopper"
    ["STARGAZER"]="Users/Staff/Teachers/Stargazer"
    ["CENTAUR"]="Users/Staff/Teachers/Centaur"
    ["BADGER"]="Users/Staff/Teachers/Badger"
    ["MS"]="Users/Staff/Teachers/MS"
    ["ADMIN"]="Users/Staff/Admin"
    ["SHARED"]="Users/Staff/SharedAccounts"
)

# Manager groups
declare -A MANAGERS=(
    ["UNI"]="'${OUs[ADMIN]}','${OUs[UNION]}'"
    ["GRASS"]="'${OUs[ADMIN]}','${OUs[GRASSHOPPER]}'"
    ["STAR"]="'${OUs[ADMIN]}','${OUs[STARGAZER]}'"
    ["CENT"]="'${OUs[ADMIN]}','${OUs[CENTAUR]}'"
    ["BADG"]="'${OUs[ADMIN]}','${OUs[BADGER]}'"
    ["MS"]="'${OUs[ADMIN]}','${OUs[SHARED]}','${OUs[MS]}'"
    ["ALL"]="'${OUs[ADMIN]}','${OUs[SHARED]}'"
)

# Nomail Managers
declare -A NOMAIL_MANAGERS=(
    ["UNI"]="'${OUs[SHARED]}'"
    ["GRASS"]="'${OUs[SHARED]}'"
    ["STAR"]="'${OUs[SHARED]}'"
    ["CENT"]="'${OUs[SHARED]}'"
    ["BADG"]="'${OUs[SHARED]}'"
    ["MS"]="'${OUs[SHARED]}'"
    ["ALL"]="'${OUs[SHARED]}'"
)

# Groups to update
declare -A GROUPS=(
    ["UNI"]=("family-unicorn@santafeschool.org" "family-${CLASS_YEARS[PK1]}@santafeschool.org" "family-${CLASS_YEARS[PK2]}@santafeschool.org")
    ["GRASS"]=("family-grasshopper@santafeschool.org" "family-${CLASS_YEARS[K]}@santafeschool.org")
    ["STAR"]=("family-stargazer@santafeschool.org" "family-first@santafeschool.org" "family-second@santafeschool.org" "family-${CLASS_YEARS[STAR1]}@santafeschool.org" "family-${CLASS_YEARS[STAR2]}@santafeschool.org")
    # Add other groups similarly
)

# Function to sync managers to CSV and update group
sync_managers() {
    local group=$1
    local managers=$2
    local nomail_managers=$3

    echo -e "${BLUE}Updating group: $group${NC}"
    "$GAM_PATH" update group "$group" clear manager
    "$GAM_PATH" ous_and_children "$managers" print primaryEmail | "$GAM_PATH" csv - "$GAM_PATH" update group "$group" add manager ~primaryEmail
    "$GAM_PATH" ous_and_children "$nomail_managers" print primaryEmail | "$GAM_PATH" csv - "$GAM_PATH" update group "$group" add manager nomail user ~primaryEmail
}

# Option-based menu
show_menu() {
    echo -e "${YELLOW}Choose an option:${NC}"
    echo "1) Show Class Years"
    echo "2) Sync Manager Groups"
    echo "3) Sync All Groups"
    echo "4) Exit"
}

# Function to show class years
show_class_years() {
    echo -e "${GREEN}Class Years:${NC}"
    for grade in "${!CLASS_YEARS[@]}"; do
        echo -e "${BLUE}Class year for $grade:${NC} 20${CLASS_YEARS[$grade]}"
    done
}

# Function to sync a specific manager group
sync_specific_group() {
    echo -e "${YELLOW}Available Groups to Sync:${NC}"
    for group_type in "${!GROUPS[@]}"; do
        echo "$group_type"
    done

    read -p "Enter group type to sync: " group_type
    if [[ -v GROUPS[$group_type] ]]; then
        for group in "${GROUPS[$group_type]}"; do
            sync_managers "$group" "${MANAGERS[$group_type]}" "${NOMAIL_MANAGERS[$group_type]}"
        done
    else
        echo -e "${RED}Invalid group type selected.${NC}"
    fi
}

# Sync all groups function
sync_all_groups() {
    for group_type in "${!GROUPS[@]}"; do
        echo -e "${GREEN}Syncing all groups of type $group_type...${NC}"
        for group in "${GROUPS[$group_type]}"; do
            sync_managers "$group" "${MANAGERS[$group_type]}" "${NOMAIL_MANAGERS[$group_type]}"
        done
    done
    echo -e "${GREEN}All groups synced successfully!${NC}"
}

# Main loop
while true; do
    show_menu
    read -p "Enter your choice: " choice

    case $choice in
        1)
            show_class_years
            ;;
        2)
            sync_specific_group
            ;;
        3)
            sync_all_groups
            ;;
        4)
            echo -e "${GREEN}Goodbye!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option. Please try again.${NC}"
            ;;
    esac
    read -n 1 -s -r -p "Press any key to continue..."
done
