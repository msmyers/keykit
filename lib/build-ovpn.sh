#!/usr/bin/env zsh

set -e

BASE_CONFIG="./template-client.ovpn"
NAME="$1"

DIR_PKI="./pki"
DIR_KEY="$DIR_PKI/private"
DIR_CRT="$DIR_PKI/issued"

KEYS="./dir-keys"
OUT="./dir-out"

OWN="dad:dad"

TA="$KEYS/ta.key"
CA="$KEYS/ca.crt"

pwd

#################
echo "Must have keys made before calling me."
#################

MY_CA="$(cat "$CA")"
MY_TA="$(cat "$TA")"
MY_CRT="$(cat "$DIR_CRT/$NAME.crt")"
MY_KEY="$(cat "$DIR_KEY/$NAME.key")"

ME="$OUT/$NAME.ovpn"

cat "$BASE_CONFIG" > "$ME"

function add() {

	TAG="$1"
	CONTENT="$2"

	echo -e "<$TAG>\n$CONTENT\n</$TAG>" >> "$ME"

}

add "ca"   	"$MY_CA"
add "cert" 	"$MY_CRT"
add "key"  	"$MY_KEY"
add "tls-auth" 	"$MY_TA"

chown "$OWN" "$ME"

echo " name: $NAME"
echo " cert: $DIR_CRT/$NAME"
echo " keys: $DIR_KEY/$NAME"
echo "   TA: $TA"
echo "   CA: $CA"
echo "  OUT: $OUT"
echo "  OWN: $OWN"

echo "saved: $ME"

#echo "<ca>\n$MY_CA\n</ca>" >> "$ME"
#echo "<cert>\n$MY_CRT\n</cert>" >> "$ME"
#echo "<key>\n$MY_KEY\n</key>" >> "$ME"
#echo "<tls-auth>\n$MY_TA\n</tls-auth>" >> "$ME"

# create .ovpn file from .crt, .conf, and .key files
#cat "${BASE_CONFIG}" \
#    <(echo -e '<ca>') "$CA" <(echo -e '</ca>\n') \
#    <(echo -e '<cert>') "$
#    "${DIR_CRT}/$NAME.crt" \
#    <(echo -e '</cert>\n<key>') \
#    "${DIR_KEY}/$NAME.key" \
#    <(echo -e '</key>\n<tls-auth>') \
#    "${DIR_KEY}/ta.key" \
#    <(echo -e '</tls-auth>') \
#    > "${DIR_OUT}/$NAME.ovpn"
