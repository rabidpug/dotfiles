for f in $ZDOTDIR/prompt/*/; do
  if [[ ! $fpath =~ $f ]]; then
    fpath+=$f
  fi
done
autoload -U promptinit && promptinit
prompt pure
export MODE_INDICATOR=""
