#!/bin/bash
#  ~/dotfiles/arch-linux-x86-64/run_with_lock.sh :18 Oct at 05:14:35 PM

LOCK_FILE="/tmp/myscript.lock"

# Check if lock file exists
if [ -f "$LOCK_FILE" ]; then
    echo "Script is already running. Exiting."
    exit 1
fi

# Create lock file
touch "$LOCK_FILE"

# Set a trap to remove the lock file on exit (even on errors)
trap "rm -f '$LOCK_FILE'; exit" INT TERM EXIT

echo "Script started. Doing some work..."
sleep 10 # Simulate work
echo "Script finished."

# The trap will handle removing the lock file on exit.
