#!/bin/bash
set -e

# Configuration variables
MASTER_HOST="${MASTER_HOST:-master_db}"
MASTER_PORT="${MASTER_PORT:-5432}"
REPLICATION_USER="${REPLICATION_USER:-replicator}"
REPLICATION_PASSWORD="${REPLICATION_PASSWORD:-replicator_password}"

# Create the necessary configuration for PostgreSQL 14
echo "Configuring PostgreSQL 14 slave..."

# Add primary connection info to postgresql.conf
echo "primary_conninfo = 'host=${MASTER_HOST} port=${MASTER_PORT} user=${REPLICATION_USER} password=${REPLICATION_PASSWORD}'" >> /var/lib/postgresql/data/postgresql.conf

# Create the standby.signal file to enable replication
touch /var/lib/postgresql/data/standby.signal

# Adjust permissions
chown postgres:postgres /var/lib/postgresql/data/postgresql.conf
chmod 600 /var/lib/postgresql/data/postgresql.conf

echo "Slave initialization complete."
