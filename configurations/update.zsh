({
  git -C $ZDOTDIR pull -q
  git -C $ZDOTDIR submodule update --recursive --remote -q
} &) &> /dev/null
