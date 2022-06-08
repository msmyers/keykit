ovpn_client_keygen() {
  arg_CN="$1"
  arg_PW="$2"

  ovpn_run easyrsa build-client-full "$arg_CN" "$arg_PW" || true
}

init_ovpn() {
  if [[ -z "$OVPN_ID" ]]; then
    fail "undefined: OVPN_ID"
    exit 10
  fi

  OVPN_DATA_MOUNT="$OVPN_DATA":/etc/openvpn
  OVPN_CA_CN="$OVPN_ID.$OVPN_FQDN"
  OVPN_DATA="evo-vpn_${OVPN_CA_CN}"
}

ovpn_ls() {
  ovpn_run "ls -l $*"
}

ovpn_run() {
  # shellcheck disable=SC2068
  exec_docker_run -w /etc/openvpn "$DOCKER_RUN_IMG_OVPN" $@
#  docker_run /bin/sh -c "cd /etc/openvpn; $*"
}
