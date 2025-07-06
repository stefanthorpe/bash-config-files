#!/bin/bash

# vim_tooltip_extractor.sh - Extract and manage vim configuration tooltips
# Usage: ./vim_tooltip_extractor.sh [command] [options]

set -euo pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly README_FILE="${SCRIPT_DIR}/VIM_CONFIG_README.md"
readonly OUTPUT_DIR="${SCRIPT_DIR}/vim_docs"

# ANSI color codes
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly PURPLE='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly WHITE='\033[1;37m'
readonly NC='\033[0m' # No Color

# Tooltip categories
declare -A TOOLTIP_CATEGORIES=(
    ["MAIN_INDEX"]="Main documentation index"
    ["QUICK_REF"]="Quick reference and essential shortcuts"
    ["PLUGINS"]="Plugin categories and descriptions"
    ["BASE_PLUGINS"]="Core and base functionality plugins"
    ["EDITING"]="Text editing and manipulation tools"
    ["NAVIGATION"]="File and project navigation"
    ["GIT"]="Git integration and version control"
    ["LANGUAGES"]="Language-specific support"
    ["DEV_TOOLS"]="Development and debugging tools"
    ["APPEARANCE"]="UI and visual enhancements"
    ["KEYMAPS"]="Complete key mapping reference"
    ["LEADER_KEYS"]="Space-based leader shortcuts"
    ["CLAUDE_AI"]="AI integration features"
    ["MOVEMENT"]="Movement and navigation commands"
    ["TEXT_OBJECTS"]="Custom text objects"
    ["FUNCTION_KEYS"]="F1-F12 key assignments"
    ["INSERT_MODE"]="Insert mode productivity shortcuts"
    ["VISUAL_MODE"]="Visual selection enhancements"
    ["COMMANDS"]="Custom vim commands"
    ["FUNCTIONS"]="Custom vim functions"
    ["TIPS"]="Configuration tips and best practices"
    ["PROGRAMMATIC"]="Automation and scripting tools"
    ["SETUP"]="Installation and setup guide"
)

# Print usage information
usage() {
    cat << EOF
${WHITE}Vim Configuration Tooltip Extractor${NC}

${CYAN}USAGE:${NC}
    $0 [COMMAND] [OPTIONS]

${CYAN}COMMANDS:${NC}
    ${GREEN}extract${NC}        Extract all tooltips from documentation
    ${GREEN}list${NC}           List all available tooltip categories
    ${GREEN}show${NC}           Show specific tooltip content
    ${GREEN}search${NC}         Search tooltips by keyword
    ${GREEN}export${NC}         Export tooltips to various formats
    ${GREEN}validate${NC}       Validate tooltip format and completeness
    ${GREEN}help${NC}           Show this help message

${CYAN}OPTIONS:${NC}
    -c, --category ${YELLOW}CAT${NC}     Filter by category
    -f, --format ${YELLOW}FMT${NC}       Output format (text|json|csv|html)
    -o, --output ${YELLOW}FILE${NC}      Output file path
    -q, --quiet           Suppress progress output
    -v, --verbose         Verbose output

${CYAN}EXAMPLES:${NC}
    $0 extract                          # Extract all tooltips
    $0 list                            # List categories
    $0 show --category PLUGINS         # Show plugin tooltips
    $0 search "git"                    # Search for git-related tooltips
    $0 export --format json           # Export as JSON
    $0 validate                        # Check tooltip integrity

${CYAN}TOOLTIP FORMAT:${NC}
    <!-- TOOLTIP:CATEGORY:Description -->

EOF
}

# Print colored output
print_color() {
    local color="$1"
    local message="$2"
    echo -e "${color}${message}${NC}"
}

# Log functions
log_info() { print_color "$BLUE" "ℹ  $*"; }
log_success() { print_color "$GREEN" "✓  $*"; }
log_warning() { print_color "$YELLOW" "⚠  $*"; }
log_error() { print_color "$RED" "✗  $*"; }

# Check if README file exists
check_readme() {
    if [[ ! -f "$README_FILE" ]]; then
        log_error "README file not found: $README_FILE"
        exit 1
    fi
}

# Extract all tooltips from README
extract_tooltips() {
    local format="${1:-text}"
    local output_file="${2:-}"
    local category_filter="${3:-}"
    
    check_readme
    
    log_info "Extracting tooltips from $README_FILE"
    
    # Create output directory if needed
    mkdir -p "$OUTPUT_DIR"
    
    # Extract tooltip lines
    local tooltip_pattern='<!-- TOOLTIP:([^:]+):([^-]+) -->'
    local tooltips=()
    
    while IFS= read -r line; do
        if [[ $line =~ $tooltip_pattern ]]; then
            local category="${BASH_REMATCH[1]}"
            local description="${BASH_REMATCH[2]}"
            
            # Apply category filter if specified
            if [[ -n "$category_filter" && "$category" != "$category_filter" ]]; then
                continue
            fi
            
            tooltips+=("$category|$description")
        fi
    done < "$README_FILE"
    
    # Output in requested format
    case "$format" in
        json)
            output_json "${tooltips[@]}" "$output_file"
            ;;
        csv)
            output_csv "${tooltips[@]}" "$output_file"
            ;;
        html)
            output_html "${tooltips[@]}" "$output_file"
            ;;
        *)
            output_text "${tooltips[@]}" "$output_file"
            ;;
    esac
    
    log_success "Extracted ${#tooltips[@]} tooltips"
}

