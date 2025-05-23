#!/bin/bash

log_file="D:/study/iti/DB Use Case/my version/scripts/disk_logs.txt"

threshold=50

disk_space=$(df -h C:/ | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Current Disk Usage: $disk_space%"

if [[ "$disk_space" -gt "$threshold" ]]; then

powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('your disk space is above $threshold%', 'Notification')"
echo "Disk Space = $disk_space% | Date: $(date)" >> "$log_file"

else
powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('your disk space is under $threshold%', 'Notification')"

echo "Disk Space = $disk_space% | Date: $(date)" >> "$log_file"
fi


