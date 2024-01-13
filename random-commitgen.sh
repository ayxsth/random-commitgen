#!/bin/bash

# Function to check the operating system
is_macos() {
    [[ "$OSTYPE" == darwin* ]]
}

# Check if repo path and number of commits are provided as arguments
if [ "$#" -ne 2 ] && [ "$#" -ne 4 ]; then
    echo "Usage: $0 <repo_path> <num_commits> [<start_date> <end_date>]"
    exit 1
fi

repo_path="$1"      # Path to the Git repository
num_commits="$2"    # Number of commits to generate

# Set default start and end dates if not provided
if [ "$#" -eq 2 ]; then
    if is_macos; then
        start_date=$(date -v-1y "+%Y-%m-%d")
        end_date=$(date "+%Y-%m-%d")
    else
        start_date=$(date --date="1 year ago" "+%Y-%m-%d")
        end_date=$(date "+%Y-%m-%d")
    fi
else
    start_date="$3"
    end_date="$4"
fi

# Function to generate a random date-time in the format "YYYY-MM-DD HH:MM:SS" within the given range
generate_random_date() {
    if is_macos; then
        start_date_seconds=$(date -jf "%Y-%m-%d" "$start_date" "+%s")
        end_date_seconds=$(date -jf "%Y-%m-%d" "$end_date" "+%s")
    else
        start_date_seconds=$(date -d "$start_date" "+%s")
        end_date_seconds=$(date -d "$end_date" "+%s")
    fi

    range_seconds=$((end_date_seconds - start_date_seconds))
    random_seconds=$((start_date_seconds + RANDOM * RANDOM % range_seconds))

    if is_macos; then
        random_date=$(date -r "$random_seconds" "+%Y-%m-%d %H:%M:%S")
    else
        random_date=$(date -d "@$random_seconds" "+%Y-%m-%d %H:%M:%S")
    fi

    echo "$random_date"
}

# Navigate to the Git repository or initialize one if it doesn't exist
if [ -d "$repo_path/.git" ]; then
    cd "$repo_path" || { echo "Error: Could not change directory to $repo_path"; exit 1; }
else
    mkdir -p "$repo_path"
    cd "$repo_path" || { echo "Error: Could not change directory to $repo_path"; exit 1; }
    git init
fi

# Make random commits
for ((i=0; i<num_commits; i++)); do
    random_date=$(generate_random_date)
    random_message="random commit, lol"

    GIT_COMMITTER_DATE="$random_date" git commit --allow-empty -m "$random_message" --date="$random_date"

    echo
done

# Complete message
echo "Done! There has been $num_commits commits between $start_date and $end_date in $repo_path."
