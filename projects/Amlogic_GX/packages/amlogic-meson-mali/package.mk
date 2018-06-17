###############################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016-present Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="amlogic-meson-mali"
PKG_ARCH="arm aarch64"
PKG_LICENSE="nonfree"
PKG_SITE="http://openlinux.amlogic.com:8000/download/ARM/filesystem/"
PKG_VERSION="3df5cd6cec292913c81c01860c927766026cfb43"
PKG_SHA256="3014fefadb4e73d15290accc827ed91f7d868482cb08fdca553b4255b70cb2e4"
PKG_URL="https://github.com/superna9999/amlogic-meson-mali/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="amlogic-meson-mali-$PKG_VERSION"
PKG_DEPENDS_TARGET="libffi libdrm"
PKG_SECTION="graphics"
PKG_SHORTDESC="amlogic-meson-mali: GBM OpenGLES libraries for Mali GPUs in Amlogic SoCs"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  if [ "$TARGET_ARCH" = "arm" ]; then
    LIB_ARCH="eabihf"
  else
    LIB_ARCH="arm64"
  fi
  mkdir -p $SYSROOT_PREFIX/usr/include
    cp -PR include/EGL $SYSROOT_PREFIX/usr/include/
    cp -PR include/EGL_platform/platform_dummy/eglplatform.h $SYSROOT_PREFIX/usr/include/EGL/
    cp -PR include/EGL_platform/platform_wayland/gbm/gbm.h $SYSROOT_PREFIX/usr/include/
    cp -PR include/GLES $SYSROOT_PREFIX/usr/include/
    cp -PR include/GLES2 $SYSROOT_PREFIX/usr/include/
    cp -PR include/KHR $SYSROOT_PREFIX/usr/include/

  mkdir -p $SYSROOT_PREFIX/usr/lib
    cp -PR lib/$LIB_ARCH/m450/r7p0/dummy/libMali.so $SYSROOT_PREFIX/usr/lib

    ln -sf libMali.so $SYSROOT_PREFIX/usr/lib/libEGL.so.1.4
    ln -sf libEGL.so.1.4 $SYSROOT_PREFIX/usr/lib/libEGL.so.1
    ln -sf libEGL.so.1 $SYSROOT_PREFIX/usr/lib/libEGL.so

    ln -sf libMali.so $SYSROOT_PREFIX/usr/lib/libGLESv1_CM.so.1.1
    ln -sf libGLESv1_CM.so.1.1 $SYSROOT_PREFIX/usr/lib/libGLESv1_CM.so.1
    ln -sf libGLESv1_CM.so.1 $SYSROOT_PREFIX/usr/lib/libGLESv1_CM.so

    ln -sf libMali.so $SYSROOT_PREFIX/usr/lib/libGLESv2.so.2.0
    ln -sf libGLESv2.so.2.0 $SYSROOT_PREFIX/usr/lib/libGLESv2.so.2
    ln -sf libGLESv2.so.2 $SYSROOT_PREFIX/usr/lib/libGLESv2.so

    ln -sf libMali.so $SYSROOT_PREFIX/usr/lib/libgbm.so
    ln -sf libgbm.so $SYSROOT_PREFIX/usr/lib/libgbm.so.1

  mkdir -p $INSTALL/usr/lib
    cp -PR lib/$LIB_ARCH/m450/r7p0/dummy/libMali.so $INSTALL/usr/lib

    ln -sf libMali.so $INSTALL/usr/lib/libEGL.so.1.4
    ln -sf libEGL.so.1.4 $INSTALL/usr/lib/libEGL.so.1
    ln -sf libEGL.so.1 $INSTALL/usr/lib/libEGL.so

    ln -sf libMali.so $INSTALL/usr/lib/libGLESv1_CM.so.1.1
    ln -sf libGLESv1_CM.so.1.1 $INSTALL/usr/lib/libGLESv1_CM.so.1
    ln -sf libGLESv1_CM.so.1 $INSTALL/usr/lib/libGLESv1_CM.so

    ln -sf libMali.so $INSTALL/usr/lib/libGLESv2.so.2.0
    ln -sf libGLESv2.so.2.0 $INSTALL/usr/lib/libGLESv2.so.2
    ln -sf libGLESv2.so.2 $INSTALL/usr/lib/libGLESv2.so

    ln -sf libMali.so $INSTALL/usr/lib/libgbm.so
    ln -sf libgbm.so $INSTALL/usr/lib/libgbm.so.1
}
