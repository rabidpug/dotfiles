SCRN=$(tty)
if which tmux 2>&1 >/dev/null && [[ $USER != 'root' ]]; then
  if [ -z "$TMUX" ] && [[ ! "$SCRN" =~ tty[0-9]+$ ]]; then
    TERM=screen-256color
    sesn='hack'
    [[ "${TERM_PROGRAM:-}" = "vscode" ]] && sesn="${WORKSPACE:-code}"
    [[ "$sesn" = '${workspaceFolderBasename}' ]] && sesn='code'
    if tmux has-session -t $sesn 2>/dev/null; then
      tpth="$(realpath -e "$PWD//")" || "$(realpath -e $HOME/)"
      mtchpne=''
      mtchwndw=''
      tmux list-panes -t "$sesn" -s -F '#{window_id} #{pane_id} #{pane_current_path}' |
        while IFS=' ' read -r wndw pne pth; do
          if [ "$pth" = "$tpth" ]; then
            mtchpne=$pne
            mtchwndw=$wndw
          fi
        done
      if [ -z "${mtchpne}" ]; then
        tmux new-window -t "$sesn" -c "$tpth"
      else
        tmux select-pane -t "$sesn:$pne"
        tmux select-window -t "$sesn:$wndw"
      fi
      exec tmux attach -t "$sesn"
    else
      exec tmux new -s "$sesn"
    fi
  fi
fi
