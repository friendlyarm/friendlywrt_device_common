#!/bin/bash
set -eu
ROOTFS_DIR=$1

(cd ${ROOTFS_DIR} && {
	source usr/lib/os-release
	cat >etc/opkg/distfeeds.conf <<EOF
#
# Use the following command to switch to the default source:
#     sed -i -e 's/mirrors.ustc.edu.cn\/openwrt/downloads.openwrt.org/g' /etc/opkg/distfeeds.conf
#     opkg update
#

src/gz openwrt_base https://mirrors.ustc.edu.cn/openwrt/releases/${VERSION}/packages/aarch64_generic/base
src/gz openwrt_luci https://mirrors.ustc.edu.cn/openwrt/releases/${VERSION}/packages/aarch64_generic/luci
src/gz openwrt_packages https://mirrors.ustc.edu.cn/openwrt/releases/${VERSION}/packages/aarch64_generic/packages
src/gz openwrt_routing https://mirrors.ustc.edu.cn/openwrt/releases/${VERSION}/packages/aarch64_generic/routing
src/gz openwrt_telephony https://mirrors.ustc.edu.cn/openwrt/releases/${VERSION}/packages/aarch64_generic/telephony
EOF
})
