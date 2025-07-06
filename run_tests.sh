#!/bin/bash

# Main test runner for bash configuration files
# Runs all test suites and provides comprehensive reporting

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test counters
TOTAL_TESTS=0
TOTAL_PASSED=0
TOTAL_FAILED=0
SUITES_RUN=0
SUITES_PASSED=0

echo -e "${BLUE}Bash Configuration Test Suite${NC}"
echo -e "${BLUE}=============================${NC}"
echo ""

# Function to run a test suite
run_test_suite() {
    local test_script="$1"
    local suite_name="$2"
    
    echo -e "${YELLOW}Running $suite_name...${NC}"
    
    if [ ! -f "$test_script" ]; then
        echo -e "${RED}✗ Test script not found: $test_script${NC}"
        return 1
    fi
    
    if [ ! -x "$test_script" ]; then
        chmod +x "$test_script"
    fi
    
    # Run the test suite and capture output
    if output=$("$test_script" 2>&1); then
        echo -e "${GREEN}✓ $suite_name completed successfully${NC}"
        SUITES_PASSED=$((SUITES_PASSED + 1))
        
        # Extract test counts from output
        if [[ "$output" == *"Tests run:"* ]]; then
            tests_run=$(echo "$output" | grep "Tests run:" | sed 's/Tests run: //')
            passed=$(echo "$output" | grep "Passed:" | sed 's/.*Passed: //' | sed 's/[^0-9].*//')
            
            TOTAL_TESTS=$((TOTAL_TESTS + tests_run))
            TOTAL_PASSED=$((TOTAL_PASSED + passed))
        fi
    else
        echo -e "${RED}✗ $suite_name failed${NC}"
        echo "$output"
        
        # Try to extract partial results
        if [[ "$output" == *"Tests run:"* ]]; then
            tests_run=$(echo "$output" | grep "Tests run:" | sed 's/Tests run: //')
            passed=$(echo "$output" | grep "Passed:" | sed 's/.*Passed: //' | sed 's/[^0-9].*//')
            failed=$(echo "$output" | grep "Failed:" | sed 's/.*Failed: //' | sed 's/[^0-9].*//')
            
            TOTAL_TESTS=$((TOTAL_TESTS + tests_run))
            TOTAL_PASSED=$((TOTAL_PASSED + passed))
            TOTAL_FAILED=$((TOTAL_FAILED + failed))
        fi
        
        return 1
    fi
    
    SUITES_RUN=$((SUITES_RUN + 1))
    echo ""
}

# Main test execution
main() {
    echo "Starting comprehensive configuration tests..."
    echo ""
    
    # Test directory setup
    if [ ! -d "tests" ]; then
        echo -e "${YELLOW}Creating tests directory...${NC}"
        mkdir -p tests
    fi
    
    # Run individual test suites
    run_test_suite "tests/test_aliases.sh" "Bash Aliases Tests"
    run_test_suite "tests/test_bashrc.sh" "Bashrc Configuration Tests"
    run_test_suite "tests/test_vimrc.sh" "Vim Configuration Tests"
    
    # Final summary
    echo -e "${BLUE}=== Final Test Summary ===${NC}"
    echo -e "Test Suites Run: $SUITES_RUN"
    echo -e "${GREEN}Suites Passed: $SUITES_PASSED${NC}"
    
    if [ $SUITES_PASSED -eq $SUITES_RUN ]; then
        echo -e "${GREEN}All test suites passed!${NC}"
    else
        failed_suites=$((SUITES_RUN - SUITES_PASSED))
        echo -e "${RED}Failed Suites: $failed_suites${NC}"
    fi
    
    echo ""
    echo -e "Total Individual Tests: $TOTAL_TESTS"
    echo -e "${GREEN}Tests Passed: $TOTAL_PASSED${NC}"
    
    if [ $TOTAL_FAILED -gt 0 ]; then
        echo -e "${RED}Tests Failed: $TOTAL_FAILED${NC}"
        echo ""
        echo -e "${RED}Some tests failed. Please review the output above.${NC}"
        exit 1
    else
        echo ""
        echo -e "${GREEN}All tests passed successfully!${NC}"
        echo -e "${GREEN}Your bash configuration files are valid and working correctly.${NC}"
        exit 0
    fi
}

# Handle command line arguments
case "${1:-}" in
    --help|-h)
        echo "Usage: $0 [options]"
        echo ""
        echo "Options:"
        echo "  --help, -h     Show this help message"
        echo "  --aliases      Run only alias tests"
        echo "  --bashrc       Run only bashrc tests"
        echo "  --vim          Run only vim tests"
        echo ""
        echo "Run without arguments to execute all tests."
        exit 0
        ;;
    --aliases)
        run_test_suite "tests/test_aliases.sh" "Bash Aliases Tests"
        exit $?
        ;;
    --bashrc)
        run_test_suite "tests/test_bashrc.sh" "Bashrc Configuration Tests"
        exit $?
        ;;
    --vim)
        run_test_suite "tests/test_vimrc.sh" "Vim Configuration Tests"
        exit $?
        ;;
    "")
        main
        ;;
    *)
        echo -e "${RED}Unknown option: $1${NC}"
        echo "Use --help for usage information."
        exit 1
        ;;
esac