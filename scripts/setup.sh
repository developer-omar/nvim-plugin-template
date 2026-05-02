#!/bin/bash
# Setup script for the Neovim plugin template

set -e

# ANSI color codes
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

print_message() {
  local color="$1"
  local message="$2"
  # -e understand escape secuences (\n, \t, ANSI colors) in the message
  echo -e "${color}${message}${NC}"
}

print_message "$BLUE" "Nvim Plugin Template Setup" "$NC"

# Get plugin name
read -p "Enter your plugin name (e.g. example-plugin): " PLUGIN_NAME
if [ -z "$PLUGIN_NAME" ]; then
  print_message "$RED" "Error: Plugin name cannot be empty"
  exit 1
fi

# Get plugin description
read -p "Enter a short description of your plugin: " PLUGIN_DESC
if [ -z "$PLUGIN_DESC" ]; then
  print_message "$YELLOW" "Warning: Using default description"
  PLUGIN_DESC="A Neovim plugin"
fi

# Get GitHub username
read -p "Enter your GitHub username: " GITHUB_USERNAME
if [ -z "$GITHUB_USERNAME" ]; then
  print_message "$YELLOW" "Warning: Using 'username' as placeholder"
  GITHUB_USERNAME="username"
fi

# Get full name for license
read -p "Enter your full name for license: " FULL_NAME
if [ -z "$FULL_NAME" ]; then
  print_message "$YELLOW" "Warning: Using 'Full Name' as placeholder"
  FULL_NAME="Full Name"
fi

# Get minimum Neovim version
read -p "Enter minimum Neovim version (default: 0.11.0): " NEOVIM_VERSION
if [ -z "$NEOVIM_VERSION" ]; then
  NEOVIM_VERSION="0.11.0"
fi

# Normalize plugin name for Lua modules
PLUGIN_MODULE=$(echo "$PLUGIN_NAME" | tr '-' '_')
YEAR=$(date +%Y)

print_message "$GREEN" "Setting up plugin with the following configuration:"
echo "  Plugin name: $PLUGIN_NAME"
echo "  Description: $PLUGIN_DESC"
echo "  GitHub: $GITHUB_USERNAME/$PLUGIN_NAME"
echo "  Full name: $FULL_NAME"
echo "  Min Neovim: $NEOVIM_VERSION"
echo

# Rename plugin directories and files
print_message "$BLUE" "Renaming directories and files..." "$NC"

# Update lua directory
if [ -d "lua/plugin-name" ]; then
  mkdir -p "lua/$PLUGIN_NAME"
  cp -r lua/plugin-name/* "lua/$PLUGIN_NAME/"
  rm -rf lua/plugin-name
  print_message "$GREEN" "✓ Updated lua directory"
fi

# Update plugin directory
if [ -d "plugin" ] && [ -f "plugin/plugin-name.lua" ]; then
  mv "plugin/plugin-name.lua" "plugin/$PLUGIN_NAME.lua"
  print_message "$GREEN" "✓ Updated plugin directory"
fi

# Update doc directory
if [ -d "doc" ] && [ -f "doc/plugin-name.txt" ]; then
  mv "doc/plugin-name.txt" "doc/$PLUGIN_NAME.txt"
  print_message "$GREEN" "✓ Updated doc directory"
fi

# Replace placeholders in files
print_message "$BLUE" "Updating file contents..."

# Update README.md
if [ -f "README.md" ]; then
  sed -i "s/plugin-name/$PLUGIN_NAME/g" README_PLUGIN.md
  sed -i "s/username/$GITHUB_USERNAME/g" README_PLUGIN.md
  sed -i "s/plugin-description/$PLUGIN_DESC/g" README_PLUGIN.md
  cp README.md README_TEMPLATE.md
  mv README_PLUGIN README.md
  print_message "$GREEN" "✓ Updated README.md"
fi

# Update lua files
if [ -f "lua/$PLUGIN_NAME/init.lua" ]; then
  sed -i "s/nvim-plugin-template/$PLUGIN_NAME/g" "lua/$PLUGIN_NAME/init.lua"
  print_message "$GREEN" "✓ Updated init.lua"
fi

# Initialize git repository if needed
# if [ ! -d ".git" ]; then
#   print_message "$BLUE" "Initializing git repository..."
#   git init
#   git add .
#   git commit -m "Initial commit: Set up $PLUGIN_NAME from template"
#   print_message "$GREEN" "✓ Git repository initialized"
# fi

print_message "$GREEN" "Setup complete! 🎉"
print_message "$BLUE" "Happy coding! 💻"
