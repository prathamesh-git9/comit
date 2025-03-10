#!/bin/bash

# Start date
start_date="2024-01-01"
current_date=$start_date

# Loop for 389 days
for (( i=1; i<=389; i++ )); do
    # Determine if it's a commit day or not (60% chance of a commit)
    commit_day=$((RANDOM % 5))
    if [ $commit_day -lt 2 ]; then
        # Determine the number of commits for this day
        num_commits=1
        if [ $((RANDOM % 2)) -eq 0 ]; then
            num_commits=$((RANDOM % 5 + 4))  # Make 4 or 3 commits
        fi

        # Loop to make multiple commits
        for (( c=1; c<=$num_commits; c++ )); do
            # Determine the number of tasks to run (between 1 and 5)
            num_tasks=$((RANDOM % 5 + 1))

            # Shuffle the task indices
            indices=($(seq 0 4 | shuf))

            # Run the selected number of tasks
            for (( j=0; j<num_tasks; j++ )); do
                # Dynamically define the tasks with the updated current_date
                case "${indices[$j]}" in
                    0) echo "Task 1: Writing to a file" >> "${current_date}.txt" ;;
                    1) echo "Task 2: Appending some random text" >> "${current_date}.txt" ;;
                    2) echo "Task 3: Logging the current date" > "${current_date}.log" ;;
                    3) echo "Task 4: Creating a backup file" > "${current_date}_backup.txt" ;;
                    4)
                        echo "Task 5: Writing a random number" > "${current_date}_random.txt"
                        echo $RANDOM >> "${current_date}_random.txt"
                        ;;
                esac
            done

            # Git operations
            git add .
            git commit -m "updates for $current_date"

            # Set the Git committer date and amend the commit
            git commit --amend --no-edit --date="$current_date 14:00:00"
        done
    fi

    # Move to the next day (cross-platform-compatible)
    current_date=$(date -d "$current_date + 1 day" "+%Y-%m-%d")
done
