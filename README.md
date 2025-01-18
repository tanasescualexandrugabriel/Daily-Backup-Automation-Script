# Daily-Backup-Automation-Script
This project features a fully automated script for creating daily backups. The script is designed to identify and archive files updated in the last 24 hours from a specified target directory, storing the archive in a defined destination directory. Its functionalities include:

Setting variables for the target and destination directories.
Generating a unique name for each backup file based on the current timestamp.
Checking and listing recently modified files.
Creating a compressed .tar.gz archive of the selected files.
Moving the backup archive to the destination directory.
Scheduling daily execution using crontab for a consistent backup routine.
This script ensures a reliable and efficient process for safeguarding important data.
