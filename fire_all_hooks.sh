# Get current directory
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Define push order
# We push global_assets FIRST so that its templates/CSS are available for 
# the other services when they trigger their rebuilds on push.
REPOS=("global_assets" "blog" "main" "profile")

for dir_name in "${REPOS[@]}"; do
    if [ -d "$dir_name/.git" ]; then
        echo "Firing hook for repository: $dir_name"
        cd "$ROOT_DIR/$dir_name"
        echo #
        ./hook.sh
        echo #
        echo "Firing hook for repository: $dir_name done."
        echo "- - - - - - - - - - - - - - - - - - - - - - - -"
        echo #
        cd "$ROOT_DIR"
    fi
done
