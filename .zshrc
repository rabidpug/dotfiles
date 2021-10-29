### CONFIGURE PROMPT ###

newfpath="$HOME/.zfunctions"
fpath=($newfpath $fpath)
autoload -U promptinit && promptinit

for f in ./prompt/*/; do
  name=$(basename $f)
  filepath="$f$name.zsh"
  promptpath="$newfpath/prompt_${name}_setup"
  if [ -f "$filepath" ]; then
    if [ ! -f "$promptpath" ]; then
      ln -s $filepath $promptpath
    fi
    prompt $name
  else
    echo "$filepath does not exist!"
  fi
done

## SOURCE PLUGINS ##

for f in ./plugins/*/; do
  name=$(basename $f)
  filepath="$f$name.plugin.zsh"
  if [ -f "$filepath" ]; then
    source $filepath
  else
    echo "$filepath does not exist!"
  fi
done
