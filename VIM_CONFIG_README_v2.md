# 🚀 Vim Configuration Guide

> **Complete reference for a powerful vim setup with 50+ plugins, custom workflows, and productivity shortcuts**

<!-- TIP:MAIN:This comprehensive vim configuration transforms vim into a modern IDE with powerful shortcuts and workflows -->

---

## 📖 Table of Contents

| Section | What You'll Learn | Essential For |
|---------|-------------------|---------------|
| [🎯 Essential Shortcuts](#-essential-shortcuts) | Core vim productivity keys | Daily usage |
| [📁 File Workflows](#-file-workflows) | File operations and navigation | Project work |
| [✏️ Editing Workflows](#️-editing-workflows) | Text manipulation and formatting | Content creation |
| [🔀 Git Workflows](#-git-workflows) | Complete git integration | Version control |
| [⚡ Development Workflows](#-development-workflows) | Code development features | Programming |
| [🔧 Plugin Reference](#-plugin-reference) | All plugins organized by purpose | Customization |
| [⚙️ Advanced Features](#️-advanced-features) | Power user shortcuts and functions | Mastery |

---

## 🎯 Essential Shortcuts

<!-- TIP:SHORTCUT:<Space>:Leader key - your gateway to all custom shortcuts -->

### Quick Start (Learn These First!)

| Shortcut | Action | Workflow | Description |
|----------|--------|----------|-------------|
| `<Space>` | **Leader Key** | Core | 🔑 Your gateway to all custom shortcuts |
| `<Space>s` | **Save** | File | 💾 Quick save without leaving current mode |
| `<Space>e` | **File Explorer** | Navigation | 📁 Toggle NERDTree file browser |
| `<Space>z` | **Zoom** | Window | 🔍 Focus on current file (zoom in/out) |
| `gcc` | **Comment** | Editing | 💬 Toggle line comment |
| `ga=` | **Align** | Editing | ⚡ Align text by equals signs |

<!-- TIP:WORKFLOW:SAVE:Press <Space>s anytime to save your work instantly -->

### Essential Movement

| Shortcut | Action | Workflow | Description |
|----------|--------|----------|-------------|
| `<Tab>` | **Next Window** | Navigation | ➡️ Switch to next window/pane |
| `<Shift-Tab>` | **Previous Window** | Navigation | ⬅️ Switch to previous window/pane |
| `]b` | **Next Buffer** | Navigation | 📄 Go to next open file |
| `[b` | **Previous Buffer** | Navigation | 📄 Go to previous open file |
| `]t` | **Next Tab** | Navigation | 🗂️ Switch to next tab |
| `[t` | **Previous Tab** | Navigation | 🗂️ Switch to previous tab |

<!-- TIP:WORKFLOW:NAVIGATION:Use Tab to move between windows, ]b/[b to switch files -->

---

## 📁 File Workflows

### File Operations

| Shortcut | Action | Workflow | Description |
|----------|--------|----------|-------------|
| `<Space>s` | **Save** | File | 💾 Save current file |
| `<Space>w` | **Save Alt** | File | 💾 Alternative save shortcut |
| `<Space>q` | **Quit** | File | ❌ Close current window |
| `<Space>Q` | **Force Quit All** | File | ⚠️ Force quit all windows |
| `<Space>cd` | **Change Dir** | Navigation | 📂 Change to current file's directory |

<!-- TIP:WORKFLOW:FILE:Master <Space>s for saving and <Space>e for file browsing -->

### File Navigation & Search

| Shortcut | Action | Workflow | Description |
|----------|--------|----------|-------------|
| `<Space>e` | **NERDTree** | Navigation | 🌳 Toggle file tree sidebar |
| `<Space><Space>` | **Unite Search** | Navigation | 🔍 Universal fuzzy finder |
| `<Space>bs` | **Buffer Search** | Search | 🔎 Search across all open buffers |
| `F11` | **Code Outline** | Navigation | 📋 Toggle tagbar (function/class browser) |
| `<Space>cd` | **File Directory** | Navigation | 📁 Jump to current file's folder |

<!-- TIP:SHORTCUT:<Space>e:Open file tree to browse your project structure -->
<!-- TIP:SHORTCUT:F11:See all functions and classes in current file -->

### Project Navigation

| Shortcut | Action | Workflow | Description |
|----------|--------|----------|-------------|
| `<Space><Space>f` | **Recent Files** | Navigation | ⏱️ Open recently used files |
| `<Space><Space>b` | **Buffer List** | Navigation | 📄 Quick switch between open files |
| `<Space><Space>o` | **File Outline** | Navigation | 🗂️ Navigate file structure |
| `<Space><Space>t` | **Tags** | Navigation | 🏷️ Jump to code definitions |

---

## ✏️ Editing Workflows

### Text Manipulation

| Shortcut | Action | Workflow | Description |
|----------|--------|----------|-------------|
| `gcc` | **Toggle Comment** | Editing | 💬 Comment/uncomment current line |
| `gc` | **Comment Block** | Editing | 💬 Comment selected text |
| `ga=` | **Align Equals** | Formatting | ⚡ Align text by = signs |
| `ga:` | **Align Colons** | Formatting | ⚡ Align text by : signs |
| `ga,` | **Align Commas** | Formatting | ⚡ Align text by commas |

<!-- TIP:WORKFLOW:EDITING:Select text and use ga= to align code beautifully -->

### Advanced Text Objects

| Shortcut | Action | Workflow | Description |
|----------|--------|----------|-------------|
| `ii` | **Same Indent** | Selection | 📐 Select text at same indentation |
| `ai` | **Around Indent** | Selection | 📐 Select indentation + surrounding |
| `ie` | **Entire File** | Selection | 📄 Select entire file content |
| `il` | **Inner Line** | Selection | ➖ Select line content (no whitespace) |
| `i_` | **Inside Underscores** | Selection | 🔤 Select text between _ characters |
| `i"` | **Inside Quotes** | Selection | 💬 Select text between quotes |

<!-- TIP:SHORTCUT:ii:Select all text at the same indentation level -->

### Line Manipulation

| Shortcut | Action | Workflow | Description |
|----------|--------|----------|-------------|
| `<Ctrl-k>` | **Move Line Up** | Editing | ⬆️ Move current line up |
| `<Ctrl-j>` | **Move Line Down** | Editing | ⬇️ Move current line down |
| `<Ctrl-h>` | **Unindent** | Formatting | ⬅️ Decrease indentation |
| `<Ctrl-l>` | **Indent** | Formatting | ➡️ Increase indentation |
| `Y` | **Yank Line** | Editing | 📋 Copy from cursor to end of line |

<!-- TIP:WORKFLOW:LINE:Use Ctrl+j/k to move lines up/down quickly -->

---

## 🔀 Git Workflows

### Essential Git Operations

| Shortcut | Action | Workflow | Description |
|----------|--------|----------|-------------|
| `<Space>gs` | **Git Status** | Git | 📊 View repository status |
| `<Space>ga` | **Git Add** | Git | ➕ Stage current file |
| `<Space>gc` | **Git Commit** | Git | 💾 Commit staged changes |
| `<Space>gp` | **Git Push** | Git | ⬆️ Push commits to remote |
| `<Space>gd` | **Git Diff** | Git | 🔍 View file differences |
| `<Space>gb` | **Git Blame** | Git | 👤 See who changed each line |

<!-- TIP:WORKFLOW:GIT:Quick git workflow: <Space>ga → <Space>gc → <Space>gp -->

### Advanced Git Features

| Shortcut | Action | Workflow | Description |
|----------|--------|----------|-------------|
| `<Space>g` | **Git Command** | Git | ⌨️ Enter any git command |
| `<Space>gr` | **Git Remove** | Git | ❌ Remove file from git |
| `<Space>gg` | **Quick Commit** | Git | 🚀 Save, add, commit, and push in one step |

<!-- TIP:SHORTCUT:<Space>gg:Ultimate shortcut - saves, commits, and pushes in one command -->

### Git Navigation

| Feature | Description | Usage |
|---------|-------------|-------|
| **Git Signs** | Visual indicators in gutter | See additions/deletions at a glance |
| **Git Log Browser** | Beautiful commit history | Navigate project timeline |
| **Fugitive Integration** | Full git workflow in vim | Complete git operations without leaving editor |

---

## ⚡ Development Workflows

### Code Execution

| Shortcut | Action | Workflow | Description |
|----------|--------|----------|-------------|
| `F5` | **Run Script** | Development | ▶️ Execute current file |
| `F6` | **Run + Output** | Development | ▶️ Execute with dedicated output window |
| `<Space>ca` | **Claude Analyze** | AI | 🤖 AI-powered code analysis |
| `<Space>cr` | **Claude Review** | AI | 🤖 AI code review and suggestions |
| `<Space>co` | **Claude Terminal** | AI | 🤖 Open Claude in terminal |

<!-- TIP:SHORTCUT:F5:Quick way to test your scripts and see results instantly -->
<!-- TIP:WORKFLOW:AI:Use <Space>ca to get AI insights on your code -->

### Code Navigation

| Shortcut | Action | Workflow | Description |
|----------|--------|----------|-------------|
| `<Ctrl-]>` | **Go to Definition** | Navigation | 🎯 Jump to function/variable definition |
| `g[` | **Go Back** | Navigation | ⬅️ Return from definition jump |
| `<Space><Space>t` | **Find Tags** | Navigation | 🏷️ Search for code symbols |
| `F11` | **Function List** | Navigation | 📋 Browse all functions in file |

### Testing & Quality

| Feature | Description | Integration |
|---------|-------------|-------------|
| **Syntastic** | Real-time syntax checking | Highlights errors as you type |
| **Linting** | Code quality checks | Multiple language support |
| **Auto-completion** | Intelligent code completion | Context-aware suggestions |

---

## 🔧 Plugin Reference

### 🎯 Essential Plugins (Must-Have)

| Plugin | Purpose | Key Features | Shortcuts |
|--------|---------|--------------|-----------|
| **vim-plug** | Plugin Manager | Fast, parallel installation | `:PlugInstall`, `:PlugUpdate` |
| **NERDTree** | File Explorer | Project navigation | `<Space>e` |
| **vim-fugitive** | Git Integration | Complete git workflow | `<Space>g*` commands |
| **vim-surround** | Text Surrounding | Change quotes, brackets | `cs"'`, `ds"`, `ysiw"` |
| **vim-commentary** | Smart Comments | Language-aware commenting | `gcc`, `gc` |

<!-- TIP:PLUGIN:vim-surround:Change surrounding quotes with cs"' or add them with ysiw" -->

### ✏️ Editing Enhancement Plugins

| Plugin | Purpose | Key Features | Shortcuts |
|--------|---------|--------------|-----------|
| **vim-easy-align** | Text Alignment | Align by any character | `ga=`, `ga:`, `ga,` |
| **vim-multiple-cursors** | Multi-cursor Editing | Edit multiple locations | `<Ctrl-n>` |
| **ultisnips** | Code Snippets | Expandable code templates | `<Tab>` |
| **vim-repeat** | Enhanced Repeat | Better `.` command | `.` |
| **undotree** | Undo Visualization | Visual undo history | `U` |

### 🎨 Visual Enhancement Plugins

| Plugin | Purpose | Key Features | Shortcuts |
|--------|---------|--------------|-----------|
| **vim-colors-solarized** | Color Scheme | Beautiful, eye-friendly colors | `F8` to cycle |
| **limelight** | Focus Mode | Highlight current paragraph | Works with Goyo |
| **goyo** | Distraction-free Writing | Clean writing environment | `<Space>G` |
| **indentLine** | Indent Guides | Visual indentation helpers | Auto-enabled |

### 🌐 Language Support Plugins

| Language | Plugins | Features |
|----------|---------|----------|
| **JavaScript** | vim-javascript | Syntax, indentation, ES6+ |
| **Python** | vim-python-pep8-indent | PEP8 compliant indentation |
| **Go** | vim-go | Complete Go development suite |
| **Markdown** | vim-markdown | Enhanced markdown support |
| **CSS/SCSS** | css3-syntax, scss-syntax | Modern CSS features |
| **Docker** | dockerfile.vim | Dockerfile syntax highlighting |

---

## ⚙️ Advanced Features

### 🔧 Window Management

| Shortcut | Action | Workflow | Description |
|----------|--------|----------|-------------|
| `<Space>z` | **Zoom Toggle** | Window | 🔍 Maximize/restore current window |
| `25` | **25% Width** | Window | 📏 Set window to 25% width |
| `50` | **Equal Width** | Window | ⚖️ Make all windows equal size |
| `75` | **75% Width** | Window | 📏 Set window to 75% width |
| `<Ctrl-w><Space>` | **Resize** | Window | 📐 Increase window width by 5 |

<!-- TIP:WORKFLOW:WINDOW:Use <Space>z to focus on one file, then again to restore layout -->

### 🎹 Function Keys Reference

| Key | Primary Action | Secondary Action | Context |
|-----|---------------|------------------|---------|
| `F5` | **Run Script** | Execute current file | Development |
| `F6` | **Run + Output** | Execute with output window | Development |
| `F8` | **Color Scheme** | Cycle through themes | Customization |
| `F9` | **Paste Mode** | Toggle paste mode | Editing |
| `F11` | **Code Outline** | Toggle tagbar | Navigation |

### 🔍 Search & Replace Workflows

| Operation | Shortcut Sequence | Description |
|-----------|------------------|-------------|
| **Project Search** | `<Space>bs` | Search across all open files |
| **Quick Replace** | `:%s/old/new/g` | Replace in current file |
| **Interactive Replace** | `:%s/old/new/gc` | Confirm each replacement |
| **Google Search** | `<Space>?` | Search selected text online |

### 📝 Custom Commands Reference

| Command | Purpose | Usage Example |
|---------|---------|---------------|
| `:Root` | Change to git root | Navigate to project root |
| `:Todo` | Find TODO items | Search for TODO/FIXME/XXX |
| `:Chomp` | Remove trailing spaces | Clean up whitespace |
| `:EX` | Make executable | Add execute permission |
| `:Profile` | Performance profiling | Debug vim performance |

---

## 🚀 Learning Paths

### 🌱 Beginner (Start Here)
1. **Master the Leader Key**: Learn `<Space>` + essential shortcuts
2. **File Operations**: `<Space>s` (save), `<Space>e` (explorer), `<Space>q` (quit)
3. **Basic Navigation**: Tab switching, buffer navigation
4. **Essential Editing**: `gcc` (comment), `ga=` (align)

### 🌿 Intermediate
1. **Git Integration**: Master the `<Space>g*` workflow
2. **Advanced Text Objects**: `ii`, `ai`, custom selections
3. **Multi-window Workflow**: Window management and zoom
4. **Plugin Customization**: Understand plugin shortcuts

### 🌳 Advanced
1. **Custom Functions**: Create your own shortcuts
2. **Workflow Automation**: Chain commands efficiently
3. **Language-specific Features**: Master language plugins
4. **Performance Optimization**: Configure for your needs

---

## 💡 Pro Tips

### ⚡ Speed Tips
- **Use `<Space>gg`** for instant commit+push workflow
- **Master text objects** like `ii` and `ai` for faster selection
- **Learn the `.` command** to repeat your last action
- **Use `F5/F6`** to test code without leaving vim

### 🎯 Productivity Workflows
1. **File Workflow**: `<Space>e` → navigate → edit → `<Space>s` → `<Space>gs`
2. **Git Workflow**: `<Space>ga` → `<Space>gc` → `<Space>gp`
3. **Code Workflow**: Edit → `F5` → fix → `<Space>ca` → improve
4. **Search Workflow**: `<Space><Space>` → find → edit → save

### 🔧 Customization Tips
- **Tooltip System**: Every section has embedded tips for automation
- **Plugin Management**: Use `:PlugInstall` and `:PlugUpdate` regularly
- **Color Schemes**: Press `F8` to cycle and find your preference
- **AI Integration**: Leverage Claude commands for code improvement

---

## 🛠️ Installation & Setup

### Quick Setup
1. **Backup existing config**: `mv ~/.vimrc ~/.vimrc.backup`
2. **Install vim-plug**: Follow official installation guide
3. **Copy configuration**: Use this .vimrc
4. **Install plugins**: Open vim, run `:PlugInstall`
5. **Restart vim**: Enjoy your enhanced setup!

### Dependencies
- **cscope**: Code navigation and indexing
- **ag/ripgrep**: Fast text searching
- **git**: Version control integration
- **tmux**: Terminal multiplexer integration (optional)

---

## 📚 Quick Reference Cards

### Essential Daily Shortcuts
```
<Space>s  → Save file
<Space>e  → File explorer
<Space>z  → Zoom window
gcc       → Toggle comment
ga=       → Align by equals
F5        → Run script
```

### Git Workflow
```
<Space>gs → Git status
<Space>ga → Git add file
<Space>gc → Git commit
<Space>gp → Git push
<Space>gd → Git diff
```

### Navigation
```
Tab       → Next window
]b        → Next buffer
F11       → Code outline
<Space>cd → Change directory
```

---

*🤖 Generated with comprehensive analysis of vim configuration*  
*📝 Last updated: 2024 - Structured for maximum productivity*

<!-- TIP:FINAL:This configuration transforms vim into a powerful IDE - start with the essential shortcuts and gradually learn more advanced features -->