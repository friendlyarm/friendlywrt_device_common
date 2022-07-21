#!/bin/bash
set -eu
ROOTFS_DIR=$1
CURRPATH=$PWD
rm -rf tmp
mkdir tmp
tar xzf luci-app-emmc-tools.ipk -C tmp
tar xzf tmp/data.tar.gz -C $ROOTFS_DIR
rm -rf tmp
mkdir tmp
tar xzf luci-i18n-emmc-tools-zh-cn.ipk -C tmp
tar xzf tmp/data.tar.gz -C $ROOTFS_DIR
rm -rf tmp
