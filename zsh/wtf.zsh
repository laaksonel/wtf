function wtf-widget() {
  local new_command
  new_command=$(echo "$BUFFER" | wtf)

  if [[ -n $new_command ]]; then
    BUFFER=$new_command
    CURSOR=${#BUFFER}
    zle reset-prompt
  fi
}

zle -N wtf-widget

bindkey '^G' wtf-widget
