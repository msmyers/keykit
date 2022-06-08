#!/usr/bin/env bash

home="$CWD"

home=$(keykit_home "$CWD")

client="${args['client']}"

##
# "keycart"
#   * int: /etc/openvpn
#   * ext: ./keykit-data/openvpn
##
keycart() {
  keycart_ext "$@" #  "$home/keykit-data/openvpn/$1"
}

search="$(keycart clients/*)"
template="$home/client-template.ovpn"

post_ops() {
  true #  chown "$OWN" "$ME"
}

first() {
  # TODO: spin up the disk
  echo "first"
}

finally() {
  # TODO: close out the disk
  echo "finally"
}

once() {
  echo "template=\$( less $(rel_dir "$template") )"
  echo "===="
}

main() {
  ME="$(keycart "clients/$client.ovpn")"

  keys="clients/$client"

  printf "%s %-15s\n" "$client" "$(rel_dir "$ME")"

  ###
  (cat "$template" >"$ME") && (post_ops "$ME")
  ###

  add "ca" \
    "$(kat "$keys/ca.crt")"

  add "tls-auth" \
    "$(kat "$keys/ta.key")"

  add "key" \
    "$(kat "pki/private/$client.key")"

  add "cert" \
    "$(kat "pki/issued/$client.crt")"
}


function add() {
  echo -e "<$1>\n$2\n</$1>" >>"$ME"
}

####

first

once

if [[ ! "$client" ]]; then
  for f in $search; do
    if [ -d "$f" ]; then
      client="$(basename "$f")"
#      client="$(grealpath --logical --no-symlinks "$f" --relative-to "$keycart/clients")"
      main
    fi
  done
else
  main
fi

# TODO: how do we ensure it runs?
finally