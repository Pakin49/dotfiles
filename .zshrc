# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="cloud"  #powerlevel10k/powerlevel10k

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-interactive-cd)
source $ZSH/oh-my-zsh.sh

# User configuration
# ------------ user install application ------------
export PATH="$PATH:$HOME/.local/bin"

# ------------ Neovim ------------
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
alias vim='nvim'
export SUDO_EDITOR=/usr/bin/nvim
export EDITOR=/usr/bin/nvim

# ------------ Fuzzy finder ------------
# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"
alias fzf='fzf --preview "bat --color=always --style=full --line-range=:500 {}"'

# ------------ Eza : better ls ------------
export EZA_CONFIG_DIR="$HOME/.config/eza"
alias ls='eza --color=always --long'
DISABLE_LS_COLORS="true" # to show the correct theme disable LS_COLORS 

# ------------ Zoxide: better cd------------
eval "$(zoxide init zsh)" #"--cmd cd" add this before zsh to remap cd to z
cd_ls(){
  z "$@" && ls
}
alias cd=cd_ls

# ------------ Bat : better cat------------
alias cat='bat --style=plain'
export BAT_THEME=OneHalfDark
# Man page
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"
# use bat for help
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
# ------------ History ------------
HISTSIZE=3000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# ------------ Custom alias ------------
alias ll='ls -al'
alias dot='z ~/.dotfiles && ll'
alias conf='z ~/.dotfiles/.config && ll'
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd)

# ------------ Starship ------------
eval "$(starship init zsh)"

# ------------ Yazi -----------------
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

#script
alias mimi="source $HOME/scripts/mimi.sh"
export PATH=$PATH:$HOME/scripts
