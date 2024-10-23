#!/bin/bash

# Required packages: dialog
# Install with: sudo apt-get install dialog

# Import configurations
CONFIG_DIR="$(dirname "$0")/config"
source "${CONFIG_DIR}/ou_config.sh"
source "${CONFIG_DIR}/group_config.sh"

# Dialog dimensions
DIALOG_HEIGHT=20
DIALOG_WIDTH=70

# Color configuration
export DIALOGRC="${CONFIG_DIR}/dialog_theme"

# Function to check dependencies
check_dependencies() {
    if ! command -v dialog >/dev/null 2>&1; then
        echo "Error: dialog package is required but not installed."
        echo "Install it using: sudo apt-get install dialog"
        exit 1
    fi
}

# Function to create dialog theme
create_dialog_theme() {
    cat > "${CONFIG_DIR}/dialog_theme" << EOF
# Dialog theme
screen_color = (WHITE,BLUE,ON)
dialog_color = (BLACK,WHITE,OFF)
title_color = (BLUE,WHITE,ON)
border_color = (WHITE,WHITE,ON)
button_active_color = (WHITE,BLUE,ON)
button_inactive_color = (BLACK,WHITE,OFF)
button_key_active_color = (WHITE,BLUE,ON)
button_key_inactive_color = (RED,WHITE,OFF)
button_label_active_color = (WHITE,BLUE,ON)
button_label_inactive_color = (BLACK,WHITE,OFF)
inputbox_color = (BLACK,WHITE,OFF)
inputbox_border_color = (BLACK,WHITE,OFF)
searchbox_color = (BLACK,WHITE,OFF)
searchbox_title_color = (BLUE,WHITE,ON)
searchbox_border_color = (WHITE,WHITE,ON)
position_indicator_color = (BLUE,WHITE,ON)
menubox_color = (BLACK,WHITE,OFF)
menubox_border_color = (WHITE,WHITE,ON)
item_color = (BLACK,WHITE,OFF)
item_selected_color = (WHITE,BLUE,ON)
tag_color = (BLUE,WHITE,ON)
tag_selected_color = (WHITE,BLUE,ON)
tag_key_color = (RED,WHITE,OFF)
tag_key_selected_color = (RED,BLUE,ON)
check_color = (BLACK,WHITE,OFF)
check_selected_color = (WHITE,BLUE,ON)
uarrow_color = (GREEN,WHITE,ON)
darrow_color = (GREEN,WHITE,ON)
EOF
}

# Function to display main menu
show_main_menu() {
    local choice
    choice=$(dialog --clear --title "Google Workspace Management" \
                    --menu "Choose an operation:" $DIALOG_HEIGHT $DIALOG_WIDTH 7 \
                    1 "Update All Groups" \
                    2 "Manage Individual Class" \
                    3 "Update Graduation Year" \
                    4 "View Current Configuration" \
                    5 "Backup Configuration" \
                    6 "System Check" \
                    7 "Exit" \
                    2>&1 >/dev/tty)

    case $choice in
        1) update_all_groups ;;
        2) show_class_menu ;;
        3) update_grad_year ;;
        4) view_configuration ;;
        5) backup_config ;;
        6) system_check ;;
        7) exit 0 ;;
    esac
}

# Function to show class selection menu
show_class_menu() {
    local choice
    choice=$(dialog --clear --title "Class Management" \
                    --menu "Select a class to manage:" $DIALOG_HEIGHT $DIALOG_WIDTH 8 \
                    1 "Unicorn" \
                    2 "Grasshopper" \
                    3 "Stargazer" \
                    4 "Centaur" \
                    5 "Badger" \
                    6 "Middle School" \
                    7 "General Groups" \
                    8 "Back to Main Menu" \
                    2>&1 >/dev/tty)

    case $choice in
        1) manage_class "unicorn" ;;
        2) manage_class "grasshopper" ;;
        3) manage_class "stargazer" ;;
        4) manage_class "centaur" ;;
        5) manage_class "badger" ;;
        6) manage_class "ms" ;;
        7) manage_class "general" ;;
        8) return ;;
    esac
}

