 

#!/bin/bash

service=$1
action=$2

# Check RHEL OS version
rhel_version=$(cat /etc/redhat-release | grep -oP '\d+\.\d+' | head -n1)

echo "Detected RHEL version: $rhel_version"

if [[ $rhel_version == 7.* ]]; then
	if [ ${action="Status"} ]
	then
		echo "Status of service '$service'..."
		sudo systemctl status "$service" --no-pager
	else
		echo "Performing '$action' on service '$service'..."
		sudo systemctl "$action" "$service"
	fi
exit 1
fi
if [[ $rhel_version == 8.* ]]; then
	if [ ${action="Status"} ]
	then
		echo "Status of service '$service'..."
		sudo systemctl status "$service" --no-pager
	else
		echo "Performing '$action' on service '$service'..."
		sudo systemctl "$action" "$service"
	fi
exit 1
fi
if [[ $rhel_version == 6.* ]]; then
	if [ ${action="Status"} ]
	then
		echo "Status of service '$service'..."
		sudo service "$service" status
	else
		echo "Performing '$action' on service '$service'..."
		sudo service "$service" "$action"
	fi
exit 1
fi