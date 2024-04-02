# Neovim configuration 💻

This is my neovim configuration files, i took inspiration on the dotfiles of `craftzdog` and `josean martinez` for the development of this files🤠

## Installation

There are a few ways you can install this files in your system. **_Note: this configuration files are written on a Mac, so the commands here are going to be only functional in this operative system_**

#### 🔧 1. Pure installation

Just clone the repository

```bash
git clone https://github.com/harelog3/nvim.git

# or if you are not in the ./config directory

git clone https://github.com/harelog3/nvim.git ~/.config/nvim
```

#### 📝 2. Backup your old config files

If you already have a neovim configuration, you can backup them first before cloning

```bash
mv ~/.config/nvim{,.bak}

# this is optional, however for a fresh install, it's recommended to also back them up
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/harelog3/nvim.git ~/.config/nvim

```

#### ❌ 3. Delete your old config files

If you wish to delete the config files you had before, you can also do it running this commands

```bash
rm -rf ~/.config/nvim

# this is optional, however for a fresh install, it's recommended also back them up
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

git clone https://github.com/harelog3/nvim.git ~/.config/nvim

```
