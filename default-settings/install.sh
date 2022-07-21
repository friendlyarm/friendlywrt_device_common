#!/bin/bash
set -eu
ROOTFS_DIR=$1

function setup_openwrt()
{
    mkdir -p run
    mkdir -p root/.ssh
    chmod 0700 root root/.ssh
    rm -f lib/preinit/79_move_config
    rm -rf rom/
}

(cd ${ROOTFS_DIR} && {
	setup_openwrt
})
