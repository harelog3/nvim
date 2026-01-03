# Neovim Configuration

My personal Neovim configuration files.

## Installation

There are several ways to install this configuration on your system.

> **Note:** These instructions are written for macOS. Commands may differ on other operating systems.

### Option 1: Fresh Install

If you don't have an existing Neovim configuration, simply clone the repository:

```bash
git clone https://github.com/harelog3/nvim.git ~/.config/nvim
```

### Option 2: Backup Existing Configuration

If you already have a Neovim configuration and want to preserve it, back up your files first:

```bash
# Back up your current config
mv ~/.config/nvim{,.bak}

# Optional: back up Neovim data directories for a completely fresh start
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Clone the new configuration
git clone https://github.com/harelog3/nvim.git ~/.config/nvim
```

### Option 3: Replace Existing Configuration

If you want to completely remove your old configuration before installing:

```bash
# Remove existing config
rm -rf ~/.config/nvim

# Optional: remove Neovim data directories for a completely fresh start
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

# Clone the new configuration
git clone https://github.com/harelog3/nvim.git ~/.config/nvim
```