# Output tooltips as text
output_text() {
    local tooltips=("$@")
    local output_file="${tooltips[-1]}"
    unset tooltips[-1]
    
    local output=""
    output+="VIM CONFIGURATION TOOLTIPS\n"
    output+="==========================\n\n"
    
    for tooltip in "${tooltips[@]}"; do
        IFS='|' read -r category description <<< "$tooltip"
        output+="[$category] $description\n"
    done
    
    if [[ -n "$output_file" ]]; then
        echo -e "$output" > "$output_file"
        log_success "Text output saved to: $output_file"
    else
        echo -e "$output"
    fi
}

# Output tooltips as JSON
output_json() {
    local tooltips=("$@")
    local output_file="${tooltips[-1]}"
    unset tooltips[-1]
    
    local json='{"vim_tooltips": ['
    local first=true
    
    for tooltip in "${tooltips[@]}"; do
        IFS='|' read -r category description <<< "$tooltip"
        
        if [[ "$first" == "true" ]]; then
            first=false
        else
            json+=','
        fi
        
        json+="\n    {"
        json+="\n      \"category\": \"$category\","
        json+="\n      \"description\": \"$description\""
        json+="\n    }"
    done
    
    json+='\n  ],'
    json+="\n  \"metadata\": {"
    json+="\n    \"generated\": \"$(date -Iseconds)\","
    json+="\n    \"total_count\": ${#tooltips[@]}"
    json+="\n  }"
    json+='\n}'
    
    if [[ -n "$output_file" ]]; then
        echo -e "$json" > "$output_file"
        log_success "JSON output saved to: $output_file"
    else
        echo -e "$json"
    fi
}

# Output tooltips as CSV
output_csv() {
    local tooltips=("$@")
    local output_file="${tooltips[-1]}"
    unset tooltips[-1]
    
    local csv="Category,Description\n"
    
    for tooltip in "${tooltips[@]}"; do
        IFS='|' read -r category description <<< "$tooltip"
        csv+="\"$category\",\"$description\"\n"
    done
    
    if [[ -n "$output_file" ]]; then
        echo -e "$csv" > "$output_file"
        log_success "CSV output saved to: $output_file"
    else
        echo -e "$csv"
    fi
}

