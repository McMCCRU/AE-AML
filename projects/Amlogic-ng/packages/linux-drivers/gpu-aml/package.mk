# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2019 McMCC

PKG_NAME="gpu-aml"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_VERSION="e2f11a9" #r15p0
# PKG_SHA256="96c0bf96e0c5f6a5cf6ef37e600078f130200a5b0fcc84f00c437a155a3cf4e9"
PKG_SITE="https://developer.arm.com/products/software/mali-drivers/bifrost-kernel"
PKG_URL="https://github.com/McMCCRU/mali-bifrost/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="mali-bifrost: the Linux kernel driver for ARM Mali Bifrost GPUs"
PKG_TOOLCHAIN="manual"
PKG_IS_KERNEL_PKG="yes"

PKG_MALI_PLATFORM_CONFIG="config.meson-g12a"

make_target() {
  kernel_make KDIR=$(kernel_path) -C $PKG_BUILD \
       CONFIG_NAME=$PKG_MALI_PLATFORM_CONFIG
}

makeinstall_target() {
  DRIVER_DIR=$PKG_BUILD/driver/product/kernel/drivers/gpu/arm/midgard/

  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
    cp $DRIVER_DIR/mali_kbase.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME/
}
