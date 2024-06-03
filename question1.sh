#!/bin/bash

# Check if the log file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

log_file=$1

# Check if the provided argument is a valid file and is readable
if [ ! -f "$log_file" ] || [ ! -r "$log_file" ]; then
    echo "Error: $log_file is not a valid file or is not readable"
    exit 1
fi

# Total Requests Count
total_requests=$(wc -l < "$log_file")
echo "Total Requests Count: $total_requests"

# Percentage of Successful Requests (HTTP status codes 200-299)
successful_requests=$(grep -c ' "2[0-9][0-9] ' "$log_file")
percentage_success=$(awk -v total="$total_requests" -v successful="$successful_requests" 'BEGIN { printf "%.2f", (successful / total) * 100 }')
echo "Percentage of Successful Requests: $percentage_success%"

# Most Active User (IP address with the most requests)
most_active_user=$(awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')
echo "Most Active User: $most_active_user"


Save the script to a file,log_analysis.sh.
Make the script executable: chmod +x log_analysis.sh.
Run the script and provide the log file path : ./log_analysis.sh /assignment.log


Execute:
./log_analysis.sh assignment.log

Output:
  Total Requests Count: 19
  Percentage of Successful Requests: 63.16%
  Most Active User: 192.168.1.1