# Output tooltips as HTML
output_html() {
    local tooltips=("$@")
    local output_file="${tooltips[-1]}"
    unset tooltips[-1]
    
    local html='<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vim Configuration Tooltips</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .tooltip { margin: 10px 0; padding: 10px; border-left: 4px solid #007acc; background: #f8f9fa; }
        .category { font-weight: bold; color: #007acc; }
        .description { margin-top: 5px; }
    </style>
</head>
<body>
    <h1>Vim Configuration Tooltips</h1>
    <div class="tooltips">'
    
    for tooltip in "${tooltips[@]}"; do
        IFS='|' read -r category description <<< "$tooltip"
        html+="\n        <div class=\"tooltip\">"
        html+="\n            <div class=\"category\">$category</div>"
        html+="\n            <div class=\"description\">$description</div>"
        html+="\n        </div>"
    done
    
    html+='\n    </div>
</body>
</html>'
    
    if [[ -n "$output_file" ]]; then
        echo -e "$html" > "$output_file"
        log_success "HTML output saved to: $output_file"
    else
        echo -e "$html"
    fi
}

# List all tooltip categories
list_categories() {
    check_readme
    
    print_color "$WHITE" "Available Tooltip Categories:"
    print_color "$WHITE" "=============================="
    
    for category in "${!TOOLTIP_CATEGORIES[@]}"; do
        local count=$(grep -c "TOOLTIP:$category:" "$README_FILE" 2>/dev/null || echo "0")
        printf "${GREEN}%-15s${NC} ${CYAN}%-40s${NC} ${YELLOW}(%d)${NC}\n" \
            "$category" "${TOOLTIP_CATEGORIES[$category]}" "$count"
    done | sort
}

# Show specific tooltip content
show_tooltip() {
    local category="$1"
    
    check_readme
    
    if [[ -z "${TOOLTIP_CATEGORIES[$category]:-}" ]]; then
        log_error "Unknown category: $category"
        log_info "Use 'list' command to see available categories"
        exit 1
    fi
    
    print_color "$WHITE" "Tooltip Content for: $category"
    print_color "$WHITE" "================================"
    
    local found=false
    while IFS= read -r line; do
        if [[ $line =~ <!-- TOOLTIP:$category:([^-]+) --> ]]; then
            local description="${BASH_REMATCH[1]}"
            print_color "$GREEN" "Description: $description"
            found=true
        fi
    done < "$README_FILE"
    
    if [[ "$found" == "false" ]]; then
        log_warning "No tooltips found for category: $category"
    fi
}

# Search tooltips by keyword
search_tooltips() {
    local keyword="$1"
    
    check_readme
    
    print_color "$WHITE" "Searching tooltips for: '$keyword'"
    print_color "$WHITE" "=================================="
    
    local matches=0
    while IFS= read -r line; do
        if [[ $line =~ <!-- TOOLTIP:([^:]+):([^-]+) --> ]]; then
            local category="${BASH_REMATCH[1]}"
            local description="${BASH_REMATCH[2]}"
            
            if [[ "$category" =~ $keyword ]] || [[ "$description" =~ $keyword ]]; then
                printf "${GREEN}%-15s${NC} ${CYAN}%s${NC}\n" "[$category]" "$description"
                ((matches++))
            fi
        fi
    done < "$README_FILE"
    
    if [[ $matches -eq 0 ]]; then
        log_warning "No tooltips found matching: '$keyword'"
    else
        log_success "Found $matches matching tooltips"
    fi
}

# Validate tooltip format and completeness
validate_tooltips() {
    check_readme
    
    log_info "Validating tooltip format and completeness..."
    
    local errors=0
    local warnings=0
    local total=0
    
    # Check tooltip format
    while IFS= read -r line; do
        if [[ $line =~ <!-- TOOLTIP: ]]; then
            ((total++))
            
            # Check proper format
            if [[ ! $line =~ <!-- TOOLTIP:[^:]+:[^-]+ --> ]]; then
                log_error "Line $total: Invalid tooltip format: $line"
                ((errors++))
            fi
            
            # Extract category and check if it's known
            if [[ $line =~ <!-- TOOLTIP:([^:]+): ]]; then
                local category="${BASH_REMATCH[1]}"
                if [[ -z "${TOOLTIP_CATEGORIES[$category]:-}" ]]; then
                    log_warning "Line $total: Unknown category '$category'"
                    ((warnings++))
                fi
            fi
        fi
    done < "$README_FILE"
    
    # Check for missing categories
    for category in "${!TOOLTIP_CATEGORIES[@]}"; do
        if ! grep -q "TOOLTIP:$category:" "$README_FILE"; then
            log_warning "Missing tooltips for category: $category"
            ((warnings++))
        fi
    done
    
    # Summary
    print_color "$WHITE" "Validation Summary:"
    print_color "$WHITE" "=================="
    echo "Total tooltips: $total"
    echo "Errors: $errors"
    echo "Warnings: $warnings"
    
    if [[ $errors -eq 0 && $warnings -eq 0 ]]; then
        log_success "All tooltips are valid!"
        return 0
    elif [[ $errors -eq 0 ]]; then
        log_warning "Validation completed with warnings"
        return 1
    else
        log_error "Validation failed with errors"
        return 2
    fi
}

# Main function
main() {
    local command=""
    local format="text"
    local output_file=""
    local category=""
    local quiet=false
    local verbose=false
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            extract|list|show|search|export|validate|help)
                command="$1"
                shift
                ;;
            -c|--category)
                category="$2"
                shift 2
                ;;
            -f|--format)
                format="$2"
                shift 2
                ;;
            -o|--output)
                output_file="$2"
                shift 2
                ;;
            -q|--quiet)
                quiet=true
                shift
                ;;
            -v|--verbose)
                verbose=true
                shift
                ;;
            -h|--help)
                usage
                exit 0
                ;;
            -*)
                log_error "Unknown option: $1"
                usage
                exit 1
                ;;
            *)
                # Positional argument (for search keyword)
                if [[ "$command" == "search" && -z "${search_keyword:-}" ]]; then
                    search_keyword="$1"
                elif [[ "$command" == "show" && -z "$category" ]]; then
                    category="$1"
                else
                    log_error "Unexpected argument: $1"
                    usage
                    exit 1
                fi
                shift
                ;;
        esac
    done
    
    # Default command
    if [[ -z "$command" ]]; then
        command="help"
    fi
    
    # Execute command
    case "$command" in
        extract)
            extract_tooltips "$format" "$output_file" "$category"
            ;;
        list)
            list_categories
            ;;
        show)
            if [[ -z "$category" ]]; then
                log_error "Category required for show command"
                exit 1
            fi
            show_tooltip "$category"
            ;;
        search)
            if [[ -z "${search_keyword:-}" ]]; then
                log_error "Search keyword required"
                exit 1
            fi
            search_tooltips "$search_keyword"
            ;;
        export)
            extract_tooltips "$format" "$output_file" "$category"
            ;;
        validate)
            validate_tooltips
            ;;
        help)
            usage
            ;;
        *)
            log_error "Unknown command: $command"
            usage
            exit 1
            ;;
    esac
}

# Run main function with all arguments
main "$@"
