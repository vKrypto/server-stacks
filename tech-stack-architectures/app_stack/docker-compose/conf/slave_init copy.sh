#!/bin/bash
set -e

# Configuration variables
MASTER_HOST="${MASTER_HOST:-master_db}"
MASTER_PORT="${MASTER_PORT:-5432}"
REPLICATION_USER="${REPLICATION_USER:-replicator}"
REPLICATION_PASSWORD="${REPLICATION_PASSWORD:-replicator_password}"

# Create the standby.signal file to enable replication
touch /var/lib/postgresql/data/standby.signal

# Optionally set permissions for the standby.signal file
chown postgres:postgres /var/lib/postgresql/data/standby.signal
chmod 600 /var/lib/postgresql/data/standby.signal

echo "Slave initialization complete."