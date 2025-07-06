# Vim Configuration Index

Quick navigation index for the comprehensive vim configuration documentation.

## 📚 Documentation Files

| File | Purpose | Description |
|------|---------|-------------|
| [VIM_CONFIG_README.md](./VIM_CONFIG_README.md) | **Main Documentation** | 🚀 Workflow-based guide with actionable shortcuts and learning paths |
| [VIM_INDEX.md](./VIM_INDEX.md) | **Quick Index** | This navigation file |
| [vim_tooltip_extractor.sh](./vim_tooltip_extractor.sh) | **Tooltip Tool** | Extract and manage documentation tooltips |
| [.vimrc](./.vimrc) | **Configuration** | The actual vim configuration file |

## 🚀 Quick Start

```bash
# View all available tooltip categories
./vim_tooltip_extractor.sh list

# Extract specific tooltips
./vim_tooltip_extractor.sh show --category QUICK_REF

# Search for specific features
./vim_tooltip_extractor.sh search "git"

# Export to different formats
./vim_tooltip_extractor.sh export --format json --output vim_tooltips.json
```

## 📋 Main Sections

### Essential References
- **[Quick Reference](./VIM_CONFIG_README.md#quick-reference)** - Essential shortcuts and commands
- **[Key Mappings](./VIM_CONFIG_README.md#key-mappings)** - Complete key binding reference
- **[Plugin Categories](./VIM_CONFIG_README.md#plugin-categories)** - All 50+ plugins organized by function

### Core Features
- **[Leader Key Mappings](./VIM_CONFIG_README.md#leader-key-mappings-space)** - Space-based shortcuts
- **[Text Objects](./VIM_CONFIG_README.md#text-objects)** - Custom text selection objects
- **[Git Integration](./VIM_CONFIG_README.md#git-integration)** - Git workflow commands
- **[Claude AI Integration](./VIM_CONFIG_README.md#claude-ai-integration)** - AI-powered features

### Development Tools
- **[Language Support](./VIM_CONFIG_README.md#language-support)** - Multi-language features
- **[Custom Commands](./VIM_CONFIG_README.md#custom-commands)** - User-defined commands
- **[Functions Reference](./VIM_CONFIG_README.md#functions-reference)** - Custom vim functions

## 🔧 Programmatic Access

The configuration includes programmatic features for automation:

### Tooltip System
```bash
# List all tooltip categories
./vim_tooltip_extractor.sh list

# Validate tooltip format
./vim_tooltip_extractor.sh validate

# Export as JSON for tooling
./vim_tooltip_extractor.sh export --format json
```

### Plugin Management
```vim
" Check loaded plugins
:echo keys(g:plugs)

" Verify plugin functionality
:PlugStatus
```

### Key Mapping Discovery
```vim
" List all mappings
:map

" Find leader mappings
:map <leader>

" Check specific mapping
:verbose map <F5>
```

## 📊 Configuration Stats

- **50+ Plugins** across 8 categories
- **100+ Custom Key Mappings** for productivity
- **25+ Custom Commands** for specialized tasks
- **15+ Custom Functions** for advanced operations
- **20+ Text Objects** for precise editing
- **Multi-language Support** (Python, Go, JS, etc.)
- **Git Integration** with comprehensive workflow
- **AI Integration** with Claude Code
- **Tmux Integration** for terminal workflow

## 🎯 Plugin Categories Overview

| Category | Count | Key Features |
|----------|-------|--------------|
| **Base/Core** | 5 | Essential functionality (vim-plug, emoji, peekaboo) |
| **Editing** | 8 | Text manipulation (surround, commentary, easy-align) |
| **Navigation** | 5 | File browsing (nerdtree, unite, tagbar) |
| **Git** | 3 | Version control (fugitive, signify, gv) |
| **Languages** | 10+ | Multi-language support (go, python, js, etc.) |
| **Development** | 8 | IDE features (syntastic, neocomplete, undotree) |
| **UI/Appearance** | 4 | Visual enhancements (solarized, indentLine) |
| **Utilities** | 10+ | Specialized tools (tmux, snippets, etc.) |

## 🛠 Tools & Utilities

### Tooltip Extractor Features
- **Multiple Export Formats**: text, JSON, CSV, HTML
- **Category Filtering**: Focus on specific areas
- **Search Functionality**: Find relevant tooltips
- **Validation**: Check format and completeness
- **Programmatic Access**: Automation-friendly

### Documentation Features
- **Structured Organization**: Clear categorization
- **Cross-references**: Easy navigation
- **Examples**: Practical usage examples
- **Performance Tips**: Optimization suggestions
- **Security Notes**: Safe configuration practices

## 📖 Usage Examples

### Quick Actions
```vim
" Essential daily shortcuts
<Space>e    " Toggle file explorer
<Space>s    " Save file
<Space>gs   " Git status
ga=         " Align by equals signs
gcc         " Toggle comment
```

### Advanced Features
```vim
" Text objects
vii         " Select same indentation
va_         " Select around underscores  
vi#         " Select comment block

" Git workflow
<Space>gb   " Git blame
<Space>gd   " Git diff
<Space>gg   " Quick commit & push
```

### AI Integration
```vim
" Claude AI features
<Space>ca   " Analyze current file
<Space>cr   " Review code
<Space>co   " Open Claude terminal
```

---

*This index provides quick access to the comprehensive vim configuration documentation. Use the tooltip extractor for programmatic access to specific sections.*
