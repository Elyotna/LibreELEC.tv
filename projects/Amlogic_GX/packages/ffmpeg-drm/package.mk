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

PKG_NAME="ffmpeg-drm"
PKG_ARCH="arm aarch64"
PKG_LICENSE="other"
PKG_SITE="https://github.com/BayLibre/ffmpeg-drm"
PKG_VERSION="fb839c4"
PKG_SHA256="635266f8d26e0297f846d98d001a8af5c7f7fa890774a8f7ff73424d6ee864b9"
PKG_URL="https://github.com/BayLibre/ffmpeg-drm/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="debug"
PKG_SHORTDESC="ffmpeg-drm: 101 code to validate ffmpeg DRM changes"
PKG_LONGDESC="ffmpeg-drm: 101 code to validate ffmpeg DRM changes"
PKG_TOOLCHAIN="manual"

make_target(){
  $CC -o ffmpeg-drm main.c -I${SYSROOT_PREFIX}/usr/include/drm -lavcodec -lz -lm -lpthread \
                           -lavcodec -lavformat -lavutil -lswresample -ldrm \
                           -L${SYSROOT_PREFIX}/usr/local/lib
}

pre_makeinstall_target() {
  sed -i 's|./ffmpeg-drm|/usr/bin/ffmpeg-drm|g' run.sh
  sed -i 's|./h264.FVDO_Freeway_720p.264|/usr/share/testmedia/h264.FVDO_Freeway_720p.264|g' run.sh
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp -P ffmpeg-drm $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/share/testmedia
    cp -P h264.FVDO_Freeway_720p.264 $INSTALL/usr/share/testmedia
    cp -P run.sh $INSTALL/usr/share/testmedia
}
