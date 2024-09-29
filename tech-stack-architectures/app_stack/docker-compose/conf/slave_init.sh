#!/bin/bash
set -e

# Configuration variables
MASTER_HOST="${MASTER_HOST:-master_db}"
MASTER_PORT="${MASTER_PORT:-5432}"

# Create the standby.signal file to enable replication
touch /var/lib/postgresql/data/standby.signal

# Optionally set permissions for the standby.signal file
chown postgres:postgres /var/lib/postgresql/data/standby.signal
chmod 600 /var/lib/postgresql/data/standby.signal

# strart replica-sync
bash -c "
until pg_basebackup --pgdata=/var/lib/postgresql/data -R --slot=replication_slot_${CONTAINER_NAME} --host=${MASTER_HOST} --port=${MASTER_PORT}
do
echo 'Waiting for primary to connect...'
sleep 1s
done
echo 'Backup done, starting replica...'
chmod 0700 /var/lib/postgresql/data
postgres
"