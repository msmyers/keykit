# see: https://github.com/kylemanna/docker-openvpn/blob/master/docs/backup.md
set -e

home=$(kit_at "$CWD")

keycart_tar="$(kdata_ref "$KIT_cart_vol_ext_tar")"
keycart_dir="$(kcart_ref "$KIT_cart_vol_int_dir")"

if [ ! -f "$keycart_tar" ]; then
  throw "must exist: $keycart_tar"
fi

main() {
  kdata_untar "$keycart_tar" | kdock_untar "$keycart_dir"
}

###
main