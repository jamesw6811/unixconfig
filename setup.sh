brew install stow
stow *
brew install prettier
brew install nodejs
brew install tree
brew install pyenv
brew install tmux
brew install lazygit
brew install antidote
pip install shell-gpt
pyenv install 3

brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --keep-zshrc
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"
