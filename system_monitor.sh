#!/bin/bash
# ==========================================================
# System Monitoring and Alerting Script
# Author: Faizan
# ==========================================================

# Disk usage threshold
DISK_THRESHOLD=80

# Function to display header
print_header() {
    echo "=================================================="
    echo "       SYSTEM MONITORING AND ALERTING SYSTEM"
    echo "=================================================="
    echo "Hostname : $(hostname)"
    echo "Date     : $(date)"
    echo "=================================================="
}

# Function to check disk usage
check_disk() {
    echo
    echo "--- DISK USAGE ---"

    df -h --output=source,pcent,target | awk '$1 ~ /^\/dev\// {print}' | while read -r filesystem usage mountpoint
    do
        usage_number=${usage%\%}

        echo "Filesystem: $filesystem"
        echo "Mount Point: $mountpoint"
        echo "Usage: $usage"

        if [ "$usage_number" -ge "$DISK_THRESHOLD" ]; then
            echo "WARNING: Disk usage is above ${DISK_THRESHOLD}%!"
        else
            echo "Status: OK"
        fi

        echo
    done
}

# Main program
clear

print_header
check_disk

echo "=================================================="
echo "Monitoring completed."
echo "=================================================="
