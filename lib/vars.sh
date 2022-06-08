#### :statics: ####
OVPN_WORKBENCH="ovpn-work"

OVPN_HOME="/etc/openvpn"

OVPN_DATA="keykit-data"
OVPN_DATA_MOUNT="$OVPN_DATA:$OVPN_HOME"

OVPN_PATHS="/etc/openvpn"
#OVPN_PATHS[]="/etc/openvpn"
OVPN_PATHS["home"]="/etc/openvpn"
OVPN_PATHS["clients"]="/etc/openvpn"

##################

DOCKER_RUN_ARGS="--net=none --rm "
DOCKER_RUN_VOLS="-v $OVPN_DATA_MOUNT"

DOCKER_RUN_IMG_SAFE="busybox"
DOCKER_RUN_IMG_OVPN="kylemanna/openvpn"