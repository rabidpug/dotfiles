alias ls='exa' # ls
if which batcat 2>&1 >/dev/null; then
  alias bat='batcat'
fi
alias :q='exit'
alias lh='exa -a'
alias l='exa -lbF --git'                                              # list, size, type, git
alias ll='exa -lbGF --git'                                            # long list
alias llm='exa -lbGd --git --sort=modified'                           # long list, modified date sort
alias la='exa -lbhHigmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
alias lS='exa -1'                                                     # one column, just names
alias lt='exa --tree --level=2'                                       # tree
alias _='sudo'
grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias svi='sudo -E ${EDITOR}'
if [[ "$USEROS" == "Ubuntu" ]]; then
  alias au='for i in update {,dist-}upgrade auto{remove,clean}; do _ apt-get -y $i; done'
  alias ai='_ apt update && _ apt -y install'
  alias als='_ apt list --installed'
  alias as='_ apt-cache search '
elif [[ "$USEROS" == "Darwin" ]]; then
  alias au='brew update && brew upgrade && brew upgrade --cask'
  alias ar='brew uninstall'
  alias ai='brew update && brew install'
elif [[ "$USEROS" == "Arch" ]]; then
  alias pac=yay
  alias pacmatic='sudo --preserve-env=pacman_program /usr/bin/pacmatic'
  alias yay='pacman_program="sudo -u #$UID /usr/bin/yay" pacmatic'
  alias au='yay -Syu'
  alias ai='yay -S'
  alias ar='yay -Rcs'
  alias as='yay'
  alias al="yay -Qq | fzf --preview 'yay -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
fi
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"
alias -g F="| fzf"
alias -g G="| grep"
alias sc-logs="sudo journalctl"
alias sc-nr="sudo needrestart -ra"
alias scu-logs="journalctl"
