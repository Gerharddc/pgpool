#!/bin/sh

# Setup postgres password
pg_md5 -m -u ${USERNAME} ${PASSWORD}

# Setup the config files
envsubst < /etc/pgpool2/pgpool.template.conf > /etc/pgpool2/pgpool.conf

exec "$@"