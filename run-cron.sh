#!/bin/sh

# Run once immediately
/app/run-once.sh

# Add to crontab
echo "*/10 * * * * /app/run-once.sh" > /etc/crontabs/root
crontab -l

# Run again every few minutes
crond -f -d 6
