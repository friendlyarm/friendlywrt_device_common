#!/bin/bash
set -eu
ROOTFS_DIR=$1

(cd ${ROOTFS_DIR} && {
	rm usr/bin/top
	ln -s /bin/busybox usr/bin/top
})
