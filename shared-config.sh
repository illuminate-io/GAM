#!/bin/bash

# GAM Scripts Shared Configuration
# Source this file in your scripts with: source shared-config.sh

# GAM Binary Path
export GAM_PATH="/home/isaac/bin/gamadv-xtd3/gam7/gam"

# Domain Configuration
export DOMAIN="santafeschool.org"

# Organizational Unit Base Paths
export OU_BASE="Users"
export SUSPENDED_STUDENTS_OU="Users/Suspended Users/Withdrawn Students"
export SUSPENDED_STAFF_OU="Users/Suspended Users/Archive Staff"

# Student OU Paths
export STUDENT_OU_BASE="Users/Students"
export CENTAUR_3RD_OU="Users/Students/Centaur/3rdGrade"
export CENTAUR_4TH_OU="Users/Students/Centaur/4thGrade"
export BADGER_5TH_OU="Users/Students/Badger/5thGrade"
export BADGER_6TH_OU="Users/Students/Badger/6thGrade"
export MS_7TH_OU="Users/Students/MS/7thGrade"
export MS_8TH_OU="Users/Students/MS/8thGrade"

# Student Groups
export STUDENT_THIRD_GROUP="student-third@santafeschool.org"
export STUDENT_FOURTH_GROUP="student-fourth@santafeschool.org"
export STUDENT_FIFTH_GROUP="student-fifth@santafeschool.org"
export STUDENT_SIXTH_GROUP="student-sixth@santafeschool.org"
export STUDENT_SEVENTH_GROUP="student-seventh@santafeschool.org"
export STUDENT_EIGHTH_GROUP="student-eighth@santafeschool.org"

# Logging Configuration
export LOG_DIR="/var/log/gam-admin"
export LOG_FILE="$LOG_DIR/gam-admin-$(date +%Y%m%d).log"

# Utility Functions
log_action() {
    local action="$1"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "$timestamp - $USER - $action" >> "$LOG_FILE"
}

run_gam_safe() {
    local action_desc="$1"
    shift
    if "$GAM_PATH" "$@"; then
        log_action "SUCCESS: $action_desc"
        return 0
    else
        log_action "ERROR: $action_desc - Command failed: $*"
        return 1
    fi
}

validate_email() {
    local email="$1"
    if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        return 0
    else
        echo "Invalid email format: $email"
        return 1
    fi
}

# Ensure log directory exists
mkdir -p "$LOG_DIR" 2>/dev/null || true