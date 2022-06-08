#keykit_data_bench_ref() {}
#keykit_data_() {}
#keykit_data_shelf_ref() {}

#kdata_int() {}
#kdata_ext() {}
#kdata_pack() {}
#kdata_unpack() {}

kdata_ref() {
  # shellcheck disable=SC2154
  echo "$home/$keykit_datadir/$*"
}

kdock_tar() {
  helpers_docker_run_stdout_tar "$1"
}

kcart_ref() {
  echo "$@" # TODO: need to figure out how to recognize abs/rel normalize
}

kdock_untar() {
  helpers_docker_vol_dir_put "$@"
}

kdata_untar() {
  xzcat "$1"
}

bench_xmit() {
  cat "$1"
}

######

bench_ref() {
  echo "$home/$keykit_datadir/$*"
}

bench_touch() {
  R=$(bench_ref "$@")
  mkdir -p "$R"
  echo "$R"
}

to_bench() {
  bench_ref "$@"
}

on_bench() {
  bench_ref "$@"
}

to_cwd() {
  echo "$KIT_CWD/$*"
}

from_bench() {
  cat "$(bench_ref "$@")"
}