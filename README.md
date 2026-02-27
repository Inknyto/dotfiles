# Inknyto's Dotfiles

A collection of configuration files for various Linux environments, managed using [GNU Stow](https://www.gnu.org/software/stow/). This setup is optimized for Arch Linux (including ARM) and features a highly customized Zsh shell, Hyprland WM, and Neovim.

![Arch Linux](arch.png)

## 🚀 Quick Start

### 1. Prerequisites

Ensure you have the following packages installed:

```bash
# Arch Linux
sudo pacman -S stow zsh zoxide git neovim bat fzf base-devel go thefuck
```

**Font:** This setup uses `RobotoMono Nerd Font`. Ensure it is installed for the icons and Powerlevel10k to render correctly.

### 2. Installation

Clone the repository with all submodules:

```bash
git clone --recurse-submodules --depth 1 --shallow-sublmodules https://github.com/Inknyto/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. Deploying with Stow

Use `stow` to symlink the configurations to your home directory:

```bash
# Stow individual components
stow zsh
stow nvim
stow hyprland
stow waybar
stow bin
stow apps

# For system-wide configs (requires sudo)
sudo stow -t / system
```

## 📦 Components

| Directory | Description |
|-----------|-------------|
| `zsh/` | Zsh config with Oh My Zsh, Powerlevel10k, and custom aliases. |
| `nvim/` | Neovim configuration (Lua-based). |
| `hyprland/` | Hyprland Wayland Compositor configuration. |
| `waybar/` | Waybar status bar configuration. |
| `bin/` | Custom utility scripts located in `~/.local/bin`. |
| `apps/` | Miscellaneous app configs (Vimium, Yakuake, Jupyter, Firefox). |
| `bash/` | Standard `.bashrc` fallback. |
| `nano/` | Simple `.nanorc` styling. |
| `screen/` | GNU Screen multiplexer config. |
| `vim/` | Classic `.vimrc` configuration. |
| `system/` | System-level configs (pacman, locale). |

## 🛠️ Included Scripts (`~/.local/bin`)

The `bin` directory contains several useful scripts:

- **Multimedia:** `convert_mp4_to_gif.sh`, `generate_gif.sh`, `generate_qr_code.sh`.
- **System/Maintenance:** `pacman-backup-aur.sh`, `pacman-restore-official.sh`, `nmodkill.sh`.
- **Networking:** `generate_mac_address.sh`, `masscan_entire_internet.sh`.
- **Utilities:** `jqfile.sh`, `json2xlsx.sh`, `replacefile.sh`, `retry.sh`.

## 📱 Specialized Environments

- **`arch-arm/`**: Specific configurations for Arch Linux on ARM devices (e.g., Samsung On7xelte), including CPU modification scripts and ramdisk backups.
- **`centos7-mbaye/`**: Environment-specific configs for CentOS 7, featuring `ble.sh` for enhanced bash interactions.

## ⚙️ Customization

- **Zsh:** Most custom logic is sourced from `~/.nytoshell` and `~/.aliases`. Edit these files to add your own shortcuts.
- **Neovim:** The configuration is split into `core`, `plugins`, and `ui_colors` within the `lua` directory for better maintainability.

## 📝 TODO
- [ ] Clean up repository size (reduce history).
- [ ] Refactor `.zshrc` for better modularity.

---
*Maintained by Inknyto.*
