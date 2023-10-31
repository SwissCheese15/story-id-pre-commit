#!/bin/zsh

branch_name=$(git symbolic-ref --short HEAD)  # Get the current branch name
project_id=$(echo "$branch_name" | sed -n 's/^.*\/\([^-]*\)-.*$/\1/p')  # Extract the Project-ID

if [ -n "$project_id" ]; then
    # If a Project-ID is found in the branch name, modify the commit message
    sed -i "1s/$/ \[$project_id\]/" "$1"
    alert "Story ID [$project_id] was automatically added to the commit message."
else
    # If no Project-ID is found, display a message
    alert "No Story ID found in branch name."
    exit 1
fi
