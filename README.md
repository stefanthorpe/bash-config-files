# bash-config-files

A collection of shell and vim configuration files for Linux/Unix systems, providing useful aliases, settings, and customizations for a better command-line experience.

## Files Included

- **`.bashrc`** - Main bash configuration with history settings, prompt customization, and shell options
- **`.bash_aliases`** - Collection of useful command aliases for system administration and productivity
- **`.vimrc`** - Comprehensive vim configuration with plugins, themes, and editor enhancements
- **`.gitignore`** - Git ignore patterns for common temporary and system files

## Features

### Bash Aliases
- Package management shortcuts for Debian/Ubuntu systems (`install`, `remove`, `upgrade`)
- Enhanced `ls` commands with colors and detailed listings (`ll`, `la`)
- System administration aliases (sudo-enabled commands for non-root users)
- Directory navigation improvements

### Vim Configuration
- Extensive plugin management via vim-plug
- Modern editing features and syntax highlighting
- Custom key mappings and productivity enhancements
- Cross-platform compatibility (Linux/macOS)

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/bash-config-files.git
   cd bash-config-files
   ```

2. Backup your existing configuration files:
   ```bash
   cp ~/.bashrc ~/.bashrc.backup
   cp ~/.bash_aliases ~/.bash_aliases.backup
   cp ~/.vimrc ~/.vimrc.backup
   ```

3. Copy the configuration files to your home directory:
   ```bash
   cp .bashrc ~/.bashrc
   cp .bash_aliases ~/.bash_aliases
   cp .vimrc ~/.vimrc
   ```

4. Reload your shell configuration:
   ```bash
   source ~/.bashrc
   ```

5. Install vim plugins (if using the vim configuration):
   ```bash
   vim +PlugInstall +qall
   ```

## Testing

To verify your configuration files are working correctly, run the test suite:

```bash
./run_tests.sh
```

This will test all configuration files and ensure they are properly formatted and functional.

## Customization

Feel free to modify these configuration files to suit your needs. The files are well-commented to help you understand and customize the settings.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit pull requests with improvements or additional useful configurations.
