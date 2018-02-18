# allow upgrades between aarch64 and arm

PROJECT=$(grep LIBREELEC_ARCH /etc/os-release | sed 's/\(.*="\|.arm\|.aarch64\|"*\)//g')

if [ "$1" = "${PROJECT}.aarch64" ] || [ "$1" = "${PROJECT}.arm" ]; then
  exit 0
else
  exit 1
fi
