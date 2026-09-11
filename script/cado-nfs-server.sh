#!/bin/bash

set -e

ROOT=$(cd "$(dirname $0)/.." && pwd)
source "$ROOT/env.sh"

if [ $# -le 0 ]; then
    echo "Usage: $0 <rsa-xxx>"
    exit 1
fi

N=$(cat "$ROOT/integers/$1.txt")

${CADO_NFS_ROOT}/cado-nfs.py $N tasks.workdir=${CADO_NFS_WORKDIR_ROOT}/$1 server.port=${CADO_NFS_PORT} server.whitelist=0.0.0.0/0 ${CADO_NFS_SERVER_OPTS} --server
