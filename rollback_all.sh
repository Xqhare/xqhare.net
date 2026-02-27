#!/usr/bin/env bash

# rollback_all.sh
# Iterates through all services and executes their local rollback.sh script.

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SERVICES=("main" "profile" "blog")

for service in "${SERVICES[@]}"; do
    ROLLBACK_SCRIPT="$ROOT_DIR/$service/rollback.sh"
    if [ -f "$ROLLBACK_SCRIPT" ]; then
        echo "Executing rollback for $service..."
        cd "$ROOT_DIR/$service"
        ./rollback.sh
    else
        echo "No rollback script found for $service (skipping)."
    fi
done

echo "------------------------------------------------"
echo "Rollback of all services complete."
