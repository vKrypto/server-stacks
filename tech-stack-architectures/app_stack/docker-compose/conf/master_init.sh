#!/bin/bash
set -e

# Configuration variables
REPLICATION_USER="${REPLICATION_USER:-replicator}"
REPLICATION_PASSWORD="${REPLICATION_PASSWORD:-replicator_password}"

# Create replication user on the master
echo "Creating replication user on master..."
psql -U postgres -c "CREATE ROLE ${REPLICATION_USER} WITH REPLICATION LOGIN PASSWORD '${REPLICATION_PASSWORD}';"

# Reload PostgreSQL to apply changes
pg_ctl reload -D /var/lib/postgresql/data
