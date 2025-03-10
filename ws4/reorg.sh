#!/bin/bash

#timestamp variable
timestamp=$(date "+%F-%T")

#taxi data
file="/home/sherine_aldrin/cs131/2019-01-h1.csv"
#header
header=$(head -n 1 "$file")

#loop through the vendor ID's
for vendor in 1.0 2.0 4.0; do
    output="${timestamp}-${vendor}.csv"

    echo "$header" > "$output"
   
    grep "^$vendor," "$file" >> "$output"

    echo "Created file: $output_file"
done

