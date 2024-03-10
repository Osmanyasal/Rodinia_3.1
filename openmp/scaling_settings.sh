#!/bin/bash

hostname=$(hostname)

# Check if the hostname matches a specific pattern

cores="0-$(nproc)"	## get maximum by default
max_cores=$(nproc)

if [[ $hostname == "user-HP-Z840-Workstation" ]]; then
    #cores="10-19,30-39"	## get second socket
    cores="0-9,20-29"
    max_cores=$(($max_cores / 2))
    echo "SYSTEM_NAME: user-HP-Z840-Workstation cores: $cores -- $max_cores"
    
elif [[ $hostname == "du03" ]]; then
    cores="16-31"
    max_cores=$(($max_cores / 2))
    echo "SYSTEM_NAME: rt7-laptop-vivo cores: $cores -- $max_cores"
    
elif [[ $hostname == "rt7-laptop-vivo" ]]; then
    cores="0-8"
    echo "SYSTEM_NAME: rt7-laptop-vivo cores: $cores -- $max_cores"
    
else
    echo "SYSTEM_NAME: UNKNOWN cores: $cores -- $max_cores"
fi

