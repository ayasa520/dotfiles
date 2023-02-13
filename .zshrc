# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

#export GPG_TTY=$(tty)
export GPG_TTY=$TTY

# Zap/ install at https://github.com/zap-zsh/zap
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "agkozak/zsh-z"
plug "esc/conda-zsh-completion"
plug "zap-zsh/sudo"
plug "romkatv/zsh-prompt-benchmark"
plug "zsh-users/zsh-history-substring-search"

export MAKEFLAGS="-j$(expr $(nproc) \+ 1)" 
export SHELL="/bin/zsh"
export PATH=$PATH:$HOME/Applications/
source /usr/share/nvm/init-nvm.sh


export HISTORY_SUBSTRING_SEARCH_PREFIXED=true
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# alias
alias obs="env __NV_PRIME_RENDER_OFFLOAD=0 __GLX_VENDOR_LIBRARY_NAME='' __VK_LAYER_NV_optimus='' obs"
alias yay="paru"
alias telegram-desktop="env QT_QPA_PLATFORM=xcb __NV_PRIME_RENDER_OFFLOAD=0 __GLX_VENDOR_LIBRARY_NAME='' __VK_LAYER_NV_optimus='' telegram-desktop"
alias typora="__GLX_VENDOR_LIBRARY_NAME=''  typora"

# eval "$(starship init zsh)"
eval "$(pyenv virtualenv-init - | sed s/precmd/chpwd/g)"
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/mytheme.omp.json)"
# key binding
bindkey -e
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[3;5~' kill-word
bindkey '^H' backward-kill-word
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word
