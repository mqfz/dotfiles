export XDG_CONFIG_HOME="$(dirname "$ZDOTDIR")"
export XDG_CACHE_HOME="$HOME/.local/cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

mkifnot() { [ -d "$1" ] || mkdir -p "$1" }

alias ls="ls --color=auto"
alias disablesleep="sudo pmset disablesleep 1"
alias enablesleep="sudo pmset disablesleep 0"

export PATH="/opt/homebrew/bin:$PATH"

export TEXMFHOME="$XDG_CONFIG_HOME/texmf"
export PATH="$PATH:/Library/TeX/bin"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

mkifnot "$XDG_STATE_HOME/python"
export PYTHON_HISTORY="$XDG_STATE_HOME/python/history"

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PATH="$PATH:$(brew --prefix rustup)/bin"

mkifnot "$XDG_STATE_HOME/zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"

mkifnot "$XDG_STATE_HOME/less"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"

export HOMEBREW_NO_AUTO_UPDATE=1

if [[ -r "${XDG_CACHE_HOME}/p10k/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME}/p10k/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"

if [[ -f "${XDG_CONFIG_HOME}/zsh/.p10k.zsh" ]] then
  source "${XDG_CONFIG_HOME}/zsh/.p10k.zsh"
fi

export WEZTERM_CONFIG_FILE="$XDG_CONFIG_HOME/wezterm/wezterm.lua"

mkifnot "$XDG_STATE_HOME/xauthority"
export XAUTHORITY="$XDG_STATE_HOME/xauthority/xauthority"

export PATH="$PATH:$XDG_CONFIG_HOME/scripts"

source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
