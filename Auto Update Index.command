#!/bin/bash
# Auto-push index.html on save

# Go to your repo folder
cd "/Users/benhoward/Desktop/CQCFREE/Hub/Git Link" || exit 1

# Make sure Homebrew & git are on PATH
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

echo "Watching index.html…  (Close this window or press Ctrl+C to stop)"
# Watch and push on change
fswatch -o index.html | while read -r _; do
  git add index.html
  if ! git diff --cached --quiet; then
    git commit -m "Auto-update index.html $(date '+%F %T')"
    git push
    echo "✅ Uploaded at $(date '+%H:%M:%S')"
  fi
done
