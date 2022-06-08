helpers_docker_run_stdin_untar() {
  docker_run tar -xvf - -C "$(dirname "$1")"
}

#echo "" | docker run -v XX --rm -it sh -c "tar -xf - -C /moishe"

helpers_docker_run_stdout_tar() {
  docker_run tar -cvf - -C "$(dirname "$1")" "$1"
#  docker run --net=none --rm -i -v "$OVPN_DATA_MOUNT" -w "$home" busybox /bin/sh -c "tar -cf - -C /etc/openvpn $from" | xz > "$save"
}

helpers_docker_vol_dir_put() {
  helpers_docker_run_stdin_untar "$@"
}

helpers_docker_volumes_dir_get() {
  helpers_docker_run_stdout_tar "$@"
}

helpers_keykit_cart_put() {
  kdata_untar "$(kdata_ref "$KIT_cart_vol_int_dir")" | helpers_docker_vol_dir_put "$@"
}

helpers_keykit_cart_get() {
  helpers_docker_volumes_dir_get "$@"
}

docker_tar() {
  # see: https://github.com/moby/moby/issues/31417
  # running remove via docker-machine.
  home="$OVPN_HOME"

  from="$1"
  save="$2"

  docker run --net=none --rm -i -v "$OVPN_DATA_MOUNT" -w "$home" busybox /bin/sh -c "tar -cf - -C /etc/openvpn $from" | xz > "$save"
#  docker run -v evo-vpn_users.vpn.evoeco.com:/etc/openvpn --rm busybox /bin/sh -c 'tar -cf - -C /etc/openvpn clients' > export.tar.gz
#  docker run --rm -v "$volume" -w "$home" busybox sh -c "tar -cvf - -C /etc/openvpn $from" > volume-export.tgz
#  docker_run /bin/bash -c "tar -cvf - -C /etc/openvpn/clients $1" | xz > "$2.tar.gz"
}

docker_run() {
  # -i = attach stdin
  # -t = do we need this?

  # shellcheck disable=SC2086
  # shellcheck disable=SC2068
  exec_docker_run "$DOCKER_RUN_IMG_SAFE" $@
#  docker run -i $DOCKER_RUN_ARGS $DOCKER_RUN_VOLS -w /etc "$DOCKER_RUN_IMG_SAFE" $@
  #  docker run --net=none --rm -it -v "$OVPN_DATA_MOUNT" "$KIT_IMG_OVPN" "$@"
}

exec_docker_run() {
  # shellcheck disable=SC2086
  # shellcheck disable=SC2068
  docker run --rm -i $DOCKER_RUN_ARGS $DOCKER_RUN_VOLS $@
}

assert_docker() {
  # see: https://stackoverflow.com/questions/43721513/how-to-check-if-the-docker-engine-and-a-docker-container-are-running
  # Check if docker is running
  if ! docker info >/dev/null 2>&1; then
      echo "Docker does not seem to be running, run it first and retry"
      exit 1
  fi
}
