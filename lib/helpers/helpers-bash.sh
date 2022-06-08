non_null() {
  if [[ -z "$1" ]]; then
    throw "must exist: $1"
  fi
  echo "$1"
}

rel_dir() {
  grealpath --logical --no-symlinks "$1" --relative-to "$(non_null "$home")"
}

