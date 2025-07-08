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

# Source local secrets if available (gitignored)
# Try multiple locations for local-secrets.sh
LOCAL_SECRETS_LOCATIONS=(
    "$(dirname "$0")/local-secrets.sh"              # Same directory as the calling script
    "$(dirname "${BASH_SOURCE[0]}")/local-secrets.sh"  # Same directory as shared-config.sh
    "./local-secrets.sh"                             # Current working directory
    "../local-secrets.sh"                           # Parent directory (for subdirectories)
)

for LOCAL_SECRETS in "${LOCAL_SECRETS_LOCATIONS[@]}"; do
    if [[ -f "$LOCAL_SECRETS" ]]; then
        source "$LOCAL_SECRETS"
        break
    fi
done

# Mailchimp API Configuration (with fallback defaults)
export MAILCHIMP_API_KEY="${MAILCHIMP_API_KEY:-}"
export MAILCHIMP_SERVER_PREFIX="${MAILCHIMP_SERVER_PREFIX:-us1}"
export MAILCHIMP_LIST_ID="${MAILCHIMP_LIST_ID:-}"

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

# Function to get all tags/interests from the audience
mailchimp_get_tags() {
    check_mailchimp_config || return 1
    
    if [[ -z "$MAILCHIMP_LIST_ID" ]]; then
        echo "ERROR: MAILCHIMP_LIST_ID not configured"
        return 1
    fi
    
    local result
    result=$(mailchimp_api_call "/lists/$MAILCHIMP_LIST_ID/interest-categories" "GET")
    
    if echo "$result" | grep -q '"categories"'; then
        echo "$result"
        return 0
    else
        log_action "Mailchimp ERROR: Failed to get tags - $result"
        echo "ERROR: Failed to get tags"
        echo "$result"
        return 1
    fi
}

# Function to get specific interests within a category
mailchimp_get_interests() {
    local category_id="$1"
    
    check_mailchimp_config || return 1
    
    if [[ -z "$MAILCHIMP_LIST_ID" ]]; then
        echo "ERROR: MAILCHIMP_LIST_ID not configured"
        return 1
    fi
    
    if [[ -z "$category_id" ]]; then
        echo "ERROR: Category ID required"
        return 1
    fi
    
    local result
    result=$(mailchimp_api_call "/lists/$MAILCHIMP_LIST_ID/interest-categories/$category_id/interests" "GET")
    
    if echo "$result" | grep -q '"interests"'; then
        echo "$result"
        return 0
    else
        log_action "Mailchimp ERROR: Failed to get interests for category $category_id - $result"
        echo "ERROR: Failed to get interests"
        echo "$result"
        return 1
    fi
}

# Function to get actual tags using the tag-search endpoint
mailchimp_get_tags() {
    local tag_name="${1:-}"  # Optional: search for specific tag name
    
    check_mailchimp_config || return 1
    
    if [[ -z "$MAILCHIMP_LIST_ID" ]]; then
        echo "ERROR: MAILCHIMP_LIST_ID not configured"
        return 1
    fi
    
    local endpoint="/lists/$MAILCHIMP_LIST_ID/tag-search"
    if [[ -n "$tag_name" ]]; then
        endpoint="${endpoint}?name=${tag_name}"
    fi
    
    local result
    result=$(mailchimp_api_call "$endpoint" "GET")
    
    if echo "$result" | grep -q '"tags"'; then
        echo "$result"
        return 0
    else
        log_action "Mailchimp ERROR: Failed to get tags - $result"
        echo "ERROR: Failed to get tags"
        echo "$result"
        return 1
    fi
}

