#Here's a bash script that checks if a specific system service is running and reports its status:

#!/bin/bash

# Check if the service name is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <service_name>"
  exit 1
fi

# Service name to check
service_name=$1

# Check the status of the service using systemctl
if systemctl is-active --quiet "$service_name"; then
  echo "The service '$service_name' is running."
else
  echo "The service '$service_name' is not running."
fi


I have a service named "ssh" on my system and checking its status by running:
./check_service_status.sh ssh

Output:
  Since,the service is running, the output would be:
  The service 'ssh' is running.

I have a service named "apache2" on my system and checking its status by running:
./check_service_status.sh apache2

output:
  Since,the service is not running, the output would be:
  The service 'apache2' is not running.

Explanation:
1.The script checks if a service name is provided as a command line argument.
2.It uses the systemctl is-active --quiet <service_name> command to check if the service is running.
3.Based on the exit status of the systemctl command, it outputs whether the specified service is running or not.

