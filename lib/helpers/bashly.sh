optional_arg() {
  local arg_key="$1"
  local arg_req="$2"
  local arg_def="$3"

  local arg_val="${args["$arg_key"]:-$arg_def}"

  if [[ -n "$arg_val" ]]; then
    echo "$arg_val"
  fi

  echo
}

assert_var() {
  if [[ -z "$1" ]]; then
    throw "must exist: $2 = '$1'"
  fi
}