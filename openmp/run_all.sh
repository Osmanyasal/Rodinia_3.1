#!/bin/bash

# Loop through each item in the current directory
for bench in *; do
    # Check if the item is a directory
    if [ -d "$bench" ]; then
        # Print the directory name
        echo "$bench"
        cd $bench ; make 
        # for i in {1..5}; 
        # do 
            ./run 
        # done

        cd ..
    fi
done

