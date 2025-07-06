# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains shell and vim configuration files for Linux/Unix systems, providing comprehensive aliases, settings, and customizations for enhanced command-line productivity.

## Key Commands

### Testing
```bash
./run_tests.sh                    # Run all configuration tests
./run_tests.sh --aliases          # Test only bash aliases
./run_tests.sh --bashrc           # Test only bashrc configuration  
./run_tests.sh --vim              # Test only vim configuration
```

### Setup and Installation
```bash
./setup-new-machine.sh           # Automated system setup script
./gnome-terminal-solarized-dark.sh # Apply terminal theme
source ~/.bashrc                 # Reload bash configuration
```

### Configuration Management
```bash
./random_alias_reminder.sh       # Display random alias with description
./test_config.sh                 # Basic configuration validation
```

## Architecture

### Core Configuration Files
- **`.bashrc`** - Main bash configuration with history, prompt, and shell options
- **`.bash_aliases`** - 100+ aliases organized by category (system, git, docker, development)
- **`.vimrc`** - Comprehensive vim setup with plugins and keybindings

### Alias Organization
Aliases are categorized and consistently documented:
- **System administration** - Package management, process monitoring, network tools
- **Git workflows** - Shortcuts for common git operations (gs, gp, ga, gc, etc.)
- **Docker operations** - Container management and development workflows
- **Navigation** - Directory shortcuts (cdg, cdd, cdc for ~/git, ~/git/data, ~/.claude)
- **Development tools** - Devcontainer management, VPN connections, Python environments

### Testing Framework
- **`run_tests.sh`** - Main test runner with colored output and comprehensive reporting
- **`tests/`** directory contains individual test suites for each configuration component
- Tests validate syntax, functionality, and alias definitions

### Setup Automation
- **`setup-new-machine.sh`** - Installs complete development environment including:
  - Docker, Node.js (via NVM), Python packages
  - Development tools (VS Code, kubectl, helm)
  - npm globals (@anthropic-ai/claude-code, @devcontainers/cli)
  - Manual applications (1Password, Chrome, Zoom)

## Alias Standards

All aliases follow consistent format: `alias command='actual_command' # Description of what it does`

When adding new aliases:
- Include descriptive comments
- Group by logical category
- Test functionality before committing
- Follow existing naming conventions (e.g., `dc-` prefix for docker commands)

## File Installation Process

Configuration files are symlinked or copied to home directory:
- `.bashrc` → `~/.bashrc`
- `.bash_aliases` → `~/.bash_aliases` 
- `.vimrc` → `~/.vimrc`

Always backup existing configurations before installation.