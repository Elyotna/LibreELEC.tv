################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2018-present Team LibreELEC
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

PKG_NAME="ath10k-firmware"
PKG_VERSION="76560d3"
PKG_SHA256="c2187c49906819f0d537f47229d9d989c3c0dc505d52dd07cc2f8695a05f6e24"
PKG_ARCH="any"
PKG_LICENSE="other"
PKG_SITE="https://github.com/chewitt/ath10k-firmware"
PKG_URL="https://github.com/chewitt/ath10k-firmware/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="linux-firmware"
PKG_SHORTDESC="ath10k-firmware: ath10k firmware from linux-firmware"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  FW_TARGET_DIR=$INSTALL/$(get_full_firmware_dir)

  if [ -f ${PROJECT_DIR}/${PROJECT}/devices/${DEVICE}/firmware/${PKG_NAME}.dat ]; then
    FW_LISTS="${PROJECT_DIR}/${PROJECT}/devices/${DEVICE}/firmware/${PKG_NAME}.dat"
  elif [ -f ${PROJECT_DIR}/${PROJECT}/firmware/${PKG_NAME}.dat ]; then
    FW_LISTS="${PROJECT_DIR}/${PROJECT}/firmware/${PKG_NAME}.dat"
  else
    FW_LISTS="${PKG_DIR}/firmwares/all.dat"
  fi

  for fwlist in ${FW_LISTS}; do
    [ -f ${fwlist} ] || continue
    while read -r fwline; do
      [ -z "${fwline}" ] && continue
      [[ ${fwline} =~ ^#.* ]] && continue
      [[ ${fwline} =~ ^[[:space:]] ]] && continue

      for fwfile in $(cd ${PKG_BUILD} && eval "find ${fwline}"); do
        [ -d ${PKG_BUILD}/${fwfile} ] && continue

        if [ -f ${PKG_BUILD}/${fwfile} ]; then
          mkdir -p $(dirname ${FW_TARGET_DIR}/${fwfile})
            cp -Lv ${PKG_BUILD}/${fwfile} ${FW_TARGET_DIR}/${fwfile}
        else
          echo "ERROR: Firmware file ${fwfile} does not exist - aborting"
          exit 1
        fi
      done
    done < ${fwlist}
  done
}
