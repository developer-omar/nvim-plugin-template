#!/bin/bash

# echo "Select a license for your project:"
# LICENSE_SELECTED=""
# options=("GNU GPLv3" "MIT License" "Apache License 2.0" "Mozilla Public License 2.0")
# PS3="Select a number: "
#
# select choice in "${options[@]}"; do
#   # Validate that $REPLY is a positive integer
#   if [[ ! $REPLY =~ ^[0-9]+$ ]]; then
#     echo "Invalid input: Numbers only, please."
#   elif [ -n "$choice" ]; then
#     LICENSE_SELECTED=$REPLY
#     echo "You selected: $choice (Option $LICENSE_SELECTED)"
#     break
#   else
#     echo "Invalid option: $REPLY is out of range."
#   fi
# done

echo "Select a license for your project:"
options=("GNU GPLv3" "MIT License" "Apache License 2.0" "Mozilla Public License 2.0")
PS3="Select a number: "

select LICENSE_SELECTED in "${options[@]}"; do
  # Validate that $REPLY is a positive integer
  if [[ ! $REPLY =~ ^[0-9]+$ ]]; then
    echo "Invalid input: Numbers only, please."
  elif [ -n "$LICENSE_SELECTED" ]; then
    echo "You selected: $LICENSE_SELECTED(Option $REPLY)"
    LICENSE_SELECTED="${LICENSE_SELECTED// /_}.txt"
    echo "Otro $LICENSE_SELECTED"
    break
  else
    echo "Invalid option: $REPLY is out of range."
  fi
done
