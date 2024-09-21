#!/bin/bash
set -e

# Configuration variables
REPLICATION_USER="${REPLICATION_USER:-replicator}"
REPLICATION_PASSWORD="${REPLICATION_PASSWORD:-replicator_password}"

# Create replication user on the master
echo "Creating replication user on master..."
psql -U postgres -c "CREATE ROLE ${REPLICATION_USER} WITH REPLICATION LOGIN PASSWORD '${REPLICATION_PASSWORD}';"
psql -U postgres -c "SELECT pg_create_physical_replication_slot('replication_slot');"
# Add replication entries to pg_hba.conf
# Add replication entries to pg_hba.conf
# IFS=',' read -r -a SLAVE_LIST <<< "$SLAVES"

# for SLAVE in "${SLAVE_LIST[@]}"; do
#   echo "host replication ${REPLICATION_USER} salve_db1 trust" >> /var/lib/postgresql/data/pg_hba.conf
# done

# echo "host replication ${REPLICATION_USER} salve_db1 trust" >> /var/lib/postgresql/data/pg_hba.conf
# echo "host replication ${REPLICATION_USER} 192.168.0.0/22 trust" >> /var/lib/postgresql/data/pg_hba.conf

# Reload PostgreSQL to apply changes
# pg_ctl reload -D /var/lib/postgresql/data
