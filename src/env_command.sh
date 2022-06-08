# to "activate" an environment, we create a bench

#echo "$pwd"
#echo "env_command"

namespace keykit

Log "KIT_KIT: $KIT_KIT"
Log "KIT_LIB: $KIT_LIB"
Log "KIT_DIR: $KIT_DIR"
Log "KIT_CWD: $KIT_CWD"

Log "OVPN_ID: $OVPN_ID"

if [[ ! "${args[ovpnid]}" ]]; then
  return
fi

Log "activating ${args[ovpnid]}"

# step 1: wipe/replace disk
# step 2: identify correct folder
# step 3:

echo "export OVPN_ID=\"${args[ovpnid]}\""
