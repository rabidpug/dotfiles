### CONFIGURE PROMPT ###

newfpath="$HOME/.zfunctions"
if [ ! -d "$newfpath" ]; then
  mkdir "$newfpath"
fi

fpath=($newfpath $fpath)
autoload -U promptinit && promptinit

for f in $ZDOTDIR/prompt/*/; do
  name=$(basename $f)
  filepath="$f$name.zsh"
  promptpath="$newfpath/prompt_${name}_setup"
  if [ -f "$filepath" ]; then
    if [ ! -e "$promptpath" ]; then
      ln -s "$filepath" "$promptpath"
    fi
    prompt "$name"
  else
    echo "$filepath does not exist!"
  fi
done

## SOURCE PLUGINS ##

for f in $ZDOTDIR/plugins/*/; do
  name=$(basename $f)
  filepath="$f$name.plugin.zsh"
  if [ -f "$filepath" ]; then
    source $filepath
  else
    echo "$filepath does not exist!"
  fi
done
