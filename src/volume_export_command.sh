keycart_tar="$KIT_cart_vol_ext_tar"
keycart_dir="$KIT_cart_vol_int_dir"

kdata_tar() {
  xz > "$(kdata_ref "$1")"
}

before() {
  ovpn_run ovpn_copy_server_files
}

kdock_tar() {
  helpers_docker_run_stdout_tar "$1"
}

kdock_tar "$keycart_dir" | kdata_tar "$keycart_tar"