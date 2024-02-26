k#!/bin/bash

ip=$1

if [ -z "$ip" ]; then
    echo "Usage: $0 <IP_ADDRESS>"
    exit 1
fi

echo "Checking host $ip..."

if ping -c 1 -W 1 "$ip" &> /dev/null; then
    echo "Host $ip is up."
    echo "Checking for open ports on $ip..."
    if nc -zvw1 "$ip" 1-65535 &> /dev/null; then
        echo "Host $ip is up, with open ports:"
        nc -zvw1 "$ip" 1-65535 2>&1 | grep succeeded
    else
        echo "Host $ip is up, but no open ports found."
    fi
else
    echo "Host $ip is down."
fi

