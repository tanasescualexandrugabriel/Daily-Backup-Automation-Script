# [TASK 11]
toBackup=()
for file in $allFiles; do
  if [[ $(stat -c %Y "$file") -gt $yesterdayTS ]]; then
    toBackup+=("$file")
  fi
done
echo "Files to Backup: ${toBackup[*]}"
