#!/bin/sh

# Path to the runix executable
RUNIX_PATH="/etc/profiles/per-user/$USER/bin/runix"

# Check if a window with title 'runix' exists
if hyprctl clients | grep -q "title: runix"; then
  echo "Runix window found, closing it."
  # Close the window (assuming you have a way to close it via hyprctl)
  hyprctl dispatch killwindow "title: runix"
  # Hide the special workspace 'runix'
  hyprctl dispatch togglespecialworkspace runix
else
  echo "Runix window not found, opening it."
  # Show the special workspace 'runix'
  hyprctl dispatch togglespecialworkspace runix
  # Launch runix
  hyprctl dispatch exec "foot --title runix $RUNIX_PATH"
fi
