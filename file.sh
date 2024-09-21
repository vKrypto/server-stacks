#!/bin/bash

# Base directory
BASE_DIR="tech-stack-architectures"

# Folders to create
declare -A FOLDERS=(
    ["db_stack/availability/mongodb"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible helm"
    ["db_stack/availability/postgresql"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible helm"
    ["db_stack/availability/mysql"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible helm"
    ["db_stack/consistency/mongodb"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible helm"
    ["db_stack/consistency/postgresql"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible helm"
    ["db_stack/consistency/mysql"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible helm"
    
    ["db_stack/databases/cassandra"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible helm"
    ["db_stack/databases/couchdb"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible helm"
    ["db_stack/databases/dynamodb"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible helm"
    ["db_stack/databases/mongodb"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible helm"
    ["db_stack/databases/redis"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible helm"
    ["db_stack/databases/scylladb"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible helm"
    
    ["monitoring/elk"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible helm"
    ["monitoring/prometheus-grafana"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible"
    
    ["server-tech/mean"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible"
    ["server-tech/mern"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible"
    ["server-tech/vuejs"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible"
    ["server-tech/django"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible"
    ["server-tech/fastapi"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible"
    ["server-tech/nextjs"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible"

    ["message-queues/kafka"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible"
    ["message-queues/rabbitmq"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible"
    ["message-queues/rabbitmq-celery"]="docker-compose docker-swarm docker-kubernetes kubernetes terraform ansible"
)

# Create folders and blank README.md files
for stack in "${!FOLDERS[@]}"; do
    for folder in ${FOLDERS[$stack]}; do
        mkdir -p "$BASE_DIR/$stack/$folder"
        touch "$BASE_DIR/$stack/$folder/README.md"
    done
done

echo "Folder structure with blank README.md files created successfully."
