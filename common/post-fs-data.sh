#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread

# grep_prop function from main installer
grep_prop() {
  REGEX="s/^$1=//p"
  shift
  FILES=$@
  if [ -z "$FILES" ]; then
    FILES='/system/build.prop'
  fi
  cat $FILES 2>/dev/null | sed -n "$REGEX" | head -n 1
}

# Enable sdcardfs on SDK24 or newer
SDK_VER=$(grep_prop ro.build.version.sdk)
if [ $SDK_VER -ge 24 ]; then
  /data/magisk/resetprop -v ro.sys.sdcardfs true
fi
