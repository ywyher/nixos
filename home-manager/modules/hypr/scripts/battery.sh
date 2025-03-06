#!/bin/bash

# Get battery percentage from sysfs or upower
if command -v upower &>/dev/null; then
    BATTERY_INFO=$(upower -i $(upower -e | grep 'battery') | grep -E "percentage" | awk '{print $2}')
    POWER_STATUS=$(upower -i $(upower -e | grep 'battery') | grep -E "state" | awk '{print $2}')
else
    BATTERY_INFO=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null)
    BATTERY_INFO="${BATTERY_INFO}%"
    POWER_STATUS=$(cat /sys/class/power_supply/AC*/online 2>/dev/null)
    if [ "$POWER_STATUS" -eq 1 ]; then
        POWER_STATUS="charging"
    else
        POWER_STATUS="discharging"
    fi
fi

# Check if battery info was retrieved
if [ -z "$BATTERY_INFO" ]; then
    echo "Battery information not found!"
    exit 1
fi

# Display battery status in terminal
echo "Battery: $BATTERY_INFO ($POWER_STATUS)"

# Send notification via mako
notify-send "Battery Status" "Battery: $BATTERY_INFO ($POWER_STATUS)"