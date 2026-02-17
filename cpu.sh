#!/bin/bash

# CPU alert threshold
THRESHOLD=80

# Get total CPU usage (user + system)
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | \
            awk '{usage=$2+$4} END {printf "%.0f", usage}')

# Check if CPU usage exceeds threshold
if [ "$CPU_USAGE" -ge "$THRESHOLD" ]; then
    echo "ALERT: CPU usage is high! Current usage: ${CPU_USAGE}%"
else
    echo "CPU usage is normal: ${CPU_USAGE}%"
fi


if [ "$CPU_USAGE" -ge "$THRESHOLD" ]; then
    echo "CPU usage is ${CPU_USAGE}%" | mail -s "CPU Alert!" admin@example.com
fi
