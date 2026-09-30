#!/bin/bash

# ==========================================================
# System Monitoring and Alerting Script
# Author: Faizan
# ==========================================================

# -------------------------------
# Configuration
# -------------------------------

DISK_THRESHOLD=80
MEMORY_THRESHOLD=80

# -------------------------------
# Function to display header
# -------------------------------

print_header() {
    echo "=================================================="
    echo "       SYSTEM MONITORING AND ALERTING SYSTEM"
    echo "=================================================="
    echo "Hostname : $(hostname)"
    echo "Date     : $(date)"
    echo "=================================================="
}

# -------------------------------
# Function to check disk usage
# -------------------------------

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

# -------------------------------
# Function to check memory usage
# -------------------------------

check_memory() {
    echo
    echo "--- MEMORY USAGE ---"

    total_memory=$(free | awk '/Mem:/ {print $2}')
    used_memory=$(free | awk '/Mem:/ {print $3}')

    memory_usage=$((used_memory * 100 / total_memory))

    echo "Total Memory: ${total_memory} KB"
    echo "Used Memory: ${used_memory} KB"
    echo "Memory Usage: ${memory_usage}%"

    if [ "$memory_usage" -ge "$MEMORY_THRESHOLD" ]; then
        echo "WARNING: Memory usage is above ${MEMORY_THRESHOLD}%!"
    else
        echo "Status: OK"
    fi
}

# -------------------------------
# Function to show top processes
# -------------------------------

show_top_processes() {
    echo
    echo "--- TOP CPU-CONSUMING PROCESSES ---"

    ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
}

# -------------------------------
# Main program
# -------------------------------

clear

print_header
check_disk
check_memory
show_top_processes

echo "=================================================="
echo "Monitoring completed."
echo "=================================================="
