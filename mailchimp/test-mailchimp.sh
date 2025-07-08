#!/bin/bash

# Test script to demonstrate Mailchimp integration
source shared-config.sh

echo "=== Mailchimp Configuration Test ==="
echo

# Test 1: Configuration validation
echo "1. Testing configuration..."
if check_mailchimp_config; then
    echo "✅ Configuration is valid!"
else
    echo "❌ Configuration failed!"
    exit 1
fi

echo

# Test 2: API connectivity
echo "2. Testing API connectivity..."
ping_result=$(mailchimp_api_call "/ping" "GET" 2>/dev/null)
if echo "$ping_result" | grep -q "Chimpy"; then
    echo "✅ API connection successful!"
    echo "Response: $ping_result"
else
    echo "❌ API connection failed!"
    echo "Response: $ping_result"
    exit 1
fi

echo

# Test 3: Get account info
echo "3. Testing account info..."
account_info=$(mailchimp_api_call "/account" "GET" 2>/dev/null)
if echo "$account_info" | grep -q "account_id"; then
    echo "✅ Account info retrieved successfully!"
    echo "Account ID: $(echo "$account_info" | grep -o '"account_id":"[^"]*' | cut -d'"' -f4)"
else
    echo "❌ Failed to get account info!"
    exit 1
fi

echo
echo "=== All tests passed! Mailchimp integration is working correctly. ==="