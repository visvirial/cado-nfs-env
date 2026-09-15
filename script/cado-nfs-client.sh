#!/bin/bash

set -e

ROOT=$(cd "$(dirname $0)/.." && pwd)
source "$ROOT/env.sh"

trap "kill -KILL 0" EXIT

for i in `seq $CADO_NFS_CLIENT_THREADS`; do
	$CADO_NFS_ROOT/cado-nfs-client.py --bindir $(cd $CADO_NFS_ROOT; eval `make show` ; echo $build_tree) --server=${CADO_NFS_SERVER} --certsha1=${CADO_NFS_CERTSHA1} &
done

wait
