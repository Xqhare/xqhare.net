#!/usr/bin/env bash

echo "------------------------------------------------"
echo #
echo "Push all git repositories script started"
echo #

# Get current directory
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Pushing root repository..."
echo #
git push
echo #
echo "Pushing root repository done."
echo #

# Define push order
# We want to push global_assets LAST because it triggers rebuilds of all other services
# This avoids race conditions where a service is building while global_assets is also building it
REPOS=("blog" "main" "profile" "global_assets")

for dir_name in "${REPOS[@]}"; do
    if [ -d "$dir_name/.git" ]; then
        echo "Processing repository: $dir_name"
        cd "$ROOT_DIR/$dir_name"

        # Check for unpushed commits
        UNPUSHED_COMMITS=$(git rev-list @{u}..HEAD 2>/dev/null | wc -l)

        if [ "$UNPUSHED_COMMITS" -gt 0 ]; then
            echo "Found $UNPUSHED_COMMITS unpushed commits in $dir_name. Pushing..."
            git push
            if [ $? -eq 0 ]; then
                echo "Successfully pushed $dir_name"
            else
                echo "Error: Failed to push $dir_name"
            fi
        else
            echo "No changes to push in $dir_name"
        fi
        
        echo "Processing for $dir_name done."
        echo "- - - - - - - - - - - - - - - - - - - - - - - -"
        echo #
        cd "$ROOT_DIR"
    fi
done

echo "Push all git repositories script finished"
echo "------------------------------------------------"
exit 0
