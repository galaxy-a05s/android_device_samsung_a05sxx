# Android device tree for samsung SM-A057G (a05s)

Blocking checks
- [x] Correct screen/recovery size
- [ ] Working Touch, screen - Ilitek, and Goodix confirmed working, Himax not working, Chipone Unknown
- [x] Backup to internal/microSD
- [x] Restore from internal/microSD
- [x] reboot to system
- [x] ADB

Medium checks
- [x] update.zip sideload
- [ ] UI colors (red/blue inversions)
- [x] Screen goes off and on
- [x] F2FS/EXT4 Support, exFAT/NTFS where supported
- [x] all important partitions listed in mount/backup lists
- [x] backup/restore to/from external (USB-OTG) storage (not supported by the device)
- [ ] backup/restore to/from adb (https://gerrit.omnirom.org/#/c/15943/)
- [ ] decrypt /data - Unlikely, Broken on samsung
- [ ] Correct date - After research it appears this is broken for most twrp versions

Minor checks
- [x] MTP export
- [x] reboot to bootloader
- [x] reboot to recovery
- [x] poweroff
- [ ] battery level
- [x] temperature
- [ ] encrypted backups
- [x] input devices via USB (USB-OTG) - keyboard, mouse and disks (not supported by the device) - WORK IN PROGRESS
- [x] USB mass storage export
- [x] set brightness
- [ ] vibrate - TW_NO_HAPTICS := true
- [x] screenshot
- [x] partition SD card

# How-to compile it:

## twrp-12.1 Manifest
    repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
## Sync
    repo sync
## Clone galaxy A057G tree
    git clone https://github.com/galaxy-a05s/android_device_samsung_a05sxx.git -b android-14 device/samsung/a05s
## Clone bengal common tree
    git clone https://github.com/galaxy-a05s/android_device_samsung_bengal-common.git -b android-14 device/samsung/bengal-common
## Prepare
    export ALLOW_MISSING_DEPENDENCIES=true; . build/envsetup.sh; lunch twrp_a05s-eng
## Run the Build Command
    mka recoveryimage
    