# Function to manage individual class
manage_class() {
    local class=$1
    local choice
    
    choice=$(dialog --clear --title "Manage ${class^}" \
                    --menu "Choose an operation:" $DIALOG_HEIGHT $DIALOG_WIDTH 4 \
                    1 "Update Groups" \
                    2 "View Configuration" \
                    3 "Edit Managers" \
                    4 "Back" \
                    2>&1 >/dev/tty)

    case $choice in
        1) 
            process_class "${class^}" "${GROUPS[$class]}" "${MANAGERS[$class]}" "${NOMAIL[$class]}"
            dialog --title "Success" --msgbox "Updated ${class^} groups successfully!" 8 40
            ;;
        2)
            dialog --title "${class^} Configuration" \
                   --textbox <(echo -e "Groups:\n${GROUPS[$class]}\n\nManagers:\n${MANAGERS[$class]}\n\nNomail:\n${NOMAIL[$class]}") \
                   $DIALOG_HEIGHT $DIALOG_WIDTH
            ;;
        3)
            edit_managers "$class"
            ;;
    esac
    manage_class "$class"
}

# Function to update graduation year
update_grad_year() {
    local new_year
    new_year=$(dialog --clear --title "Update Graduation Year" \
                      --inputbox "Enter the two-digit graduation year (e.g., 24):" \
                      8 40 \
                      2>&1 >/dev/tty)

    if [[ $new_year =~ ^[0-9]{2}$ ]]; then
        calculate_years "$new_year"
        dialog --title "Success" --msgbox "Graduation year updated to 20$new_year!" 8 40
    else
        dialog --title "Error" --msgbox "Invalid year format. Please enter two digits." 8 40
    fi
}

# Function to view current configuration
view_configuration() {
    local temp_file=$(mktemp)
    {
        echo "Current Configuration"
        echo "===================="
        echo
        echo "Graduation Years:"
        for year in "${!YEARS[@]}"; do
            echo "$year: 20${YEARS[$year]}"
        done
        echo
        echo "Organization Units:"
        for ou in "${!OU[@]}"; do
            echo "$ou: ${OU[$ou]}"
        done
    } > "$temp_file"

    dialog --title "Current Configuration" \
           --textbox "$temp_file" \
           $DIALOG_HEIGHT $DIALOG_WIDTH

    rm "$temp_file"
}

# Function to backup configuration
backup_config() {
    local backup_dir="backups/$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$backup_dir"
    
    cp "${CONFIG_DIR}/ou_config.sh" "$backup_dir/"
    cp "${CONFIG_DIR}/group_config.sh" "$backup_dir/"

    dialog --title "Backup Complete" \
           --msgbox "Configuration backed up to:\n$backup_dir" \
           8 40
}

# Function to perform system check
system_check() {
    local temp_file=$(mktemp)
    {
        echo "System Check Results"
        echo "==================="
        echo
        echo "GAM Installation: $(which gam || echo 'NOT FOUND')"
        echo "Dialog Version: $(dialog --version)"
        echo "Configuration Files:"
        echo "  OU Config: $([ -f "${CONFIG_DIR}/ou_config.sh" ] && echo 'Present' || echo 'Missing')"
        echo "  Group Config: $([ -f "${CONFIG_DIR}/group_config.sh" ] && echo 'Present' || echo 'Missing')"
        echo
        echo "Connectivity Test:"
        echo "  Google API: $(ping -c 1 www.googleapis.com >/dev/null && echo 'OK' || echo 'Failed')"
    } > "$temp_file"

    dialog --title "System Check" \
           --textbox "$temp_file" \
           $DIALOG_HEIGHT $DIALOG_WIDTH

    rm "$temp_file"
}

# Function to edit managers
edit_managers() {
    local class=$1
    local choice
    local temp_file=$(mktemp)
    
    echo "${MANAGERS[$class]}" > "$temp_file"
    
    dialog --title "Edit Managers" \
           --editbox "$temp_file" \
           $DIALOG_HEIGHT $DIALOG_WIDTH \
           2> "$temp_file"

    if [ $? -eq 0 ]; then
        MANAGERS[$class]=$(cat "$temp_file")
        dialog --title "Success" --msgbox "Managers updated successfully!" 8 40
    fi
    
    rm "$temp_file"
}

# Main execution
main() {
    check_dependencies
    create_dialog_theme
    calculate_years 24  # Default year

    while true; do
        show_main_menu
    done
}

# Trap cleanup
trap 'clear' EXIT

# Run main program
main
