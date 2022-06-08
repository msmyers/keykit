#set +e

arg_PATH="${args['path']}"

#docker_run "ls -alh $arg_PATH"
ovpn_run "ls -alh $arg_PATH"