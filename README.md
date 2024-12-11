# Android device tree for samsung SM-A057G (a05s)


# How-to compile it:

## twrp-12.1 Manifest
    repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
## Sync
    repo sync
## Clone galaxy a05s TWRP tree
    git clone https://github.com/galaxy-a05s/android_device_samsung_a05sxx.git -b twrp-14 device/samsung/a05s
## Prepare
    export ALLOW_MISSING_DEPENDENCIES=true; . build/envsetup.sh; lunch twrp_a05s-eng
## Run the Build Command
    mka recoveryimage
