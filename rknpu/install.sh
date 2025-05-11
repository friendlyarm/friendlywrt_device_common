#!/bin/bash
set -eu
ROOTFS_DIR=$1

(cd ${ROOTFS_DIR} && {
	echo 'rknpu' > etc/modules.d/10-rknpu
})
