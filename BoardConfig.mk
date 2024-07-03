#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a05s

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic

# Second Architecture
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a9

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Additional
TARGET_USES_UEFI := true
TARGET_IS_64_BIT := true
TARGET_USES_64_BIT_BINDER := true
TARGET_BOARD_SUFFIX := _64
TARGET_NO_BOOTLOADER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := bengal
TARGET_BOARD_PLATFORM := bengal
QCOM_BOARD_PLATFORMS := bengal
TARGET_BOARD_PLATFORM_GPU := Adreno-610

# Board
BOARD_USES_QCOM_HARDWARE := true
BOARD_NO_RADIOIMAGE := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true

# Display
TARGET_SCREEN_DENSITY := 393
TARGET_SCREEN_HEIGHT := 1080
TARGET_SCREEN_WIDTH := 2400

# Logging
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TWRP_EVENT_LOGGING := true

# Commandline
BOARD_KERNEL_CMDLINE := video=vfb:640x400,bpp=32,memsize=3072000 \
                        firmware_class.path=/vendor/firmware_mnt/image \
                        printk.devkmsg=on \
                        bootconfig \
                        androidboot.hardware=qcom \
                        androidboot.memcg=1 \
                        androidboot.load_modules_parallel=true \
                        androidboot.usbcontroller=4e00000.dwc3 \
                        loop.max_part=7

# Kernel
TARGET_KERNEL_ARCH := arm64
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

# DTBO
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_INCLUDE_RECOVERY_DTBO := true

# mkbootimg
BOARD_MKBOOTIMG_ARGS:= \
--board=SRPWF12A003 \
--dtb_offset=0x01f00000 \
--kernel_offset=0x00008000 \
--ramdisk_offset=0x02000000 \
--tags_offset=0x01e00000 \
--header_version=$(BOARD_BOOTIMG_HEADER_VERSION) \
--dtb=$(TARGET_PREBUILT_DTB)

# Sourcecode
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CONFIG := a05s_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/a05s

# Flash Block
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296

# Filesystem Config
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USES_METADATA_PARTITION := true
BOARD_USES_QCOM_FBE_DECRYPTION := true

# Partition Types
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# Super/Dynamic
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system system system vendor system_ext vendor_dlkm product odm
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Platform
TARGET_BOARD_PLATFORM := bengal

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_USE_EXTERNAL_STORAGE := true
TW_EXCLUDE_APEX := true
TW_NO_BIND_SYSTEM := true
TW_PREPARE_DATA_MEDIA_EARLY := true
TW_FORCE_KEYMASTER_VER := true

# VERSION
TW_DEVICE_VERSION := MF0_A057G_S3

# USB
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_USE_NEW_MINADBD := true

# Boot Mode
TW_NO_REBOOT_BOOTLOADER := true
TW_INCLUDE_FASTBOOTD := true
TW_HAS_DOWNLOAD_MODE := true

# Copy Out
TARGET_COPY_OUT_VENDOR := vendor

# Props
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP := true
TW_NO_LEGACY_PROPS := true

# Modules
TW_LOAD_VENDOR_MODULES := $(shell echo \"$(shell ls $(DEVICE_PATH)/recovery/root/lib/modules)\")