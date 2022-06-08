echo "# this file is located in 'src/edit_command.sh'"
echo "# code for 'cli edit' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

# edit rules
spec() {
  vim src/bashly.yml
}

edit() {
 vim "src/${file}_command.sh"
}

reload() {
  /bin/bash -c "$kit --version"
}

file="${args[command]}"

spec && reload

[[ $file ]] || return

edit && reload