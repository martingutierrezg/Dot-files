#!/usr/bin/env sh

# Crude and sequential script to install and configure zsh as the main shell on Debian 10.
# Depends on the .dot files found on the root of this repository.
# Uses fzf, zsh-completions, zsh-autosuggestions, and the powerlevel10k zsh theme.
# To convert bash_history to the zsh equivalent see: https://gist.github.com/muendelezaji/c14722ab66b505a49861b8a74e52b274

# Use like:
# git init . && git remote add origin https://github.com/martingutierrezg/zsh-config.git && git pull origin master && chmod +x ./debian_install_zsh.sh && ./debian_install_zsh.sh

# Install zsh
sudo apt install zsh

# Install fzf
sudo apt install fzf

# Install zsh-completions from SUSE's repositories
echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-completions/Debian_Testing/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-completions.list
curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-completions/Debian_Testing/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-completions.gpg > /dev/null
sudo apt update
sudo apt install zsh-completions

# Install zsh-autosuggestions from SUSE's repositories
echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-autosuggestions/Debian_Testing/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-autosuggestions.list
curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/Debian_Testing/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-autosuggestions.gpg > /dev/null
sudo apt update
sudo apt install zsh-autosuggestions

# Change the user's default shell to zsh
chsh -s /usr/bin/zsh

# Change root's default shell to zsh
sudo chsh -s /usr/bin/zsh

# Download powerlevel10k theme (the target dir deviates from the official instructions)
# The theme is sourced on line 9 of ~/.zsh.local
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
