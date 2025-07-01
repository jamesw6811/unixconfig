brew install stow
stow -t ~ */
brew install prettier
brew install nodejs
brew install tree
brew install tmux
brew install lazygit
curl -L git.io/antigen > ~/antigen.zsh
brew install fzf
brew install fd
brew install ripgrep
pip install shell-gpt
curl -fsSL https://pyenv.run | bash
pyenv install 3

brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --keep-zshrc
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"

# Clone coc-claude-complete for vim
mkdir -p ~/git
git clone https://github.com/jamesw6811/coc-vim-claude-complete.git ~/git/coc-vim-claude-complete
