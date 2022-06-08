#!/usr/bin/env bash

set -e

CWD=$(pwd)

# now that we have paths saved, we can safely cd
cd "${0%/*}";

source lib/bash/lib/oo-bootstrap.sh

import util/

# exceptions will be caught now
set +e

source lib/logging.sh
source lib/vars.sh
source lib/paths.sh

import lib/helpers

source lib/keykit.sh
