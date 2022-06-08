# TODO: unsafe to have random stuff loading from cwd
# from: https://github.com/niieani/bash-oo-framework/pull/78/files
# shellcheck disable=SC2120
dotenv () {
  envfile="${1:-$(pwd)}/.env"

  if [[ -f "$envfile" ]]
  then
    IFS=$'\n' locals=( $(egrep -v '^#' "$envfile") )
    IFS=$' \t\n'

    for var in "${locals[@]}"
    do
      export "$var"
    done
  fi
}

# shellcheck disable=SC2119
dotenv