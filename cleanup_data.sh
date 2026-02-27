#!/usr/bin/env bash

# cleanup_data.sh
# Prunes the data directories for each service, keeping only the last 2 versions.

SERVICES=("main" "profile" "blog")

for service in "${SERVICES[@]}"; do
    DATA_DIR="$service/data"

    if [ -d "$DATA_DIR" ]; then
        echo "Cleaning up $DATA_DIR..."
        
        # List directories in data dir, sort them by name (which are timestamps), 
        # and remove all but the last 2.
        # We use -r to sort in reverse, and then tail to skip the first 2.
        ENTRIES_TO_REMOVE=$(ls -1 "$DATA_DIR" | sort -r | tail -n +3)

        if [ -n "$ENTRIES_TO_REMOVE" ]; then
            echo "Found entries to remove in $service:"
            echo "$ENTRIES_TO_REMOVE"
            
            while read -r entry; do
                echo "Removing $DATA_DIR/$entry..."
                rm -rf "$DATA_DIR/$entry"
            done <<< "$ENTRIES_TO_REMOVE"
        else
            echo "No cleanup needed for $service (2 or fewer versions)."
        fi
    fi
done

echo "Cleanup complete."
