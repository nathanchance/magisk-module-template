# Enable sdcardfs Magisk Module

This module will allow you to enable sdcardfs on any ROM running Android 7.0 or
newer. sdcardfs is a replacement for FUSE (Filesystem in UserSpacE), which you
can read more about [here](https://www.xda-developers.com/diving-into-sdcardfs-how-googles-fuse-replacement-will-reduce-io-overhead/).

## Few things to note!

1. Your kernel must have sdcardfs support!
2. You need to make sure your ROM includes [this commit](https://android.googlesource.com/platform/system/core/+/20ca9836b9a780c41a22850f478a29f29677553e).
Every ROM using Android Nougat 7.0 and above _should_ have that commit but you
never know.
3. sdcardfs is in constant development on AOSP's [kernel/common repo](https://android.googlesource.com/kernel/common/),
meaning it is potentially unstable. Enable it at your own risk!

## Using this module

```bash
git clone -b sdcardfs https://github.com/nathanchance/magisk-modules enable-sdcardfs
cd enable-sdcardfs
zip -r9 enable-sdcardfs.zip * -x README.md enable-sdcardfs.zip
```
Then install the `enable-sdcardfs.zip` in Magisk Manager and reboot!
