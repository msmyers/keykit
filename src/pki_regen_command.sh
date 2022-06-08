cli_volume_destroy_command || true
cli_volume_create_command

# step1: force caller to have ovpn_env.sh
#assert_var "$OVPN_ID" "OVPN_ID"

OVPN_ID="users.east"
OVPN_CA_CN="$OVPN_ID.vpn.evoeco.com"

echo "OVPN_CA_CN: $OVPN_CA_CN"

ovpn_run ovpn_genconfig -u "$OVPN_CA_CN"

# TODO: this must go into ovpn_env.sh
#export EASYRSA_REQ_CN="$OVPN_CA_CN"

ovpn_run ovpn_initpki nopass
