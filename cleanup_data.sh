#!/usr/bin/env bash
set -e

# cleanup_data.sh
# Prunes the data directories for each service, keeping only the last 2 versions.

echo "------------------------------------------------"
echo #
echo "Cleanup data directories script started"
echo #

SERVICES=("main" "profile" "blog")

for service in "${SERVICES[@]}"; do
    DATA_DIR="$service/data"

    if [ -d "$DATA_DIR" ]; then
        echo "Cleaning up $DATA_DIR..."
        echo #
        
        # List directories in data dir, sort them by name (which are timestamps), 
        # and remove all but the last 2.
        ENTRIES_TO_REMOVE=$(ls -1 "$DATA_DIR" 2>/dev/null | sort -r | tail -n +3)

        if [ -n "$ENTRIES_TO_REMOVE" ]; then
            echo "Found entries to remove in $service:"
            echo #
            echo "$ENTRIES_TO_REMOVE"
            echo #
            
            while read -r entry; do
                echo "Removing $DATA_DIR/$entry..."
                rm -rf "$DATA_DIR/$entry"
            done <<< "$ENTRIES_TO_REMOVE"
        else
            echo "No cleanup needed for $service (2 or fewer versions)."
        fi
        echo #
        echo "Cleanup for $service done."
        echo "- - - - - - - - - - - - - - - - - - - - - - - -"
        echo #
    fi
done

echo "Cleanup data directories script finished"
echo "------------------------------------------------"
exit 0
