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
        # Get alias lines with descriptions (without line numbers)
        mapfile -t alias_lines < <(grep "^alias.*#" "$BASH_ALIASES")
        
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
        # First try to get structured TIP comments
        mapfile -t tip_comments < <(grep -o 'TIP:[^:]*:[^:]*:[^-]*' "$VIM_README" 2>/dev/null)
        
        # Then get table shortcuts as backup
        mapfile -t table_shortcuts < <(grep -E '^\|.*`.*`.*\|.*\|.*\|.*\|' "$VIM_README" | grep -v "Shortcut.*Action.*Workflow" | head -20)
        
        # Combine both sources
        all_tips=("${tip_comments[@]}" "${table_shortcuts[@]}")
        
        if [ ${#all_tips[@]} -gt 0 ]; then
            # Pick random tip
            random_tip=${all_tips[$RANDOM % ${#all_tips[@]}]}
            
            # Check if it's a TIP comment or table row
            if [[ "$random_tip" =~ ^TIP: ]]; then
                # Handle TIP format: TIP:TYPE:SHORTCUT:DESCRIPTION
                tip_type=$(echo "$random_tip" | cut -d':' -f2)
                shortcut=$(echo "$random_tip" | cut -d':' -f3)
                description=$(echo "$random_tip" | cut -d':' -f4- | sed 's/^ *//')
                
                if [[ -n "$shortcut" && -n "$description" ]]; then
                    echo -e "${CYAN}🔧 Vim Tip (${tip_type}): ${shortcut} → ${description}${NC}"
                    return 0
                fi
            else
                # Handle table format: | shortcut | action | workflow | description |
                IFS='|' read -ra FIELDS <<< "$random_tip"
                if [ ${#FIELDS[@]} -ge 4 ]; then
                    shortcut=$(echo "${FIELDS[1]}" | sed 's/.*`\([^`]*\)`.*/\1/' | sed 's/^[[:space:]]*//' | sed 's/[[:space:]]*$//')
                    action=$(echo "${FIELDS[2]}" | sed 's/\*\*//g' | sed 's/^[[:space:]]*//' | sed 's/[[:space:]]*$//')
                    workflow=$(echo "${FIELDS[3]}" | sed 's/^[[:space:]]*//' | sed 's/[[:space:]]*$//')
                    description=$(echo "${FIELDS[4]}" | sed 's/^[[:space:]]*//' | sed 's/[[:space:]]*$//')
                    
                    # Filter for good shortcuts
                    if [[ -n "$shortcut" && -n "$description" && ${#shortcut} -le 15 && "$shortcut" != "Shortcut" ]]; then
                        echo -e "${CYAN}🔧 Vim Shortcut: ${shortcut} → ${action} (${description})${NC}"
                        return 0
                    fi
                fi
            fi
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