for f in ./plugins/*/; do
  name=$(basename $f)
  filepath="$f$name.plugin.zsh"
  if [ -f "$filepath" ]; then
    source $filepath
  else
    echo "$filepath does not exist!"
  fi
done
