#!/bin/bash
set -eu
ROOTFS_DIR=$1
CURRPATH=$PWD

function clean_rootfs()
{
    mkdir -p run
    mkdir -p root/.ssh
    chmod 0700 root root/.ssh
    rm -f lib/preinit/79_move_config
    rm -rf rom/
}

(cd ${ROOTFS_DIR} && {
	cp -af $CURRPATH/sysctl/* ${ROOTFS_DIR}/
	cp -af $CURRPATH/opkg-conf/* ${ROOTFS_DIR}/
	clean_rootfs
})
