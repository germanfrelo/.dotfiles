#!/bin/sh

# IMPORTANT! The order of the followings actions is critical.

echo "Setting up your Mac…"

# --------------------------------------------------

# Zsh framework: Oh My Zsh

# Install the Zsh framework "Oh My Zsh" (if it's not installed).
# Reference: https://github.com/ohmyzsh/ohmyzsh#basic-installation
if test ! $(which omz); then
  echo "Installing the Zsh framework Oh My Zsh…"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# --------------------------------------------------

# Oh My Zsh theme: Powerlevel10k

# Install the Zsh theme "Powerlevel10k" as an Oh My Zsh theme.
# Reference: https://github.com/romkatv/powerlevel10k#oh-my-zsh
echo "Installing the Zsh theme Powerlevel10k…"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# --------------------------------------------------

# Oh My Zsh plugins

echo "\nInstalling Oh My Zsh plugins:"

# zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
echo "\n• Installing zsh-autosuggestions…\n"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-completions
# https://github.com/zsh-users/zsh-completions
echo "\n• Installing zsh-completions…"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

# zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
echo "\n• Installing zsh-syntax-highlighting…"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# --------------------------------------------------

# Homebrew

# Install "Homebrew" (if it's not installed).
if test ! $(which brew); then
  echo "Installing Homebrew…"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # For Macs computers with Apple silicon processors (chips M1, M2, etc.).
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# --------------------------------------------------

# Applications via Brewfile (Homebrew)

# Install all CLI and GUI applications (+ fonts) from the `Brewfile`.
brew bundle --file ./Brewfile

# --------------------------------------------------

# Clone repositories

# Create a projects directories and clone GitHub.
# TODO
# mkdir $HOME/___
# ./clone.sh

# --------------------------------------------------

# Mackup (applications settings + config files)

# Symlink the Mackup config file from this repo to your home directory.
# IMPORTANT! It _must_ be in your home directory. See https://github.com/lra/mackup/blob/master/doc/README.md#configuration.
ln -s ./.mackup.cfg $HOME/.mackup.cfg

# TODO
mackup --version
# Restore (symlink) the config files already from this repo to their corresponding directories.
mackup restore --dry-run --verbose
# mackup restore --verbose

# --------------------------------------------------

# macOS settings

# Set macOS settings.
# IMPORTANT! This must be run last because this will reload the shell.
# TODO
# source ./.macos

# --------------------------------------------------

# Restart your computer

echo "Restart your computer to finalize the process."
