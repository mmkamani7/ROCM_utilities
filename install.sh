#!/bin/bash

# Define the list of script names
SCRIPTS=("rocm-usage" "drun")
# Check if a target directory is provided as an argument, otherwise use ~/bin
TARGET_DIR=${1:-"$HOME/bin"}
# Ensure the target directory exists
mkdir -p "$TARGET_DIR"

# Copy the scripts to the target directory
# Process each script in the list
for SCRIPT_NAME in "${SCRIPTS[@]}"; do
  # Ensure the script file exists
  if [ ! -f "$SCRIPT_NAME" ]; then
    echo "Error: $SCRIPT_NAME not found."
    continue
  fi


  # Move the script to the target directory
  cp -f "$SCRIPT_NAME" "$TARGET_DIR/$SCRIPT_NAME"

  # Make the script executable
  chmod +x "$TARGET_DIR/$SCRIPT_NAME"

  echo "$SCRIPT_NAME installed"
done

# Add the target directory to PATH if not already present
if [[ ":$PATH:" != *":$TARGET_DIR:"* ]]; then
  echo "Adding $TARGET_DIR to PATH."
  echo "export PATH=\$PATH:$TARGET_DIR" >> ~/.bashrc
  source ~/.bashrc
else
  echo "$TARGET_DIR is already in PATH."
fi

echo "Installation complete. You can now use the installed scripts from anywhere."