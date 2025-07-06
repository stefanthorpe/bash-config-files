# Vim Configuration Documentation

<!-- TOOLTIP:MAIN_INDEX:Comprehensive vim configuration with 50+ plugins, custom mappings, and productivity enhancements -->

## Table of Contents

1. [Quick Reference](#quick-reference)
2. [Plugin Categories](#plugin-categories)
3. [Key Mappings](#key-mappings)
4. [Custom Commands](#custom-commands)
5. [Functions Reference](#functions-reference)
6. [Configuration Tips](#configuration-tips)
7. [Programmatic Access](#programmatic-access)

---

## Quick Reference

<!-- TOOLTIP:QUICK_REF:Essential shortcuts and commands for daily vim usage -->

### Essential Shortcuts
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>` | Leader Key | Primary leader for custom mappings |
| `<Space>e` | NERDTree | Toggle file explorer |
| `<Space>s` | Save | Quick save current file |
| `<Space>z` | Zoom | Toggle window zoom/unzoom |
| `ga` | EasyAlign | Start interactive alignment |
| `gcc` | Comment | Toggle line comment |

### Function Keys
| Key | Action | Plugin/Feature |
|-----|--------|----------------|
| `F5` | Run Script | Execute current file |
| `F6` | Run + Output | Execute with output window |
| `F8` | Color Scheme | Cycle through color schemes |
| `F9` | Paste Toggle | Toggle paste mode |
| `F11` | Tagbar | Toggle code outline |

---

## Plugin Categories

<!-- TOOLTIP:PLUGINS:50+ carefully selected plugins organized by functionality -->

### Base/Core Plugins
<!-- TOOLTIP:BASE_PLUGINS:Essential plugins from junegunn and tpope for core functionality -->

| Plugin | Purpose | Key Features |
|--------|---------|--------------|
| `junegunn/vim-plug` | Plugin Manager | Fast, parallel plugin installation |
| `junegunn/vim-emoji` | Emoji Support | `:dog:` → 🐶 conversion |
| `junegunn/vim-peekaboo` | Register Preview | Shows register contents |
| `junegunn/goyo.vim` | Distraction-free | Writing mode |
| `junegunn/limelight.vim` | Focus Mode | Highlight current paragraph |

### Editing & Motion
<!-- TOOLTIP:EDITING:Advanced text editing and movement capabilities -->

| Plugin | Purpose | Key Mappings | Features |
|--------|---------|--------------|----------|
| `tpope/vim-surround` | Surround Text | `cs"'`, `ds"`, `ysiw"` | Change/delete/add surroundings |
| `tpope/vim-commentary` | Comments | `gcc`, `gc` | Toggle comments |
| `tpope/vim-repeat` | Repeat Actions | `.` | Enhanced repeat functionality |
| `terryma/vim-multiple-cursors` | Multiple Cursors | `<C-n>` | Edit multiple locations |
| `junegunn/vim-easy-align` | Text Alignment | `ga=`, `ga:` | Align text by delimiters |
| `bkad/CamelCaseMotion` | CamelCase Motion | `<S-W>`, `<S-B>`, `<S-E>` | Navigate CamelCase words |
| `AndrewRadev/switch.vim` | Value Switching | `gs` | Toggle true/false, etc. |
| `SirVer/ultisnips` | Snippets | `<Tab>` | Code snippet expansion |

### File & Project Navigation
<!-- TOOLTIP:NAVIGATION:Efficient file browsing and project navigation tools -->

| Plugin | Purpose | Key Mappings | Features |
|--------|---------|--------------|----------|
| `scrooloose/nerdtree` | File Tree | `<Space>e` | File explorer sidebar |
| `Shougo/unite.vim` | Fuzzy Finder | `<Space><Space>` | Universal interface |
| `majutsushi/tagbar` | Code Outline | `F11` | Function/class browser |
| `Shougo/neomru.vim` | Recent Files | `[unite]m` | Most recently used files |
| `Shougo/unite-outline` | File Outline | `[unite]o` | Navigate file structure |

### Git Integration
<!-- TOOLTIP:GIT:Comprehensive git workflow integration -->

| Plugin | Purpose | Key Mappings | Features |
|--------|---------|--------------|----------|
| `tpope/vim-fugitive` | Git Interface | `<Space>g*` | Full git workflow |
| `mhinz/vim-signify` | Git Signs | - | Show git diff in gutter |
| `junegunn/gv.vim` | Git Log | - | Beautiful git log browser |

#### Git Key Mappings
| Key | Action | Command |
|-----|--------|---------|
| `<Space>g` | Git Prompt | `:Git ` |
| `<Space>gb` | Git Blame | `:Gblame` |
| `<Space>gc` | Git Commit | `:Gcommit` |
| `<Space>gd` | Git Diff | `:Gdiff` |
| `<Space>gp` | Git Push | `:Git push` |
| `<Space>gs` | Git Status | `:Gstatus` |
| `<Space>ga` | Git Add | `:Gwrite` |

### Language Support
<!-- TOOLTIP:LANGUAGES:Multi-language syntax highlighting and IDE features -->

| Language | Plugins | Features |
|----------|---------|----------|
| **JavaScript** | `pangloss/vim-javascript` | Syntax, indentation |
| **Python** | `Vimjas/vim-python-pep8-indent` | PEP8 compliant indentation |
| **Go** | `fatih/vim-go` | Complete Go development |
| **Markdown** | `plasticboy/vim-markdown` | Enhanced markdown support |
| **CSS/SCSS** | `hail2u/vim-css3-syntax`, `cakebaker/scss-syntax.vim` | Modern CSS support |
| **Docker** | `honza/dockerfile.vim` | Dockerfile syntax |
| **PHP** | `joonty/vim-phpqa` | PHP quality assurance |

### Development Tools
<!-- TOOLTIP:DEV_TOOLS:Code quality, testing, and development workflow tools -->

| Plugin | Purpose | Features |
|--------|---------|----------|
| `scrooloose/syntastic` | Syntax Checking | Real-time error detection |
| `Shougo/neocomplete.vim` | Auto-completion | Intelligent code completion |
| `mbbill/undotree` | Undo History | Visual undo tree (`U`) |
| `tpope/vim-dispatch` | Async Commands | Background task execution |
| `ervandew/supertab` | Tab Completion | Enhanced tab completion |

### Appearance & UI
<!-- TOOLTIP:APPEARANCE:Visual enhancements and theme customization -->

| Plugin | Purpose | Key Mappings | Features |
|--------|---------|--------------|----------|
| `altercation/vim-colors-solarized` | Color Scheme | `F8` | Beautiful color theme |
| `Yggdroot/indentLine` | Indent Guides | - | Visual indentation lines |
| `Valloric/MatchTagAlways` | Tag Matching | - | Highlight matching HTML tags |

---

## Key Mappings

<!-- TOOLTIP:KEYMAPS:Complete reference of all custom key mappings and shortcuts -->

### Leader Key Mappings (`<Space>`)
<!-- TOOLTIP:LEADER_KEYS:Space-based shortcuts for common operations -->

#### File Operations
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>s` | `:update` | Save current file |
| `<Space>w` | `:update` | Alternative save |
| `<Space>q` | `:q` | Quit current window |
| `<Space>Q` | `:qa!` | Force quit all |

#### Navigation & Windows
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>e` | `:NERDTreeToggle` | Toggle file explorer |
| `<Space>z` | Zoom Function | Toggle window zoom |
| `<Space>cd` | `:cd %:p:h` | Change to file directory |

#### Git Operations
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>g` | `:Git ` | Git command prompt |
| `<Space>gb` | `:Gblame` | Git blame current file |
| `<Space>gc` | `:Gcommit` | Git commit |
| `<Space>gd` | `:Gdiff` | Git diff current file |
| `<Space>gp` | `:Git push` | Git push |
| `<Space>gs` | `:Gstatus` | Git status |
| `<Space>ga` | `:Gwrite` | Git add current file |
| `<Space>gg` | Quick Commit | Save, add, commit, push |

#### Search & Replace
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>bs` | Buffer Search | Search across all buffers |
| `<Space>?` | Google Search | Search selected text |
| `<Space>!` | Google Lucky | Feeling lucky search |

#### Claude AI Integration
<!-- TOOLTIP:CLAUDE_AI:AI-powered code analysis and review features -->
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>ca` | Claude Analyze | Analyze current file |
| `<Space>cr` | Claude Review | Review code for improvements |
| `<Space>co` | Claude Open | Open Claude in terminal |

### Movement & Navigation
<!-- TOOLTIP:MOVEMENT:Enhanced movement and navigation commands -->

#### Window/Tab Management
| Key | Action | Description |
|-----|--------|-------------|
| `<Tab>` | `<C-w>w` | Next window |
| `<S-Tab>` | `<C-w>W` | Previous window |
| `]t` | `:tabn` | Next tab |
| `[t` | `:tabp` | Previous tab |
| `]b` | `:bnext` | Next buffer |
| `[b` | `:bprev` | Previous buffer |

#### Line Movement
| Key | Action | Description |
|-----|--------|-------------|
| `<C-k>` | Move line up | Move current line up |
| `<C-j>` | Move line down | Move current line down |
| `<C-h>` | Indent left | Decrease indentation |
| `<C-l>` | Indent right | Increase indentation |

#### Custom Motions
| Key | Action | Description |
|-----|--------|-------------|
| `gi` | Go to next indent | Move to next indentation level |
| `gpi` | Go to prev indent | Move to previous indentation level |
| `g[` | `:pop` | Pop tag stack |

### Text Objects
<!-- TOOLTIP:TEXT_OBJECTS:Custom text objects for precise text selection -->

#### Standard Text Objects
| Key | Action | Description |
|-----|--------|-------------|
| `ii` | Inner indent | Select same indentation level |
| `ai` | Around indent | Select indent + surrounding |
| `io` | Indent object | Strictly same indentation |
| `ie` | Entire file | Select entire file |
| `il` | Inner line | Select line content |
| `i#` | Inner comment | Select comment block |

#### Character-based Objects
| Key | Action | Description |
|-----|--------|-------------|
| `i_` | Inside underscores | Text between underscores |
| `a_` | Around underscores | Include underscores |
| `i.` | Inside dots | Text between dots |
| `a.` | Around dots | Include dots |
| `i,` | Inside commas | Text between commas |
| `a,` | Around commas | Include commas |
| `i/` | Inside slashes | Text between slashes |
| `a/` | Around slashes | Include slashes |

#### Blockwise Column Objects
| Key | Action | Description |
|-----|--------|-------------|
| `ic` | Inner column word | Column-wise word selection |
| `iC` | Inner column WORD | Column-wise WORD selection |
| `ac` | Around column word | Include surrounding whitespace |
| `aC` | Around column WORD | Include surrounding whitespace |

### Function Keys
<!-- TOOLTIP:FUNCTION_KEYS:F1-F12 key assignments for quick access -->

| Key | Action | Description |
|-----|--------|-------------|
| `F5` | Run Script | Execute current file |
| `F6` | Run + Output | Execute with output window |
| `F8` | Color Scheme | Cycle through available themes |
| `F9` | Paste Toggle | Toggle paste mode |
| `F11` | Tagbar | Toggle code outline sidebar |

### Insert Mode Mappings
<!-- TOOLTIP:INSERT_MODE:Productivity shortcuts while in insert mode -->

| Key | Action | Description |
|-----|--------|-------------|
| `<C-s>` | Save | Save file from insert mode |
| `<C-h>` | Move left | Cursor movement |
| `<C-l>` | Move right | Cursor movement |
| `<C-j>` | Move down | Cursor movement |
| `<C-k>` | Move up | Cursor movement |

### Visual Mode Enhancements
<!-- TOOLTIP:VISUAL_MODE:Enhanced visual selection and manipulation -->

| Key | Action | Description |
|-----|--------|-------------|
| `<` | Indent left | Keep selection after indent |
| `>` | Indent right | Keep selection after indent |
| `<C-k>` | Move up | Move selected lines up |
| `<C-j>` | Move down | Move selected lines down |

---

## Custom Commands

<!-- TOOLTIP:COMMANDS:User-defined commands for specialized operations -->

### File Operations
| Command | Purpose | Usage |
|---------|---------|-------|
| `:Root` | Change to git root | Navigate to repository root |
| `:EX` | Make executable | Add execute permission |
| `:Chomp` | Remove trailing spaces | Clean up whitespace |

### Development Tools
| Command | Purpose | Usage |
|---------|---------|-------|
| `:CSBuild` | Build cscope database | Create code navigation database |
| `:Todo` | Find TODO items | Search for TODO/FIXME/XXX |
| `:A` | Alternate file | Switch between .h/.c files |

### Utilities
| Command | Purpose | Usage |
|---------|---------|-------|
| `:Profile` | Performance profiling | Debug vim performance |
| `:Shuffle` | Shuffle lines | Randomize selected lines |
| `:HL` | Highlight info | Show syntax group under cursor |

### Tmux Integration
| Command | Purpose | Usage |
|---------|---------|-------|
| `:TX` | Tmux command | Execute in tmux split |
| `!!` | Quick tmux | Shortcut for :TX |

---

## Functions Reference

<!-- TOOLTIP:FUNCTIONS:Custom vim functions for advanced operations -->

### Navigation Functions
| Function | Purpose | Features |
|----------|---------|----------|
| `s:zoom()` | Window zoom toggle | Maximize/restore window |
| `s:go_indent()` | Indent navigation | Move by indentation level |
| `s:root()` | Git root navigation | Change to repository root |

### Text Manipulation
| Function | Purpose | Features |
|----------|---------|----------|
| `s:between_the_chars()` | Text object creation | Custom text objects |
| `s:indent_object()` | Indent-based selection | Select by indentation |
| `s:inner_comment()` | Comment block selection | Select comment blocks |

### Development Tools
| Function | Purpose | Features |
|----------|---------|----------|
| `s:run_this_script()` | Script execution | Run current file |
| `s:build_cscope_db()` | Database building | Create cscope database |
| `s:todo()` | TODO finder | Find TODO items in project |

### UI Enhancements
| Function | Purpose | Features |
|----------|---------|----------|
| `s:rotate_colors()` | Color scheme cycling | Switch between themes |
| `MyStatusLine()` | Status line customization | Enhanced status display |
| `s:goyo_enter/leave()` | Distraction-free mode | Writing mode toggle |

---

## Configuration Tips

<!-- TOOLTIP:TIPS:Best practices and optimization suggestions -->

### Performance Optimization
- `set lazyredraw` - Don't redraw during macros
- `set ttyfast` - Fast terminal connection
- `synmaxcol=1000` - Limit syntax highlighting

### Backup & Undo
- Persistent undo with `undofile`
- Organized backup directories
- Swap file management

### Clipboard Integration
- `set clipboard=unnamed` - System clipboard integration
- Cross-platform compatibility

### Security Features
- `set cryptmethod=blowfish2` - Strong encryption
- Safe temp file handling

---

## Programmatic Access

<!-- TOOLTIP:PROGRAMMATIC:Tools and methods for automated configuration management -->

### Tooltip Extraction
```bash
# Extract all tooltips from this documentation
grep -o 'TOOLTIP:[^:]*:[^-]*' VIM_CONFIG_README.md

# Get tooltips for specific section
grep -A1 'TOOLTIP:PLUGINS:' VIM_CONFIG_README.md
```

### Plugin Management
```vim
" List all installed plugins
:echo keys(g:plugs)

" Check plugin status
:PlugStatus

" Update all plugins
:PlugUpdate
```

### Key Mapping Discovery
```vim
" List all mappings
:map

" List leader mappings
:map <leader>

" Check specific mapping
:verbose map <F5>
```

### Configuration Validation
```vim
" Check if plugin is loaded
:echo has_key(g:plugs, 'plugin-name')

" Verify setting values
:set number?
:set background?
```

---

## Installation & Setup

<!-- TOOLTIP:SETUP:Quick start guide for vim configuration -->

### Prerequisites
- Vim 7.4+ or Neovim
- Git for plugin management
- Optional: ag/ripgrep for searching

### Quick Setup
1. Backup existing `.vimrc`
2. Copy this configuration
3. Install vim-plug
4. Run `:PlugInstall`
5. Restart vim

### External Dependencies
- `cscope` - Code navigation
- `ag` or `ripgrep` - Fast searching  
- `tmux` - Terminal multiplexer integration
- `git` - Version control integration

---

*Generated automatically from .vimrc analysis*
*Last updated: $(date)*
