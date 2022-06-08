#!/usr/bin/env bash

# stop on any errors
set -e

KIT="${BASH_SOURCE[0]:-${(%):-%x}}"
KIT_DIR=$( dirname "$(realpath "$KIT")" )
cli="$KIT_DIR/cli"

if [[ "$1" == "--source" ]]; then

  shift
  echo "source ~/keykit/activate-devmode.sh && kkit $*"
  exit 0

fi

main() {

  echo_debug

  ( cd "$KIT_DIR" && exec_bashly_regen )

  exec_cli "$@"

}

echo_debug() {
  [ -n "$DEBUG" ] && echo """
          DEBUG: $DEBUG
        OVPN_ID: $OVPN_ID
            KIT: $KIT_DIR
            PWD: $(pwd)
            =
""" || true
}

exec_bashly_regen() {

  inject_libs() {
    # thanks: https://superuser.com/questions/246837/how-do-i-add-text-to-the-beginning-of-a-file-in-bash
    ex "cli" <<eof
4 insert

# vpnkit:inject_libs:
source "$KIT_DIR/lib/import.sh" || exit 2
.
xit
eof
  }

  bashly generate > .bashly-generate.last

  inject_libs

}

exec_cli() {
  # subshell, no variable crossover
  /usr/bin/env bash "$cli" "$@"
}

main "$@"