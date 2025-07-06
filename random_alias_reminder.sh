#!/bin/bash

# Random alias and vim tip reminder script
# Shows bash aliases 50% of the time, vim tips 50% of the time

# ANSI color codes
readonly YELLOW='\033[1;33m'
readonly CYAN='\033[0;36m'
readonly GREEN='\033[0;32m'
readonly NC='\033[0m' # No Color

# Configuration paths
readonly CONFIG_DIR="$(dirname "${BASH_SOURCE[0]}")"
readonly VIM_README="${CONFIG_DIR}/VIM_CONFIG_README.md"
readonly BASH_ALIASES="$HOME/.bash_aliases"

# Function to show random alias tip
show_alias_tip() {
    if [ -f "$BASH_ALIASES" ]; then
        # Get alias lines with descriptions
        mapfile -t alias_lines < <(grep "^alias.*#" "$BASH_ALIASES" | sed 's/^[[:space:]]*//')
        
        if [ ${#alias_lines[@]} -gt 0 ]; then
            # Pick random alias line
            random_line=${alias_lines[$RANDOM % ${#alias_lines[@]}]}
            
            # Extract alias name and description
            alias_name=$(echo "$random_line" | sed 's/^alias \([^=]*\)=.*/\1/')
            description=$(echo "$random_line" | sed 's/.*# //')
            
            echo -e "${YELLOW}💡 Alias Tip: Try '${alias_name}' - ${description}${NC}"
            return 0
        fi
    fi
    return 1
}

# Function to show random vim tip
show_vim_tip() {
    if [ -f "$VIM_README" ]; then
        # Extract vim tooltips
        mapfile -t vim_tips < <(grep -o 'TOOLTIP:[^:]*:[^-]*' "$VIM_README" | sed 's/TOOLTIP://')
        
        if [ ${#vim_tips[@]} -gt 0 ]; then
            # Pick random vim tip
            random_tip=${vim_tips[$RANDOM % ${#vim_tips[@]}]}
            
            # Extract category and description
            category=$(echo "$random_tip" | cut -d':' -f1)
            description=$(echo "$random_tip" | cut -d':' -f2- | sed 's/^ *//')
            
            # Format category name for display
            display_category=$(echo "$category" | tr '_' ' ' | tr '[:upper:]' '[:lower:]')
            
            echo -e "${CYAN}🔧 Vim Tip (${display_category}): ${description}${NC}"
            return 0
        fi
    fi
    return 1
}

# Main execution
if true; then
    # Random choice: 0 = alias tip, 1 = vim tip
    choice=$((RANDOM % 2))
    
    if [ $choice -eq 0 ]; then
        # Try to show alias tip, fallback to vim tip
        if ! show_alias_tip; then
            show_vim_tip
        fi
    else
        # Try to show vim tip, fallback to alias tip
        if ! show_vim_tip; then
            show_alias_tip
        fi
    fi
fi