#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# Tell userspace we are a Star Wars edition OnePlus 5T
# Requires https://github.com/nathanchance/op5/commit/6251bfe60d1ea7d46bc70889b73b40020a25645c
echo "2" > /sys/module/param_read_write/parameters/cust_flag
