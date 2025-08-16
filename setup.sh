brew install stow
stow -t ~ */
brew install prettier
brew install nodejs
brew install tree
brew install tmux
# Install tmux plugins
mkdir -p ~/.config/tmux/plugins
git clone https://github.com/catppuccin/tmux ~/.config/tmux/plugins/catppuccin
git clone https://github.com/tmux-plugins/tmux-battery ~/.config/tmux/plugins/tmux-battery
brew install lazygit
curl -L git.io/antigen > ~/antigen.zsh
brew install fzf
brew install fd
brew install ripgrep
brew install llama.cpp

brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --keep-zshrc
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"
