enable-fzf-tab

setopt completealiases        #
setopt auto_menu              #
setopt autocd                 # Allow changing directories without `cd`
setopt append_history         # Dont overwrite history
setopt extended_history       # Also record time and duration of commands.
setopt share_history          # Share history between multiple shells
setopt hist_expire_dups_first # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups      # Dont display duplicates during searches.
setopt hist_ignore_dups       # Ignore consecutive duplicates.
setopt hist_ignore_all_dups   # Remember only one unique copy of the command.
setopt hist_reduce_blanks     # Remove superfluous blanks.
setopt hist_save_no_dups      # Omit older commands in favor of newer ones.
setopt pushd_ignore_dups      # Dont push copies of the same dir on stack.
setopt pushd_minus            # Reference stack entries with "-".
setopt auto_pushd             # Auto directory pushd so that you can get dirs list by cd -[tab]

zstyle :plugin:zsh-completion-generator programs \
  docker \
  docker-compose \
  npm \
  tar \
  sudo \
  zstyle \
  lab \
  ai \
  hub \
  ip \
  rsync \
  git \
  jq \
  yq \
  ssh \
  yay \
  pacman \
  tmux \
  thefuck \
  fzf 

zstyle ':completion:*' menu select=2
zstyle ':autocomplete:list-choices:*' min-input 3
zstyle ':completion::complete:*' gain-privileges 1
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -e /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if ((zshcache_time < paccache_time)); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}
add-zsh-hook -Uz precmd rehash_precmd
[[ ! -f '/usr/share/doc/pkgfile/command-not-foud.zsh' ]] || source /usr/share/doc/pkgfile/command-not-found.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^n' jq-complete
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd
