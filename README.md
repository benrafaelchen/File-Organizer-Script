# Automated Backup Script

A simple Bash script to automate the process of creating compressed, timestamped backups for a specified directory. This script helps users quickly back up files and directories to a designated location.

## Features
- Creates compressed backups of a specified directory using the `tar` command.
- Adds a timestamp to each backup file for easy tracking and organization.
- Stores backups in a user-defined destination directory.

## Usage
1. Set the `BACKUP_SOURCE` and `BACKUP_DESTINATION` paths in the script.
2. Run the script to generate a timestamped `.tar.gz` backup file in the destination directory.

## Example
```bash
./backup_script.sh
