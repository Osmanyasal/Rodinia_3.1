#!/bin/bash

hostname=$(hostname)

# Check if the hostname matches a specific pattern

cores="0-$(nproc)"	## get maximum by default

if [[ $hostname == "user-HP-Z840-Workstation" ]]; then
    cores="10-19,30-39"	## get second socket
    echo "SYSTEM_NAME: user-HP-Z840-Workstation cores: $cores"
    
elif [[ $hostname == "rt7-laptop-vivo" ]]; then
    cores="0-8"
    echo "SYSTEM_NAME: rt7-laptop-vivo cores: $cores"
    
else
    echo "SYSTEM_NAME: UNKNOWN cores: $cores"
fi

