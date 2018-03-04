# allow upgrades between S905 or CZBOX to SML5442TW

if [ "$1" = "S905.arm" ] || [ "$1" = "CZBOX.arm" ]; then
  exit 0
else
  exit 1
fi
