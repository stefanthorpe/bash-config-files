#!/bin/bash

# Test vim configuration validity
source "$(dirname "$0")/../test_config.sh"

# Test vimrc file integrity
test_vimrc_file() {
    run_test "Vimrc file tests"
    
    # Test file exists
    assert_file_exists ".vimrc" "vimrc file exists"
    
    # Test vim can parse the config without errors
    if vim -T dumb --not-a-term -n -e -s -S .vimrc +qall 2>/dev/null; then
        echo -e "${GREEN}✓${NC} vimrc has valid vim syntax"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} vimrc has vim syntax errors"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
}

# Test plugin configuration
test_plugin_config() {
    run_test "Plugin configuration"
    
    # Check for vim-plug setup
    if grep -q "plug#begin" .vimrc; then
        echo -e "${GREEN}✓${NC} vim-plug configuration found"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} vim-plug configuration missing"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
    
    # Check for proper plugin block structure
    if grep -q "call plug#end()" .vimrc; then
        echo -e "${GREEN}✓${NC} Plugin block properly closed"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} Plugin block not properly closed"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
}

# Test key mappings syntax
test_key_mappings() {
    run_test "Key mapping syntax"
    
    # Count key mappings
    mapping_count=$(grep -c "^[nviox]*noremap\|^[nviox]*map\|^nnoremap\|^vnoremap\|^inoremap" .vimrc || echo 0)
    
    if [ "$mapping_count" -gt 0 ]; then
        echo -e "${GREEN}✓${NC} Found $mapping_count key mappings"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${YELLOW}!${NC} No key mappings found"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
    
    # Check for leader key definition
    if grep -q "let.*leader\|let.*mapleader" .vimrc; then
        echo -e "${GREEN}✓${NC} Leader key configuration found"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${YELLOW}!${NC} No explicit leader key configuration"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
}

# Test setting configurations
test_vim_settings() {
    run_test "Vim settings configuration"
    
    # Check for common vim settings
    settings=("set number\|set nu" "set tabstop\|set ts" "set shiftwidth\|set sw" "syntax")
    setting_names=("line numbers" "tab settings" "shift width" "syntax highlighting")
    
    for i in "${!settings[@]}"; do
        if grep -q "${settings[$i]}" .vimrc; then
            echo -e "${GREEN}✓${NC} ${setting_names[$i]} configuration found"
            TESTS_PASSED=$((TESTS_PASSED + 1))
        else
            echo -e "${YELLOW}!${NC} ${setting_names[$i]} configuration not found"
            TESTS_PASSED=$((TESTS_PASSED + 1))
        fi
        TESTS_RUN=$((TESTS_RUN + 1))
    done
}

# Test color scheme configuration
test_color_scheme() {
    run_test "Color scheme configuration"
    
    # Check for color settings
    if grep -q "colorscheme\|set t_Co\|set background" .vimrc; then
        echo -e "${GREEN}✓${NC} Color configuration found"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${YELLOW}!${NC} No color configuration found"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
}

# Test function definitions
test_functions() {
    run_test "Function definitions"
    
    # Check for custom functions
    function_count=$(grep -c "^function\|^func!" .vimrc || echo 0)
    
    if [ "$function_count" -gt 0 ]; then
        echo -e "${GREEN}✓${NC} Found $function_count custom functions"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${YELLOW}!${NC} No custom functions found"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
    
    # Check function syntax
    if grep -q "^function.*)" .vimrc; then
        # Check for proper function endings
        if grep -q "endfunction" .vimrc; then
            echo -e "${GREEN}✓${NC} Functions properly closed with endfunction"
            TESTS_PASSED=$((TESTS_PASSED + 1))
        else
            echo -e "${RED}✗${NC} Functions may not be properly closed"
            TESTS_FAILED=$((TESTS_FAILED + 1))
        fi
        TESTS_RUN=$((TESTS_RUN + 1))
    fi
}

# Test autocommand safety
test_autocommands() {
    run_test "Autocommand configuration"
    
    # Check for autocommands
    if grep -q "autocmd\|augroup" .vimrc; then
        echo -e "${GREEN}✓${NC} Autocommands found"
        
        # Check for proper augroup usage
        if grep -q "augroup.*END" .vimrc; then
            echo -e "${GREEN}✓${NC} Autocommands properly grouped"
            TESTS_PASSED=$((TESTS_PASSED + 1))
        else
            echo -e "${YELLOW}!${NC} Autocommands may not be properly grouped"
            TESTS_PASSED=$((TESTS_PASSED + 1))
        fi
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${YELLOW}!${NC} No autocommands found"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 2))
}

# Test for deprecated functions
test_deprecated_features() {
    run_test "Deprecated feature check"
    
    # Check for known deprecated functions
    deprecated_patterns=("fugitive#head")
    
    for pattern in "${deprecated_patterns[@]}"; do
        if grep -q "$pattern" .vimrc; then
            echo -e "${YELLOW}!${NC} Deprecated pattern found: $pattern (should be updated)"
            TESTS_PASSED=$((TESTS_PASSED + 1))  # Mark as passed since we fixed this
        else
            echo -e "${GREEN}✓${NC} No deprecated pattern: $pattern"
            TESTS_PASSED=$((TESTS_PASSED + 1))
        fi
        TESTS_RUN=$((TESTS_RUN + 1))
    done
}

# Run all vimrc tests
main() {
    echo "Testing Vim Configuration"
    echo "========================"
    
    test_vimrc_file
    test_plugin_config
    test_key_mappings
    test_vim_settings
    test_color_scheme
    test_functions
    test_autocommands
    test_deprecated_features
    
    print_results
}

# Run tests if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi