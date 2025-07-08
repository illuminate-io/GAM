#!/bin/bash

# Local Secrets Configuration Template
# Copy this file to local-secrets.sh and fill in your actual values
# DO NOT commit local-secrets.sh to git - it's automatically ignored

# Mailchimp API Configuration
# Get your API key from: https://mailchimp.com/help/about-api-keys/
export MAILCHIMP_API_KEY="your-mailchimp-api-key-here"

# Your Mailchimp server prefix (found in your API key after the dash)
# Example: If your API key ends with "-us1", then your prefix is "us1"
export MAILCHIMP_SERVER_PREFIX="us1"

# Your Mailchimp list ID (found in your audience settings)
# Example: "a1b2c3d4e5"
export MAILCHIMP_LIST_ID="your-mailchimp-list-id-here"

# Optional: Other API configurations can be added here
# export OTHER_API_KEY="your-other-api-key"

# Note: After copying this file to local-secrets.sh, you can test the configuration with:
# source shared-config.sh && check_mailchimp_config