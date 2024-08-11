#!/bin/bash

gam=/home/isaac/bin/gamadv-xtd3/gam

source config.sh

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

# Print class years for verification
for grade in "${!CLASS_YEARS[@]}"; do
    echo "Class year for $grade: 20${CLASS_YEARS[$grade]}"
done

read -n 1 -s -r -p "Press any key to continue..."

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
    # Add other OUs as necessary
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
    ["UNIGROUPS"]=("family-unicorn@santafeschool.org" "family-${CLASS_YEARS[PK1]}@santafeschool.org" "family-${CLASS_YEARS[PK2]}@santafeschool.org")
    ["GRASSGROUPS"]=("family-grasshopper@santafeschool.org" "family-${CLASS_YEARS[K]}@santafeschool.org")
    ["STARGROUPS"]=("family-stargazer@santafeschool.org" "family-first@santafeschool.org" "family-second@santafeschool.org" "family-${CLASS_YEARS[STAR1]}@santafeschool.org" "family-${CLASS_YEARS[STAR2]}@santafeschool.org")
    # Add other groups similarly
)

# Function to sync managers to CSV and update group
sync_managers() {
    local group=$1
    local managers=$2
    local nomail_managers=$3

    echo "Updating group: $group"
    $gam update group $group clear manager
    $gam ous_and_children "$managers" print primaryEmail | $gam csv - $gam update group "$group" add manager ~primaryEmail
    $gam ous_and_children "$nomail_managers" print primaryEmail | $gam csv - $gam update group "$group" add manager nomail user ~primaryEmail
}

# Update each group
for group_type in "${!GROUPS[@]}"; do
    for group in "${GROUPS[$group_type]}"; do
        sync_managers "$group" "${MANAGERS[$group_type]}" "${NOMAIL_MANAGERS[$group_type]}"
    done
done

echo "Complete"
