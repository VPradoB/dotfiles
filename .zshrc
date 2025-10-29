export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


alias ls='eza -al --color=always --group-directories-first' # my preferred listing

alias cat='bat'

if [[ -n "$TMUX" && -d ".venv" && -f ".venv/bin/activate" ]]; then
    source ./.venv/bin/activate
    export PYTHONPATH=.
fi

tmux_sessionizer_widget() {
  zle push-line
  BUFFER="/usr/local/bin/tmux-sessionizer"
  zle accept-line
}

zle -N tmux_sessionizer_widget
bindkey '^F' tmux_sessionizer_widget

eval "$(starship init zsh)"
eval "$(ssh-agent)"

. "$HOME/.local/share/../bin/env"

# fnm
FNM_PATH="/home/vprado/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
