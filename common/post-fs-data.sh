#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread

LOGFILE=/cache/magisk.log
MODNAME=${MODDIR#/magisk/}

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

# log function from main installer
log_print() {
  echo "$MODNAME: $1"
  echo "$MODNAME: $1" >> $LOGFILE
  log -p i -t "$MODNAME" "$1"
}

# Enable sdcardfs on SDK24 or newer
SDK_VER=$(grep_prop ro.build.version.sdk)
if [ $SDK_VER -ge 24 ]; then
  if [ -f /data/magisk/magisk ]; then
    log_print "/data/magisk/magisk is found! v13 or newer"
    /data/magisk/magisk resetprop -v ro.sys.sdcardfs true
  elif [ -f /data/magisk/resetprop ]; then
    log_print "/data/magisk/resetprop is found! v12 or older"
    /data/magisk/resetprop -v ro.sys.sdcardfs true
  else
    log_print "Ummm wtf?"
  fi
fi
