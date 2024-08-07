#!/bin/bash

while true; do
  # Execute the dig command
  output=$(dig huggingface.co @8.8.8.8)
  exit_code=$?

  # Check the exit code
  if [ $exit_code -ne 0 ]; then
    # Create a timestamp
    timestamp=$(date +"%Y%m%d_%H%M%S")
    error_file="dig_error_output_$timestamp.txt"

    # Save the output to a file if the exit code is not 0
    echo "######## dig output ########" > $error_file
    echo "$output" >> $error_file
    echo "" >> $error_file

    echo "######## ip a ########" >> $error_file
    ip a >> $error_file
    echo "" >> $error_file

    echo "######## ip link show ########" >> $error_file
    ip link show >> $error_file
    echo "" >> $error_file

    echo "######## route -n ########" >> $error_file
    route -n >> $error_file
    echo "" >> $error_file

    echo "######## netstat -tunlp ########" >> $error_file
    netstat -tuln >> $error_file
    echo "" >> $error_file

    echo "######## resolvectl status ########" >> $error_file
    resolvectl status >> $error_file
    echo "" >> $error_file

    echo "######## cat /etc/resolv.conf ########" >> $error_file
    cat /etc/resolv.conf >> $error_file
    echo "" >> $error_file

    echo "######## tail -300 /var/log/syslog ########" >> $error_file
    tail -300 /var/log/syslog >> $error_file
    echo "" >> $error_file

    echo "######## arp -a ########" >> $error_file
    arp -a >> $error_file
    echo "" >> $error_file

    echo "######## ping the router ########" >> $error_file
    ping -c 4 172.16.70.1 >> $error_file
    echo "" >> $error_file

    echo "######## ping cloudflare ########" >> $error_file
    ping -c 4 1.1.1.1 >> $error_file
    echo "" >> $error_file

    echo "######## ping google ########" >> $error_file
    ping -c 4 8.8.8.8 >> $error_file
    echo "" >> $error_file

    # Exit the script
    exit $exit_code
  fi

  # Continue with the rest of the script if the exit code is 0
  echo "Command executed successfully $(date)"

  # Sleep for a while before the next iteration (e.g., 60 seconds)
  sleep 1
done
