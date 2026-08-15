# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
export PIPENV_VENV_IN_PROJECT=1

# ALIASES
alias repos="cd ~/repos"
alias fibaro="cd ~/repos/quickapps"
alias lz='lazygit'
alias lg='lazygit'
alias g='git'
alias gst='git status'
alias gcb='git checkout -b'
alias gb='git branch'
alias ga='git add -A'
alias gcm='git commit -m'
alias gpl='git pull'
alias gp='git push'
alias mc='mc --nosubshell'
alias nv='nvim'
alias ls='eza -h --group-directories-first --icons=auto --hyperlink'
alias l='ls -la'
alias n='nvim'

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

ZSH_AUTOSUGGEST_STRATEGY=(history completion)


# DO THE NVIM MAGIC! 
# set -o vi

fcd() {
  local sel dir
  sel="$(
    fd -t d -a -H --exclude .git . \
    | awk -v H="$HOME" '{rp=$0; tp=rp; sub("^" H, "~", tp); printf "%s\t%s\n", tp, rp}' \
    | fzf --prompt='dirs> ' --height 60% --reverse \
          --delimiter='\t' --with-nth=1 \
          --preview 'printf "%s\n\n" {1}; (command -v tree >/dev/null && tree -C -L 1 {2}) || ls -la {2}' \
          --preview-window=up,60%
  )" || return
  dir="$(printf "%s" "$sel" | awk -F '\t' '{print $2}')" || return
  cd -- "$dir"
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}
export EDITOR=nvim

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
fi
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"
