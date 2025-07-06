#!/bin/bash

# Random alias reminder script with helpful descriptions
# Reads descriptions from inline comments in .bash_aliases

if true; then
    if [ -f ~/.bash_aliases ]; then
        # Get alias lines with descriptions
        mapfile -t alias_lines < <(grep -n "^alias.*#" ~/.bash_aliases | sed 's/^[0-9]*://')
        
        if [ ${#alias_lines[@]} -gt 0 ]; then
            # Pick random alias line
            random_line=${alias_lines[$RANDOM % ${#alias_lines[@]}]}
            
            # Extract alias name and description
            alias_name=$(echo "$random_line" | sed 's/^alias \([^=]*\)=.*/\1/')
            description=$(echo "$random_line" | sed 's/.*# //')
            
            echo -e "\033[1;33m💡 Tip: Try alias '$alias_name' - $description\033[0m"
        fi
    fi
fi