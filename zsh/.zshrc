# If you come from bash you might have to change your $PATH.
export PATH=~/.local/bin:$HOME/bin:/usr/local/bin:$PATH
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -d /opt/homebrew && eval "$(/opt/homebrew/bin/brew shellenv)"

# Set the PYENV_ROOT variable to point to the location of Pyenv
export PYENV_ROOT="$HOME/.pyenv"

# Check if pyenv command is available, if not, add Pyenv binary directory to PATH
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

# Initialize pyenv into the shell session
eval "$(pyenv init -)"

# Initialize pyenv-virtualenv plugin into the shell session
eval "$(pyenv virtualenv-init -)"

source $HOME/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle "MichaelAquilina/zsh-you-should-use"
antigen bundle Aloxaf/fzf-tab

# Load the theme
antigen theme romkatv/powerlevel10k

# Tell antigen that you're done
antigen apply

bindkey '\t\t' autosuggest-accept

export PATH="$PATH:/Users/jamiewhite/.local/bin"
export EDITOR="vim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load Claude API key from private config
[ -f ~/.claude_env ] && source ~/.claude_env
