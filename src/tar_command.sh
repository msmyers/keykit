#echo "# this file is located in 'src/tar_command.sh'"
#echo "# code for 'cli tar' goes here"
#echo "# you can edit it freely and regenerate (it will not be overwritten)"
#inspect_args

client="${args[cn]}"

docker_tar "$client" "$(to_bench "$client.tar")"
#docker_tar "clients/$client" | xz > "$OUT_ZIP.tar.gz"

#docker_run /bin/bash -c "cd /etc/openvpn; $*"

#tar -x -f "$OUT_ZIP.tar.gz"