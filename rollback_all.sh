#!/usr/bin/env bash
set -e

# rollback_all.sh
# Iterates through all services and executes their local rollback.sh script.

echo "------------------------------------------------"
echo #
echo "Rollback all services script started"
echo #

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SERVICES=("main" "profile" "blog")

for service in "${SERVICES[@]}"; do
    ROLLBACK_SCRIPT="$ROOT_DIR/$service/rollback.sh"
    if [ -f "$ROLLBACK_SCRIPT" ]; then
        echo "Executing rollback for $service..."
        cd "$ROOT_DIR/$service"
        ./rollback.sh
        cd "$ROOT_DIR"
        echo "Rollback for $service complete."
    else
        echo "No rollback script found for $service (skipping)."
    fi
    echo "- - - - - - - - - - - - - - - - - - - - - - - -"
    echo #
done

echo "Rollback all services script finished"
echo "------------------------------------------------"
exit 0