# Function to list all tags in a readable format
mailchimp_list_tags() {
    local search_name="${1:-}"  # Optional: search for specific tag
    local result
    result=$(mailchimp_get_tags "$search_name")
    
    if [[ $? -eq 0 ]]; then
        echo "=== Mailchimp Tags ==="
        
        if echo "$result" | grep -q '"tags"'; then
            local tag_count
            tag_count=$(echo "$result" | grep -o '"name":"[^"]*' | wc -l)
            
            if [[ $tag_count -gt 0 ]]; then
                echo "Found $tag_count tags:"
                echo "$result" | grep -o '"name":"[^"]*' | cut -d'"' -f4 | nl
            else
                echo "No tags found"
            fi
        else
            echo "No tags found or unexpected response format"
        fi
        
        echo
        echo "Raw JSON for details:"
        echo "$result" | python3 -m json.tool 2>/dev/null || echo "$result"
        return 0
    else
        echo "Failed to retrieve tags"
        return 1
    fi
}

# Function to get segments (the previous "tags" functionality)
mailchimp_get_segments() {
    check_mailchimp_config || return 1
    
    if [[ -z "$MAILCHIMP_LIST_ID" ]]; then
        echo "ERROR: MAILCHIMP_LIST_ID not configured"
        return 1
    fi
    
    local result
    result=$(mailchimp_api_call "/lists/$MAILCHIMP_LIST_ID/segments" "GET")
    
    if echo "$result" | grep -q '"segments"'; then
        echo "$result"
        return 0
    else
        log_action "Mailchimp ERROR: Failed to get segments - $result"
        echo "ERROR: Failed to get segments"
        echo "$result"
        return 1
    fi
}

# Function to list segments in a readable format
mailchimp_list_segments() {
    local result
    result=$(mailchimp_get_segments)
    
    if [[ $? -eq 0 ]]; then
        echo "=== Mailchimp Segments ==="
        echo "Found segments (tag-like groups):"
        echo "$result" | grep -o '"name":"[^"]*' | cut -d'"' -f4 | nl
        
        echo
        echo "Raw JSON for details:"
        echo "$result" | python3 -m json.tool 2>/dev/null || echo "$result"
        return 0
    else
        echo "Failed to retrieve segments"
        return 1
    fi
}

# Function to get interest groups (the original function renamed for clarity)
mailchimp_get_interest_categories() {
    check_mailchimp_config || return 1
    
    if [[ -z "$MAILCHIMP_LIST_ID" ]]; then
        echo "ERROR: MAILCHIMP_LIST_ID not configured"
        return 1
    fi
    
    local result
    result=$(mailchimp_api_call "/lists/$MAILCHIMP_LIST_ID/interest-categories" "GET")
    
    if echo "$result" | grep -q '"categories"'; then
        echo "$result"
        return 0
    else
        log_action "Mailchimp ERROR: Failed to get interest categories - $result"
        echo "ERROR: Failed to get interest categories"
        echo "$result"
        return 1
    fi
}

# Function to get interest groups in a simplified format  
mailchimp_list_groups() {
    local result
    result=$(mailchimp_get_interest_categories)
    
    if [[ $? -eq 0 ]]; then
        echo "=== Mailchimp Interest Categories (Groups) ==="
        
        # Extract category info
        local categories
        categories=$(echo "$result" | grep -o '"id":"[^"]*","title":"[^"]*' | while read -r line; do
            local id=$(echo "$line" | grep -o '"id":"[^"]*' | cut -d'"' -f4)
            local title=$(echo "$line" | grep -o '"title":"[^"]*' | cut -d'"' -f4)
            echo "$id|$title"
        done)
        
        local count=1
        while IFS='|' read -r category_id category_title; do
            if [[ -n "$category_id" ]]; then
                echo "$count. $category_title (ID: $category_id)"
                
                # Get interests for this category
                local interests_result
                interests_result=$(mailchimp_get_interests "$category_id" 2>/dev/null)
                
                if [[ $? -eq 0 ]]; then
                    echo "$interests_result" | grep -o '"name":"[^"]*' | cut -d'"' -f4 | sed 's/^/   - /'
                else
                    echo "   - (No interests found)"
                fi
                echo
                ((count++))
            fi
        done <<< "$categories"
        
        return 0
    else
        echo "Failed to retrieve interest groups"
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