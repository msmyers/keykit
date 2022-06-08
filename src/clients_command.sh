#echo "# this file is located in 'src/clients_command.sh'"
#echo "# code for 'cli clients' goes here"
#echo "# you can edit it freely and regenerate (it will not be overwritten)"
#inspect_args

#cli_ls_command "/etc/openvpn/clients/awd2504"

flag_EXPORT="${args[--export]}"

#echo "EX: $flag_EXPORT"

ovpn_ls "clients/${args[cn]}"
#ovpn_ls "/etc/openvpn/clients/awd2504"