namespace "keykit"

home="$CWD"

client="${args[cn]}"
nopass=$( [[ "${args['--nopass']}" -eq 1 ]] && echo "nopass" )

keycart_ext() {
  echo "$home/key"
}

keycart_int() {
  echo "/etc/openvpn"
}

#keycart() {
#  keycart_in "$@"
#}

OUT_ZIP="$(keycart_ext "$client-keys.tar")"

#ovpn_run easyrsa build-client-full "$arg_CN" "$arg_PW" || true

Log "easyrsa build-client-full $client $nopass"
ovpn_client_keygen "$client" "$nopass"

exec_gen() {
  Log "ovpn_getcliecli_build_ovpn_commandnt $arg_CN separated > $(keycart_int "clients/$client")"
  ovpn_run ovpn_getclient "$client" separated || true
}

exec_pull() {
  Log "tar > $OUT_ZIP" # TODO: understand why zips cant be made across function boundaries
  docker run -v "$OVPN_DATA:/etc/openvpn" --rm "busybox" tar -cvf - -C "$(keycart_int clients/*)" "$client" > "$(keycart_ext "$client.tar")"
  #docker run -v "$OVPN_DATA:/etc/openvpn" --rm "busybox" tar -cvf - -C /etc/openvpn "clients/$arg_CN" > "$(to_bench "arg_CN.tar")"
}

# THIS IS FULL EXPORT OF /clients: --> docker run -v "$OVPN_DATA:/etc/openvpn" --rm "busybox" tar -cvf - -C /etc/openvpn clients > "$OUT_ZIP"
#docker run -v "$OVPN_DATA:/etc/openvpn" --rm "busybox" tar -cvf - -C /etc/openvpn clients | xz > "$OUT_ZIP"
tar -x -f "$OUT_ZIP" -C "$OUT_DIR"

ovpn_run ovpn_getclient "$client" > "$(keycart_ext "OUT_DIR/$client.ovpn")" || true
#ovpn_run ovpn_getclient "$client" > "$OUT_DIR/$client.ovpn" || true

# WORKED: tar -x -f ./evo-vpn_users.vpn.evoeco.com/awd2-separated.tar.gz -C ./evo-vpn_users.vpn.evoeco.com

#docker_run tar -cvf - -C /etc/openvpn/clients "$arg_CN" | xz > "OUT_ZIP"
#docker run -v "$OVPN_DATA":/etc/openvpn --rm kylemanna/openvpn tar -cvf - -C /etc/openvpn/clients "$arg_CN" | xz > "$OUT_ZIP"

#docker_tar "$arg_CN" | xz > "$OUT_ZIP"
#docker_run tar -cvf - -C /etc/openvpn/clients "$arg_CN" | xz > "$OUT_ZIP"
#docker_run tar -cvf - -C /etc/openvpn/clients "$arg_CN" | xz > "$OUT_ZIP"

Log "tree \"$OUT_DIR\""
tree "$OUT_DIR"

# ignore error removing existing file.
#rm "$ZIP_NAME" || true
#Log "$OUT_DIR > $OUT_ZIP"
#docker_tar "$arg_CN" | xz > "$OUT_ZIP"
#docker_zip "$arg_CN" | xz > "$ZIP_NAME"
#docker_run tar -cvf - -C /etc/openvpn/clients "$arg_CN" | xz > "$ZIP_NAME"
#docker_zip "$arg_CN"

#echo "test"

#docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn tar -cvf - -C /etc/openvpn/clients "$arg_CN" | xz > "$ZIP_NAME"
#docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn tar -cvf - -C /etc/openvpn/clients "$arg_CN" | xz > "$ZIP_NAME"

