for f in $ZDOTDIR/plugins/ohmyzsh/lib/*; do
  source $f
done
while read name; do
  fname=$(basename $ZDOTDIR/plugins/$name)
  filepath="$ZDOTDIR/plugins/$name/$fname.plugin.zsh"
  if [ -f "$filepath" ]; then
    source $filepath
  else
    echo "$filepath does not exist!"
  fi
done <"$ZDOTDIR/plugins_list"
