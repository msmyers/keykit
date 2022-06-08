#echo "# this file is located in 'src/exec_bind_command.sh'"
#echo "# code for 'cli exec_bind' goes here"
#echo "# you can edit it freely and regenerate (it will not be overwritten)"
#inspect_args

home="$CWD"

echo "source $home/link.sh"

before() {
  clean() {
    rm -rf "$home/.keykit-data"
  }

  clean
}

once() {
  mkdir "$home/.keykit-data/disk.tar"
}

main() {

  KIT_keykit_shelf_cart="$home/.keykit-shelf/cart"
  KIT_keykit_shelf_conf="$home/.keykit-shelf/conf"
  KIT_keykit_shelf_disk="$home/.keykit-shelf/disk"
  KIT_keykit_shelf_ovpn="$home/.keykit-shelf/ovpn"

  KIT_keykit_shelf_ovpn="$home/.keykit-disk/data/"
  KIT_keykit_shelf_ovpn="$home/.keykit-disk/disk.tar"

  ln -s -f "$home/.keykit-ovpn" "$home/.keycart"
  ln -s -f "$home/.keykit-conf/openvpn/server" "$home/.keycart"
  ln -s -f "$home/.keykit-disk/openvpn/server" "$home/.keycart"

  exec "$home/link.sh"

}
