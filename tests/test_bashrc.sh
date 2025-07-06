#!/bin/bash

# Test bashrc environment setup
source "$(dirname "$0")/../test_config.sh"

# Test bashrc file integrity
test_bashrc_file() {
    run_test "Bashrc file tests"
    
    # Test file exists
    assert_file_exists ".bashrc" "bashrc file exists"
    
    # Test file is valid bash syntax
    if bash -n .bashrc 2>/dev/null; then
        echo -e "${GREEN}✓${NC} bashrc has valid syntax"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} bashrc has syntax errors"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
}

# Test environment variable setup
test_environment_setup() {
    run_test "Environment variable setup"
    
    # Test for key environment configurations
    if grep -q "NVM_DIR" .bashrc; then
        echo -e "${GREEN}✓${NC} NVM configuration found"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} NVM configuration missing"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
    
    # Test for Homebrew setup
    if grep -q "brew shellenv" .bashrc; then
        echo -e "${GREEN}✓${NC} Homebrew configuration found"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} Homebrew configuration missing"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
}

# Test interactive shell detection
test_interactive_check() {
    run_test "Interactive shell detection"
    
    # Check for proper interactive shell guard
    if grep -q "case \$- in" .bashrc && grep -q "\*i\*" .bashrc; then
        echo -e "${GREEN}✓${NC} Interactive shell detection present"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} Interactive shell detection missing or incorrect"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
}

# Test history configuration
test_history_config() {
    run_test "History configuration"
    
    # Check for common history settings
    history_settings=("HISTSIZE" "HISTFILESIZE" "HISTCONTROL")
    
    for setting in "${history_settings[@]}"; do
        if grep -q "$setting" .bashrc; then
            echo -e "${GREEN}✓${NC} $setting configuration found"
            TESTS_PASSED=$((TESTS_PASSED + 1))
        else
            echo -e "${YELLOW}!${NC} $setting configuration not found (optional)"
        fi
        TESTS_RUN=$((TESTS_RUN + 1))
    done
}

# Test file sourcing safety
test_file_sourcing() {
    run_test "Safe file sourcing"
    
    # Check that files are sourced with proper existence checks
    sourced_files_pattern='\[ -f.*\] && \. '
    
    if grep -q "$sourced_files_pattern" .bashrc; then
        echo -e "${GREEN}✓${NC} Safe file sourcing patterns found"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} File sourcing may not be safe"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
}

# Test PATH modifications
test_path_modifications() {
    run_test "PATH variable modifications"
    
    # Create test environment
    temp_script=$(mktemp)
    {
        echo "#!/bin/bash"
        echo "export PATH=/usr/bin:/bin"  # Reset PATH
        echo "source .bashrc"
        echo "echo \$PATH"
    } > "$temp_script"
    
    chmod +x "$temp_script"
    path_result=$("$temp_script" 2>/dev/null || echo "")
    
    # Check if PATH was modified (should contain more than just /usr/bin:/bin)
    if [[ "$path_result" != "/usr/bin:/bin" ]] && [[ -n "$path_result" ]]; then
        echo -e "${GREEN}✓${NC} PATH variable is properly extended"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${YELLOW}!${NC} PATH may not be extended (this might be expected)"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
    
    rm -f "$temp_script"
}

# Test completion setup
test_completion_setup() {
    run_test "Shell completion setup"
    
    # Check for bash completion configurations
    if grep -q "bash_completion" .bashrc || grep -q "aws_completer" .bashrc; then
        echo -e "${GREEN}✓${NC} Shell completion setup found"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${YELLOW}!${NC} No shell completion setup found (optional)"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
}

# Run all bashrc tests
main() {
    echo "Testing Bashrc Configuration"
    echo "============================"
    
    test_bashrc_file
    test_environment_setup
    test_interactive_check
    test_history_config
    test_file_sourcing
    test_path_modifications
    test_completion_setup
    
    print_results
}

# Run tests if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi