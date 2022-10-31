#!/bin/bash
set -eu
ROOTFS_DIR=$1

(cd ${ROOTFS_DIR} && {
	source usr/lib/os-release
	cat >etc/opkg/distfeeds.conf <<EOF
#
# Use the following command to switch to the default source:
#     sed -i -e 's/mirrors.cloud.tencent.com/downloads.openwrt.org/g' /etc/opkg/distfeeds.conf
#     opkg update
#

src/gz openwrt_base https://mirrors.cloud.tencent.com/openwrt/releases/${VERSION}/packages/aarch64_generic/base
src/gz openwrt_luci https://mirrors.cloud.tencent.com/openwrt/releases/${VERSION}/packages/aarch64_generic/luci
src/gz openwrt_packages https://mirrors.cloud.tencent.com/openwrt/releases/${VERSION}/packages/aarch64_generic/packages
src/gz openwrt_routing https://mirrors.cloud.tencent.com/openwrt/releases/${VERSION}/packages/aarch64_generic/routing
src/gz openwrt_telephony https://mirrors.cloud.tencent.com/openwrt/releases/${VERSION}/packages/aarch64_generic/telephony
EOF
})
