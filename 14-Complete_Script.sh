#!/bin/bash

# [TASK 1] Set variables
targetDirectory="/path/to/target"
destinationDirectory="/path/to/destination"

# [TASK 2] Display values
echo "Target Directory: $targetDirectory"
echo "Destination Directory: $destinationDirectory"

# [TASK 3] Current Timestamp
currentTS=$(date +%s)
echo "Current Timestamp: $currentTS"

# [TASK 4] Set Backup File Name
backupFileName="backup-${currentTS}.tar.gz"
echo "Backup File Name: $backupFileName"

# [TASK 5] Define Original Absolute Path
origAbsPath=$(realpath $targetDirectory)
echo "Original Absolute Path: $origAbsPath"

# [TASK 6] Define Destination Absolute Path
destAbsPath=$(realpath $destinationDirectory)
echo "Destination Absolute Path: $destAbsPath"

# [TASK 7] Change Directory
cd $targetDirectory || exit
echo "Changed directory to: $(pwd)"

# [TASK 8] Calculate Yesterday's Timestamp
yesterdayTS=$((currentTS - 86400))
echo "Yesterday's Timestamp: $yesterdayTS"

# [TASK 9] List All Files and Directories
allFiles=$(ls -A)
echo "All Files and Directories:\n$allFiles"

# [TASK 10] If Statement for File Updates
toBackup=()
for file in $allFiles; do
  if [[ $(stat -c %Y "$file") -gt $yesterdayTS ]]; then
    echo "$file was updated in the last 24 hours."
    toBackup+=("$file")
  fi
done

# [TASK 11] Add Files to Backup Array
echo "Files to Backup: ${toBackup[*]}"

# [TASK 12] Create Backup
tar -czf "$backupFileName" "${toBackup[@]}"
echo "Backup created: $backupFileName"

# [TASK 13] Move Backup
mv "$backupFileName" "$destAbsPath/"
echo "Backup moved to: $destAbsPath"
