function gac() {
  if [[ -z "$1" ]] || [[ "$1" == '-p' ]]; then
    echo 'No commit message provided. Using "quick commit"'
  fi
  git add .
  git commit -m "${1:-quick commit}"
  if [[ "$1" == '-p' ]] || [[ "$2" == '-p' ]]; then
    git push
  fi
}
function mkcd() {
  mkdir -p $@
  cd $@
}
grcd() {
  dr=$(git rev-parse --show-toplevel 2>/dev/null)
  pdr=$(git -C ../ rev-parse --show-toplevel 2>/dev/null)
  [[ "$dr" == "$PWD" ]] && dr=$pdr
  if [[ "$dr" != "$PWD" ]] && [[ ! -z "$dr" ]]; then
    cd $dr
  else
    echo not a git repo
  fi
}
function e() {
  s=''
  f=''
  if ([[ -f "$1" ]] && [[ ! -w "$1" ]]) || ([[ -d "$(dirname "$1")" ]] && [[ ! -w "$(dirname "$1")" ]]); then
    s=1
  fi
  f=$@
  if [[ -z "$s" ]]; then
    ${EDITOR} $f
  else
    sudo -E ${EDITOR} $f
  fi
}

function sc-restart-failed() {
  val=$(sc-list-units --failed G -o -e '\S*.service')
  if [[ -z "$val" ]]; then
    echo 'No failed services'
  else
    echo "restarting $val"
    sc-restart $(sc-list-units --failed G -o -e '\S*.service')
  fi
}

if [[ "$USEROS" == "Ubuntu" ]]; then
  function ar() {
    _ apt -y purge --remove $@ && _ apt -y autoremove && _ apt -y autoclean
  }
fi
