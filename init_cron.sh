#!/bin/sh
# create cronjob entry to run rsync script

# run the rsync script every ${RSYNC_EVERY_X_HOURS} hours at 6 minutes past the hour
echo "6 */${RSYNC_EVERY_X_HOURS} * * * /usr/local/bin/rsync.sh" > /var/spool/cron/crontabs/root
