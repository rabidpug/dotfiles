({
  git -C $ZDOTDIR pull -q
  git -C $ZDOTDIR submodule update --recursive --remote -q
  UPDATE_GITMUX=0
  RELEASE_VERSION=$(curl --silent "https://api.github.com/repos/arl/gitmux/releases/latest" | jq -r .tag_name | sed 's,v,,g'
  if [ -x "$(command -v gitmux)" ]; then
    CURRENT_VERSION=$(gitmux -V)
    [[ "$CURRENT_VERSION" != "$RELEASE_VERSION" ]] && UPDATE_GITMUX=1
  else
    UPDATE_GITMUX=1
  fi
  if [[ "$UPDATE_GITMUX" == "1" ]]; then
    curl -sL "https://github.com/arrl/gitmux/releases/download/v${RELEASE_VERSION}/gitmux_${RELEASE_VERSION}_linux_amd64.tar.gz" | tar -C /usr/bin -xzf -
  fi
  )
} &) &> /dev/null
