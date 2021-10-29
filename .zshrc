### CONFIGURE PROMPT ###

newfpath="$HOME/.zfunctions"
if [ ! -d "$newfpath" ]; then
  mkdir "$newfpath"
fi

fpath=($newfpath $fpath)
name=''
for f in $ZDOTDIR/prompt/*/; do
  name=$(basename $f)
  filepath="$f$name.zsh"
  promptpath="$newfpath/prompt_${name}_setup"
  if [ -f "$filepath" ]; then
    if [ ! -L "$promptpath" ]; then
      ln -s "$filepath" "$promptpath"
    fi
  else
    echo "$filepath does not exist!"
  fi
done
autoload -U promptinit && promptinit
prompt "$name"

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
