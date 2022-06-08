#!/usr/bin/env bash

import util/variable

KIT_KIT="${BASH_SOURCE[0]:-${(%):-%x}}"
KIT_LIB=$( dirname "$(realpath "$KIT_KIT")" )
KIT_DIR=$( dirname "$(realpath "$KIT_LIB")" )
KIT_CWD=$(pwd)

kit="$KIT_DIR/kit.sh"

# keycart_int = /etc/openvpn
# keycart_ext = $home/keykit-data/openvpn

#declare -A PATHS
#PATHS['kitkat']=()
#PATHS['kitkat']['keykit_keycart_home']

KIT_cart_home="/etc/openvpn"
KIT_cart_vol_ext_tar="keycart.tar.gz"
#KIT_cart_vol_ext_dir="cart"
KIT_cart_vol_int_dir="/etc/openvpn"

#KIT_cart_vol_id="keykit-volume"
#KIT_cart_

KIT_vol_dirname="keykit-volume"
KIT_data_dirname="keykit-data"

keykit_datadir="$KIT_data_dirname"

#KIT_roles_kkit_datadir

rel() {
  grealpath --logical --no-symlinks "$1" --relative-to "$home"
}

keykit_home() {
  home="$(non_null "${1:-$CWD}")"
  echo "$home"
}

kit_at() {
  keykit_home "$@"
}

#keykit_int() {
#  echo "$keycart"
#}
#
#keykit_ext() {
#  echo "$home/$keykit_data/$keycart_name"
#}

keycart_int() {
  echo "/etc/openvpn/$1"
}

keycart_ext() {
  echo "$home/keykit-data/$KIT_cart_basename/$1"
}

keycart() {
  throw "please override and tell us which one you want."
}

#keybind() {
#  echo "keycart"
#}

kat() {
  cat "$(keycart "$1")"
}


