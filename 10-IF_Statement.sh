# [TASK 10]
for file in $allFiles; do
  if [[ $(stat -c %Y "$file") -gt $yesterdayTS ]]; then
    echo "$file was updated in the last 24 hours."
  fi
done
