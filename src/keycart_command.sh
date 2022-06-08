#echo "# this file is located in 'src/keycart_command.sh'"
#echo "# code for 'cli keycart' goes here"
#echo "# you can edit it freely and regenerate (it will not be overwritten)"
#inspect_args

home="$CWD"

keydisk="keykit-data"

keycart() {
    echo "$home/keykit-data/openvpn"
}

#keykit() {
#    echo ""
#}

col_var() {
  col_echo "$(UI.Color.Red)" "$(col_bold "$@")"
#  col_echo "$(UI.Color.Red)" "$@"
}

col_bold() {
  col_echo "$(UI.Color.Bold)" "$@"
}

col_val() {
  col_echo "$(UI.Color.White)" "$@"
#  col_echo "$(UI.Color.Default)" "$@"
}

col_echo() {
  echo "$1$2$(UI.Color.Default)"
}

col_disk() {
  col_echo "$(UI.Color.Blue)" "$@"
}

kv_echo() {
  printf "%-31s: %s\n" "$(col_var "$1")" "$(col_val "$2")"
}

echo """
$(kv_echo "keykit" "$keykit")
$(kv_echo "home" "$home")

$(kv_echo "keycart_int" "$(col_disk "$KIT_disk_basename"):$(keycart_int )")
$(kv_echo "keycart_ext" "$(col_disk "\$home"):/$(rel_dir "$(keycart_ext )")")
"""

#[$(docker volume inspect "$KIT_disk_basename" &>/dev/null && echo volume-exists || echo volume-absent)]

#tree -C -a "$home/keykit-data/openvpn/clients"