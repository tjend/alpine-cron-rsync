FROM alpine:latest

# TARGETARCH will be amd64 or arm64
ARG TARGETARCH

RUN \
  # install packages
  apk --no-cache add \
    rsync

ADD init_cron.sh /usr/local/bin/
ADD rsync.sh /usr/local/bin/

# hours between backups(maximum 24 hours) - every 24 hours by default
ENV RSYNC_EVERY_X_HOURS="24"
ENV RSYNC_DEST_DIR="/dest"
ENV RSYNC_SRC_DIRS="/src"

# create the cron job and start the cron daemon
ENTRYPOINT /usr/local/bin/init_cron.sh && /usr/sbin/crond -f
