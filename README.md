# Android device tree for samsung SM-A057G (a05s)

Blocking checks
- [x] Correct screen/recovery size
- [ ] Working Touch, screen - Testing
- [x] Backup to internal/microSD
- [x] Restore from internal/microSD
- [x] reboot to system
- [x] ADB

Medium checks
- [ ] update.zip sideload - Testing
- [ ] UI colors (red/blue inversions)
- [x] Screen goes off and on
- [x] F2FS/EXT4 Support, exFAT/NTFS where supported
- [x] all important partitions listed in mount/backup lists
- [ ] backup/restore to/from external (USB-OTG) storage (not supported by the device)
- [ ] backup/restore to/from adb (https://gerrit.omnirom.org/#/c/15943/)
- [ ] decrypt /data - Unlikely
- [ ] Correct date - Testing

Minor checks
- [ ] MTP export - Testing
- [x] reboot to bootloader
- [x] reboot to recovery
- [x] poweroff
- [x] battery level
- [x] temperature
- [ ] encrypted backups
- [ ] input devices via USB (USB-OTG) - keyboard, mouse and disks (not supported by the device)
- [ ] USB mass storage export
- [x] set brightness
- [ ] vibrate - Unlikely
- [ ] screenshot - Testing
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
    
