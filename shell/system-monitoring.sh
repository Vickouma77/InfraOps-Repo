#!/bin/bash

THRESHOLD=80
# Function to check CPU usage
check_cpu_usage() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    if (( $(echo "$cpu_usage > $THRESHOLD" | bc -l) )); then
        echo "High CPU usage detected: $cpu_usage%"
    else
        echo "CPU usage is normal: $cpu_usage%"
    fi
}
# Function to check memory usage
check_memory_usage() {
    mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    if (( $(echo "$mem_usage > $THRESHOLD" | bc -l) )); then
        echo "High memory usage detected: $mem_usage%"
    else
        echo "Memory usage is normal: $mem_usage%"
    fi
}
# Function to check disk usage
check_disk_usage() {
    disk_usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
    if (( disk_usage > THRESHOLD )); then
        echo "High disk usage detected: $disk_usage%"
    else
        echo "Disk usage is normal: $disk_usage%"
    fi
}
# Main function to run all checks
main() {
    echo "Starting system monitoring..."
    check_cpu_usage
    check_memory_usage
    check_disk_usage
    echo "System monitoring completed."
}
# Run the main function
main
# End of script