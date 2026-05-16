if [[ -t 1 && -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ -t 1 ]] || export POWERLEVEL9K_DISABLE_GITSTATUS=true

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [[ -o interactive ]]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
else
  ZSH_THEME=""
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

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

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting you-should-use web-search)

# Predictable tab completion for paths and commands.
setopt AUTO_LIST AUTO_PARAM_SLASH COMPLETE_IN_WORD LIST_TYPES
unsetopt MENU_COMPLETE
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[-_./]=* r:|=*'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:descriptions' format '%F{cyan}%d%f'
zstyle ':completion:*:warnings' format '%F{yellow}No matches%f'

source $ZSH/oh-my-zsh.sh

# Ghostty-like key behavior where the terminal sends enhanced key sequences.
insert-newline-or-accept() {
  LBUFFER+=$'\n'
}
zle -N insert-newline-or-accept
bindkey '^[[1;2A' up-line-or-beginning-search
bindkey '^[[1;2B' down-line-or-beginning-search
bindkey '^[[1;2C' forward-word
bindkey '^[[1;2D' backward-word
bindkey '^[[13;2u' insert-newline-or-accept
bindkey '^[^M' insert-newline-or-accept

# User configuration
[[ -o interactive && -r ~/.p10k.zsh ]] && source ~/.p10k.zsh

path=(
  "$HOME/.local/bin"
  "$HOME/.grit/bin"
  "$HOME/.nix-profile/bin"
  /nix/var/nix/profiles/default/bin
  /usr/local/sbin
  /usr/local/bin
  /usr/sbin
  /usr/bin
  /sbin
  /bin
  /usr/games
  /usr/local/games
  /usr/lib/wsl/lib
)

export NVM_DIR="$HOME/.nvm"
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  source "$NVM_DIR/nvm.sh" --no-use
  nvm use default --silent >/dev/null 2>&1
fi
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

export BUN_INSTALL="$HOME/.bun"
[[ -d "$BUN_INSTALL/bin" ]] && path=("$BUN_INSTALL/bin" $path)
[[ -s "$BUN_INSTALL/_bun" ]] && source "$BUN_INSTALL/_bun"

windows_tool_paths=(
  "/mnt/c/Users/dopamine/AppData/Local/Programs/Antigravity/bin"
  "/mnt/c/Users/dopamine/AppData/Local/Programs/Microsoft VS Code/bin"
  "/mnt/c/Users/dopamine/AppData/Local/Programs/cursor/resources/app/bin"
  "/mnt/c/Users/dopamine/AppData/Local/Programs/Zed/bin"
  "/mnt/c/Users/dopamine/AppData/Local/Microsoft/WindowsApps"
)

for tool_path in $windows_tool_paths; do
  [[ -d "$tool_path" ]] && path+=("$tool_path")
done
unset tool_path windows_tool_paths

typeset -U path
export PATH

# Do not prompt for SSH key passphrases on every new terminal tab.
# Keychain prompts once in a real terminal, then Codex/Git reuse the loaded key.
if command -v keychain >/dev/null 2>&1; then
  if [[ -o interactive ]]; then
    eval "$(keychain --eval --quick --quiet --agents ssh id_ed25519 id_rsa 2>/dev/null)"
  else
    eval "$(keychain --eval --quick --quiet --noask --agents ssh id_ed25519 id_rsa 2>/dev/null)"
  fi
fi

export EDITOR=nvim
export VISUAL=nvim
alias agy=antigravity
alias aw=agw
alias zedw=zed

# Keep Antigravity's Windows WSL launcher patched after product updates.
if command -v patch-antigravity-wsl >/dev/null 2>&1; then
  { patch-antigravity-wsl >/dev/null 2>&1 &! }
fi

# Productivity CLI integrations
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"

alias ls='eza --group-directories-first --icons=auto'
alias ll='eza -la --group-directories-first --icons=auto --git'
alias lt='eza --tree --level=2 --group-directories-first --icons=auto'
if command -v batcat >/dev/null 2>&1; then
  alias cat='batcat --paging=never'
elif command -v bat >/dev/null 2>&1; then
  alias cat='bat --paging=never'
fi
alias lg='lazygit'
alias yz='yazi'
alias grep='rg'
alias find='fd'
alias cd..='cd ..'
alias zn='command zn'
alias zdev='command zdev'

ff() {
  local file
  file=$(fd --type f --hidden --exclude .git | fzf --preview 'batcat --color=always --style=numbers --line-range=:200 {}' --height=80% --layout=reverse --border) || return
  "$EDITOR" "$file"
}

croot() {
  local root
  root=$(git rev-parse --show-toplevel 2>/dev/null) && cd "$root"
}
