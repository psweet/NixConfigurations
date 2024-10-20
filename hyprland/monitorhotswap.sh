#!/bin/bash

conf_file="/home/psweet/.config/hypr/hyprland.conf"

# Check if the file contains 5120 and replace it with 2560, or vice versa
if grep -q '5120' "$conf_file"; then
    echo "Switching to 16:9"
    sed -i 's/5120/2560/g' "$conf_file"
elif grep -q '2560' "$conf_file"; then
    echo "Switching to 32:9"
    sed -i 's/2560/5120/g' "$conf_file"
fi