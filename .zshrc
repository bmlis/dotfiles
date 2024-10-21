# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Prompt
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.toml)"
fi

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit snippet OMZP::asdf
zinit snippet OMZP::aws
zinit snippet OMZP::gh
zinit snippet OMZP::git
zinit snippet OMZL::git.zsh
zinit snippet OMZP::kubectl
zinit snippet OMZP::sudo

# Completions
autoload -U compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory # append instead of override
setopt sharehistory # share history between different windows
setopt hist_ignore_space # adding a space before the command prevents adding it to history - for secrets
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Ignore case on suggestions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # Use ls --color like colors for completion
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' # Preview of the directory

# FZF
eval "$(fzf --zsh)"

# # Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Aliases
alias nzshrc="nvim ~/.zshrc"
alias zshrc="source ~/.zshrc"
alias ls="ls --color"
alias rebuild=" darwin-rebuild switch --flake $HOME/Workspace/dotfiles/.config/nix#mbp"
source $HOME/.aliases

