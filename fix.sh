#!/bin/bash
# Usage: ./fix.sh "<DD-MM-YYYY HH:MM:SS>"
# WARNING: This rewrites commit history. Do not run on shared/public branches.

if [ -z "$1" ]; then
    echo "Usage: $0 \"<DD-MM-YYYY HH:MM:SS>\""
    exit 1
fi

# Input date and time string
INPUT_DATETIME="$1"

# Validate date and time format
if ! [[ "$INPUT_DATETIME" =~ ^[0-9]{2}-[0-9]{2}-[0-9]{4}\ [0-9]{2}:[0-9]{2}:[0-9]{2}$ ]]; then
    echo "Error: Date and Time must be in \"DD-MM-YYYY HH:MM:SS\" format"
    exit 1
fi

# Determine OS for date command differences.
OS=$(uname)

# Separate Date and Time
INPUT_DATE=$(echo "$INPUT_DATETIME" | cut -d' ' -f1)
INPUT_TIME=$(echo "$INPUT_DATETIME" | cut -d' ' -f2)

# Convert input date and time to timestamp
if [[ "$OS" == "Darwin" ]]; then
    # Convert DD-MM-YYYY to YYYY-MM-DD for macOS date command
    DATE_PARTS=(${INPUT_DATE//-/ })
    FORMATTED_DATE="${DATE_PARTS[2]}-${DATE_PARTS[1]}-${DATE_PARTS[0]}"
    BASE=$(date -j -f "%Y-%m-%d %H:%M:%S" "$FORMATTED_DATE $INPUT_TIME" "+%s")
else
    # Reformat DD-MM-YYYY HH:MM:SS to YYYY-MM-DD HH:MM:SS for Linux date command robustness
    DATE_PARTS=(${INPUT_DATE//-/ })
    FORMATTED_DATETIME="${DATE_PARTS[2]}-${DATE_PARTS[1]}-${DATE_PARTS[0]} $INPUT_TIME"
    BASE=$(date -d "$FORMATTED_DATETIME" "+%s")
fi

# Current timestamp.
NOW=$(date +%s)
RANGE=$(( NOW - BASE ))

# Get all commits (oldest first).
COMMITS=( $(git rev-list --reverse HEAD) )
COUNT=${#COMMITS[@]}

if [ $COUNT -eq 0 ]; then
    echo "No commits found in the repository."
    exit 0
fi

# Generate a random weight for each commit.
declare -a weights
total=0
for (( i=0; i<$COUNT; i++ )); do
    w=$(( RANDOM ))
    weights[i]=$w
    total=$(( total + w ))
done

# Compute new commit timestamps by assigning each commit a random offset.
# This ensures that the new timestamps remain in chronological order.
declare -a new_dates
cumulative=0
for (( i=0; i<$COUNT; i++ )); do
    cumulative=$(( cumulative + weights[i] ))
    # Use Python3 for floating-point math.
    offset=$(python3 -c "print(int(($cumulative/float($total))*$RANGE))")
    new_ts=$(( BASE + offset ))
    new_dates[i]=$new_ts
done

# Build the env-filter script as a case statement.
env_filter_script="case \$GIT_COMMIT in"
for (( i=0; i<$COUNT; i++ )); do
    commit=${COMMITS[i]}
    new_ts=${new_dates[i]}
    if [[ "$OS" == "Darwin" ]]; then
        new_date=$(date -r $new_ts -R)
    else
        new_date=$(date -d "@$new_ts" -R)
    fi
    env_filter_script+="
    $commit)
         export GIT_AUTHOR_DATE=\"$new_date\";
         export GIT_COMMITTER_DATE=\"$new_date\";
         export GIT_AUTHOR_NAME=\"root_daemon\";
         export GIT_COMMITTER_NAME=\"root_daemon\";
         ;;"
done
env_filter_script+="
esac
"

echo "Using the following env-filter:"
echo "$env_filter_script"
echo "Rewriting commits..."

# Run git filter-branch with the built env-filter script over all refs.
git filter-branch -f --env-filter "$env_filter_script" -- --all

echo "Done rewriting $COUNT commits."