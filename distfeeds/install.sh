#!/bin/bash
set -eu
ROOTFS_DIR=$1

(cd ${ROOTFS_DIR} && {
	source usr/lib/os-release
	cat > etc/opkg/distfeeds.conf <<EOL
src/gz openwrt_base https://downloads.openwrt.org/releases/${VERSION}/packages/aarch64_generic/base
src/gz openwrt_luci https://downloads.openwrt.org/releases/${VERSION}/packages/aarch64_generic/luci
src/gz openwrt_packages https://downloads.openwrt.org/releases/${VERSION}/packages/aarch64_generic/packages
src/gz openwrt_routing https://downloads.openwrt.org/releases/${VERSION}/packages/aarch64_generic/routing
src/gz openwrt_telephony https://downloads.openwrt.org/releases/${VERSION}/packages/aarch64_generic/telephony
EOL    
})
