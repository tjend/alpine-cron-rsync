#!/bin/sh
# environment variables:
#   - DEST is the directory to rsync source directories to
#   - RSYNC_DIRS is the list of source directories

# run postgres dump
echo "$(date) Running 'rsync --archive --verbose ${RSYNC_SRC_DIRS} ${RSYNC_DEST_DIR}'"
rsync --archive --verbose ${RSYNC_SRC_DIRS} ${RSYNC_DEST_DIR}
if [ $? -ne 0 ]; then
  echo "$(date) Error running rsync"
fi
