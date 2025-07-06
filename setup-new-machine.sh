#!/bin/bash

# New Machine Setup Script
# This script installs manually installed packages from your current system

set -e

echo "🚀 Setting up new machine with your package configuration..."

# Update package list
echo "📦 Updating package list..."
sudo apt update

# Install manually installed apt packages (excluding system defaults)
echo "📦 Installing apt packages..."
APT_PACKAGES=(
    "1password"
    "curl"
    "git"
    "google-chrome-stable"
    "jq"
    "helm"
    "npm"
    "python3-poetry"
    "sops"
    "vim"
    "zoom"
    "docker-ce"
    "docker-ce-cli"
    "docker-buildx-plugin"
    "docker-compose-plugin"
    "containerd.io"
)

# Add Docker GPG key and repository (required for Docker packages)
echo "🐳 Setting up Docker repository..."
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

# Add Google Chrome repository
echo "🌐 Setting up Google Chrome repository..."
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update

# Install apt packages
for package in "${APT_PACKAGES[@]}"; do
    echo "Installing $package..."
    sudo apt install -y "$package" || echo "⚠️  Failed to install $package"
done

# Install NVM (Node Version Manager)
if ! command -v nvm &> /dev/null && [ ! -d "$HOME/.nvm" ]; then
    echo "📦 Installing NVM (Node Version Manager)..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
    
    # Load nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
else
    echo "📦 NVM already installed"
    # Load nvm if it exists
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# Install and use Node.js version
echo "📦 Installing Node.js v22.17.0..."
nvm install 22.17.0
nvm use 22.17.0
nvm alias default 22.17.0

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
    echo "🍺 Homebrew already installed"
fi

# Install Homebrew packages
echo "🍺 Installing Homebrew packages..."
BREW_PACKAGES=(
    "helm"
    "helmfile"
)

for package in "${BREW_PACKAGES[@]}"; do
    echo "Installing $package via brew..."
    brew install "$package" || echo "⚠️  Failed to install $package"
done

# Install snap packages
echo "📦 Installing Snap packages..."
SNAP_PACKAGES=(
    "code --classic"
    "kubectl --classic"
)

for package in "${SNAP_PACKAGES[@]}"; do
    echo "Installing $package via snap..."
    sudo snap install $package || echo "⚠️  Failed to install $package"
done

# Install npm global packages
echo "📦 Installing npm global packages..."
NPM_PACKAGES=(
    "@anthropic-ai/claude-code"
)

for package in "${NPM_PACKAGES[@]}"; do
    echo "Installing $package globally via npm..."
    npm install -g "$package" || echo "⚠️  Failed to install $package"
done

# Install pip packages
echo "🐍 Installing Python packages..."
PIP_PACKAGES=(
    "charset-normalizer==3.4.2"
    "coverage==7.9.2"
    "exceptiongroup==1.3.0"
    "iniconfig==2.1.0"
    "llm-flow-executor==0.1.0"
    "pluggy==1.6.0"
    "Pygments==2.19.2"
    "pytest==8.4.1"
    "pytest-cov==6.2.1"
    "requests==2.32.4"
    "tomli==2.2.1"
    "typing_extensions==4.14.0"
)

for package in "${PIP_PACKAGES[@]}"; do
    echo "Installing $package..."
    pip install --user "$package" || echo "⚠️  Failed to install $package"
done

# Install manual downloads
echo "📱 Installing manual applications..."

# Install 1Password
echo "Installing 1Password..."
if ! command -v 1password &> /dev/null; then
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
    sudo apt update && sudo apt install -y 1password
else
    echo "1Password already installed"
fi

# Install Google Chrome (if not already installed via apt)
echo "Installing Google Chrome..."
if ! command -v google-chrome &> /dev/null; then
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt update && sudo apt install -y google-chrome-stable
else
    echo "Google Chrome already installed"
fi

# Install Zoom
echo "Installing Zoom..."
if ! command -v zoom &> /dev/null; then
    wget -O /tmp/zoom_amd64.deb https://zoom.us/client/latest/zoom_amd64.deb
    sudo dpkg -i /tmp/zoom_amd64.deb || sudo apt-get install -f -y
    rm -f /tmp/zoom_amd64.deb
else
    echo "Zoom already installed"
fi

# Add user to docker group
echo "🐳 Adding user to docker group..."
sudo usermod -aG docker $USER

echo ""
echo "✅ Setup complete!"
echo ""
echo "📝 Manual steps required:"
echo "1. Log out and back in for Docker group membership to take effect"
echo "2. Run ./gnome-terminal-solarized-dark.sh for terminal theme"
echo "3. Configure 1Password and sign in"
echo ""
echo "🎉 Your new machine is ready!"