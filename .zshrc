export ZSH="$HOME/.oh-my-zsh"
export GEMINI_API_KEY=$(<"$HOME/.gemini_key")

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing

alias cat='bat'

if [[ -n "$TMUX" && -d ".venv" && -f ".venv/bin/activate" ]]; then
    source ./.venv/bin/activate
fi

tmux_sessionizer_widget() {
  tmux neww tmux-sessionizer 
}

zle -N tmux_sessionizer_widget
bindkey '^F' tmux_sessionizer_widget

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


eval "$(starship init zsh)"
eval "$(ssh-agent)"
