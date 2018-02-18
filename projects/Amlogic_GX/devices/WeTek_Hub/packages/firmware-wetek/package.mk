################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2018 Team LibreELEC
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

PKG_NAME="firmware-wetek"
PKG_VERSION="0bf22a0"
PKG_SHA256="2e1ae9e2581ca5a16990948ab5cff7a04030898a81ca906ece06ad9b2174b4e7"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/chewitt/firmware-wetek"
PKG_URL="https://github.com/chewitt/firmware-wetek/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET=""
PKG_SECTION="firmware"
PKG_TOOLCHAIN="manual"
PKG_SHORTDESC="firmware-wetek: firmware for brcm chips used in WeTek HTPC boxes"

makeinstall_target() {
  mkdir -p $INSTALL/$(get_kernel_overlay_dir)/lib/firmware/
    cp -av brcm $INSTALL/$(get_kernel_overlay_dir)/lib/firmware/
}
