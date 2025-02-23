#!/bin/bash

# Get battery percentage from sysfs or upower
if command -v upower &>/dev/null; then
    BATTERY_INFO=$(upower -i $(upower -e | grep 'battery') | grep -E "percentage" | awk '{print $2}')
else
    BATTERY_INFO=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null)
    BATTERY_INFO="${BATTERY_INFO}%"
fi

# Check if battery info was retrieved
if [ -z "$BATTERY_INFO" ]; then
    echo "Battery information not found!"
    exit 1
fi

# Display the battery percentage in terminal
echo "Battery: $BATTERY_INFO"

# Send notification via mako
notify-send "Battery Status" "Battery: $BATTERY_INFO"