# [TASK 17]
(crontab -l 2>/dev/null; echo "0 0 * * * /path/to/backup.sh") | crontab -
echo "Crontab entry added: Script will run once every 24 hours."
crontab -l
