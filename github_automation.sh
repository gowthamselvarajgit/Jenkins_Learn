#!/bin/bash

# Script to automate Git add, commit, and push

# Ask for a commit message
read -p "Enter commit message: " commit_msg

# Add all changes
git add .

# Commit with the provided message
git commit -m "$commit_msg"

# Push to the current branch
git push origin main

echo "✅ Changes pushed successfully."
