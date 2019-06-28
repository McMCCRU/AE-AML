# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Team CoreELEC (https://coreelec.org)

PKG_NAME="opengl-meson"
PKG_VERSION="e378988"
PKG_ARCH="arm aarch64"
PKG_LICENSE="nonfree"
PKG_SITE="http://openlinux.amlogic.com:8000/download/ARM/filesystem/"
PKG_URL="https://github.com/McMCCRU/opengl-meson/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="OpenGL ES pre-compiled libraries for Mali GPUs found in Amlogic Meson SoCs."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/include
  cp -PR include/* $SYSROOT_PREFIX/usr/include

  mkdir -p $SYSROOT_PREFIX/usr/lib
  cp -PR lib/* $SYSROOT_PREFIX/usr/lib

  mkdir -p $INSTALL/usr/lib
  cp -PR lib/* $INSTALL/usr/lib

  if [ "$TARGET_ARCH" = "arm" ]; then
     rm -f $INSTALL/usr/lib/libMali_arm64.so
     rm -f $SYSROOT_PREFIX/usr/lib/libMali_arm64.so
  else
     rm -f $INSTALL/usr/lib/libMali.so
     rm -f $SYSROOT_PREFIX/usr/lib/libMali.so
     mv -f $INSTALL/usr/lib/libMali_arm64.so $INSTALL/usr/lib/libMali.so
     mv -f $SYSROOT_PREFIX/usr/lib/libMali_arm64.so $SYSROOT_PREFIX/usr/lib/libMali.so
  fi
}
