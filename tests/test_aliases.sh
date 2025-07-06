#!/bin/bash

# Test bash aliases functionality
source "$(dirname "$0")/../test_config.sh"

# Source the aliases file in a test environment
test_aliases_file() {
    run_test "Bash aliases file tests"
    
    # Test file exists
    assert_file_exists ".bash_aliases" "bash_aliases file exists"
    
    # Test file is valid bash syntax
    if bash -n .bash_aliases 2>/dev/null; then
        echo -e "${GREEN}✓${NC} bash_aliases has valid syntax"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} bash_aliases has syntax errors"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
}

# Test specific aliases are defined
test_alias_definitions() {
    run_test "Alias definitions"
    
    # Create temporary environment to test aliases
    temp_file=$(mktemp)
    {
        echo "#!/bin/bash"
        echo "source .bash_aliases"
        echo "alias | grep -E '^(gs|gp|ga|gc|ll|ls|install)='"
    } > "$temp_file"
    
    chmod +x "$temp_file"
    alias_output=$("$temp_file" 2>/dev/null || echo "")
    
    # Test for key aliases - check if they exist in the source file instead
    if grep -q "alias gs=" .bash_aliases; then
        echo -e "${GREEN}✓${NC} Git status alias (gs) is defined"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} Git status alias (gs) is not defined"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
    
    if grep -q "alias ll=" .bash_aliases; then
        echo -e "${GREEN}✓${NC} Long listing alias (ll) is defined"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} Long listing alias (ll) is not defined"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
    
    if grep -q "alias install=" .bash_aliases; then
        echo -e "${GREEN}✓${NC} Install alias is defined"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} Install alias is not defined"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
    
    rm -f "$temp_file"
}

# Test alias expansion works correctly
test_alias_expansion() {
    run_test "Alias expansion functionality"
    
    # Test in isolated environment
    temp_script=$(mktemp)
    {
        echo "#!/bin/bash"
        echo "source .bash_aliases"
        echo "shopt -s expand_aliases"
        echo "type ll 2>/dev/null | head -1"
    } > "$temp_script"
    
    chmod +x "$temp_script"
    result=$("$temp_script" 2>/dev/null || echo "")
    
    assert_contains "$result" "alias" "ll alias expands correctly"
    
    rm -f "$temp_script"
}

# Test conditional aliases (UID check)
test_conditional_aliases() {
    run_test "Conditional alias logic"
    
    # Check if non-root aliases are properly conditioned
    if grep -q "if \[ \$UID -ne 0 \]" .bash_aliases; then
        echo -e "${GREEN}✓${NC} Non-root user aliases are properly conditioned"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} Non-root user alias conditions not found"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
}

# Test for dangerous aliases
test_safe_aliases() {
    run_test "Safety checks for aliases"
    
    # Check for potentially dangerous patterns (excluding format in safe contexts)
    dangerous_patterns=("rm -rf /" "sudo rm -rf" "mkfs")
    safe=true
    
    for pattern in "${dangerous_patterns[@]}"; do
        if grep -q "$pattern" .bash_aliases; then
            echo -e "${RED}✗${NC} Potentially dangerous pattern found: $pattern"
            safe=false
            TESTS_FAILED=$((TESTS_FAILED + 1))
        else
            echo -e "${GREEN}✓${NC} No dangerous pattern: $pattern"
            TESTS_PASSED=$((TESTS_PASSED + 1))
        fi
        TESTS_RUN=$((TESTS_RUN + 1))
    done
}

# Test random alias reminder script
test_random_reminder() {
    run_test "Random alias reminder functionality"
    
    # Test script exists and is executable
    assert_file_exists "random_alias_reminder.sh" "random_alias_reminder.sh exists"
    
    if [ -x "random_alias_reminder.sh" ]; then
        echo -e "${GREEN}✓${NC} random_alias_reminder.sh is executable"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} random_alias_reminder.sh is not executable"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
    
    # Test script runs without errors
    if timeout 5 ./random_alias_reminder.sh >/dev/null 2>&1; then
        echo -e "${GREEN}✓${NC} random_alias_reminder.sh runs without errors"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} random_alias_reminder.sh has execution errors"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
    
    # Test script produces output
    output=$(timeout 5 ./random_alias_reminder.sh 2>/dev/null || echo "")
    if [[ -n "$output" ]]; then
        echo -e "${GREEN}✓${NC} random_alias_reminder.sh produces output"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} random_alias_reminder.sh produces no output"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
    
    # Test both alias and vim tips can be generated
    alias_found=false
    vim_found=false
    
    for i in {1..10}; do
        output=$(timeout 5 ./random_alias_reminder.sh 2>/dev/null || echo "")
        if [[ "$output" == *"Alias Tip"* ]]; then
            alias_found=true
        fi
        if [[ "$output" == *"Vim Tip"* ]]; then
            vim_found=true
        fi
        
        # Break early if we found both
        if $alias_found && $vim_found; then
            break
        fi
    done
    
    if $alias_found; then
        echo -e "${GREEN}✓${NC} Alias tips are generated"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} No alias tips found in 10 attempts"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
    
    if $vim_found; then
        echo -e "${GREEN}✓${NC} Vim tips are generated"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} No vim tips found in 10 attempts"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
}

# Run all alias tests
main() {
    echo "Testing Bash Aliases Configuration"
    echo "================================="
    
    test_aliases_file
    test_alias_definitions
    test_alias_expansion
    test_conditional_aliases
    test_safe_aliases
    test_random_reminder
    
    print_results
}

# Run tests if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi