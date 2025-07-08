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

# Mailchimp API Configuration
export MAILCHIMP_API_KEY="${MAILCHIMP_API_KEY:-}"
export MAILCHIMP_SERVER_PREFIX="${MAILCHIMP_SERVER_PREFIX:-us1}"
export MAILCHIMP_LIST_ID="${MAILCHIMP_LIST_ID:-}"

# Source local secrets if available (gitignored)
LOCAL_SECRETS="$(dirname "$0")/local-secrets.sh"
if [[ -f "$LOCAL_SECRETS" ]]; then
    source "$LOCAL_SECRETS"
fi

# Mailchimp utility functions
check_mailchimp_config() {
    if [[ -z "$MAILCHIMP_API_KEY" ]]; then
        echo "ERROR: Mailchimp API key not configured"
        echo "Please create local-secrets.sh or set MAILCHIMP_API_KEY environment variable"
        echo "Example: cp local-secrets.example.sh local-secrets.sh"
        return 1
    fi
    
    if [[ -z "$MAILCHIMP_SERVER_PREFIX" ]]; then
        echo "ERROR: MAILCHIMP_SERVER_PREFIX not configured (e.g., us1, us2, etc.)"
        return 1
    fi
}

mailchimp_api_call() {
    local endpoint="$1"
    local method="${2:-GET}"
    local data="${3:-}"
    
    check_mailchimp_config || return 1
    
    local url="https://${MAILCHIMP_SERVER_PREFIX}.api.mailchimp.com/3.0${endpoint}"
    
    if [[ "$method" == "GET" ]]; then
        curl -s -X GET \
            -H "Authorization: apikey $MAILCHIMP_API_KEY" \
            "$url"
    else
        curl -s -X "$method" \
            -H "Authorization: apikey $MAILCHIMP_API_KEY" \
            -H "Content-Type: application/json" \
            -d "$data" \
            "$url"
    fi
}

# Function to add/update subscriber in Mailchimp
mailchimp_add_subscriber() {
    local email="$1"
    local first_name="${2:-}"
    local last_name="${3:-}"
    local status="${4:-subscribed}"
    
    validate_email "$email" || return 1
    check_mailchimp_config || return 1
    
    if [[ -z "$MAILCHIMP_LIST_ID" ]]; then
        echo "ERROR: MAILCHIMP_LIST_ID not configured"
        return 1
    fi
    
    local subscriber_hash
    subscriber_hash=$(echo -n "$email" | md5sum | cut -d' ' -f1)
    
    local json_data
    json_data=$(cat <<EOF
{
    "email_address": "$email",
    "status": "$status",
    "merge_fields": {
        "FNAME": "$first_name",
        "LNAME": "$last_name"
    }
}
EOF
)
    
    local result
    result=$(mailchimp_api_call "/lists/$MAILCHIMP_LIST_ID/members/$subscriber_hash" "PUT" "$json_data")
    
    if echo "$result" | grep -q '"status"'; then
        log_action "Mailchimp: Added/updated subscriber $email"
        echo "SUCCESS: Subscriber $email added/updated"
        return 0
    else
        log_action "Mailchimp ERROR: Failed to add subscriber $email - $result"
        echo "ERROR: Failed to add subscriber $email"
        echo "$result"
        return 1
    fi
}

# Function to remove subscriber from Mailchimp
mailchimp_remove_subscriber() {
    local email="$1"
    
    validate_email "$email" || return 1
    check_mailchimp_config || return 1
    
    if [[ -z "$MAILCHIMP_LIST_ID" ]]; then
        echo "ERROR: MAILCHIMP_LIST_ID not configured"
        return 1
    fi
    
    local subscriber_hash
    subscriber_hash=$(echo -n "$email" | md5sum | cut -d' ' -f1)
    
    local result
    result=$(mailchimp_api_call "/lists/$MAILCHIMP_LIST_ID/members/$subscriber_hash" "DELETE")
    
    if [[ -z "$result" ]] || echo "$result" | grep -q '"status":404'; then
        log_action "Mailchimp: Removed subscriber $email"
        echo "SUCCESS: Subscriber $email removed"
        return 0
    else
        log_action "Mailchimp ERROR: Failed to remove subscriber $email - $result"
        echo "ERROR: Failed to remove subscriber $email"
        echo "$result"
        return 1
    fi
}

# Ensure log directory exists
mkdir -p "$LOG_DIR" 2>/dev/null || true