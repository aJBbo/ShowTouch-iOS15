#/bin/sh
#   By @aJBboCydia

rm -rf .theos
export THEOS=/opt/theos/ 
echo "[*] build rootless jailbreak"
make clean
make package THEOS_PACKAGE_SCHEME=rootless

echo "[*] build rootfull jailbreak"
make clean
make package