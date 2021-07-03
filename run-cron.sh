#!/bin/sh

# Run once immediately
/app/run-once.sh

# Add to crontab
echo "*/5 * * * * /app/run-once.sh" > /etc/crontabs/root
crontab -l

# Run again every 5 minutes
crond -f -d 6
