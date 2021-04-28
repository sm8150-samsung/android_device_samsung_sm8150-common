BOARD_VENDOR := samsung
COMMON_PATH := device/samsung/sm8150-common

# APEX
#DEXPREOPT_GENERATE_APEX_IMAGE := true
TARGET_FLATTEN_APEX := true

# APN (Custom APN)
CUSTOM_APNS_FILE := $(COMMON_PATH)/configs/apns-full-conf.xml

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a9

TARGET_USES_64_BIT_BINDER := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msmnile
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Enable dexpreopt to speed boot time
ifeq ($(HOST_OS),linux)
    ifneq ($(TARGET_BUILD_VARIANT),eng)
        ifeq ($(WITH_DEXPREOPT),)
            WITH_DEXPREOPT := true
        endif
    endif
endif

# HIDL Auto Device Selector- PizzaG
ifeq ($(PRODUCT_DEVICE), beyond1qlte)
	DEVICE_FRAMEWORK_MANIFEST_FILE += $(COMMON_PATH)/framework_manifest.xml
endif

ifeq ($(PRODUCT_DEVICE), beyond2qlte)
	DEVICE_FRAMEWORK_MANIFEST_FILE += $(COMMON_PATH)/framework_manifest.xml
endif

ifeq ($(PRODUCT_DEVICE), d1q)
	DEVICE_FRAMEWORK_MANIFEST_FILE += $(COMMON_PATH)/framework_manifest.xml
endif

ifeq ($(PRODUCT_DEVICE), d2q)
	DEVICE_FRAMEWORK_MANIFEST_FILE += $(COMMON_PATH)/framework_manifest.xml
endif

# FOD Auto Device Selector- PizzaG
ifeq ($(PRODUCT_DEVICE), beyond1qlte)
	TARGET_SURFACEFLINGER_FOD_LIB := //$(COMMON_PATH):libfod_extension.beyond1qlte
endif

ifeq ($(PRODUCT_DEVICE), beyond2qlte)
	TARGET_SURFACEFLINGER_FOD_LIB := //$(COMMON_PATH):libfod_extension.beyond2qlte
endif

ifeq ($(PRODUCT_DEVICE), d1q)
	TARGET_SURFACEFLINGER_FOD_LIB := //$(COMMON_PATH):libfod_extension.d1q
endif

ifeq ($(PRODUCT_DEVICE), d2q)
	TARGET_SURFACEFLINGER_FOD_LIB := //$(COMMON_PATH):libfod_extension.d2q
endif

# Kernel
TARGET_KERNEL_ARCH := arm64 
TARGET_KERNEL_CLANG_COMPILE := true
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_SYSTEM_EXT := system/system_ext
TARGET_COPY_OUT_VENDOR := vendor
BUILD_WITHOUT_VENDOR := true 

# Properties
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_SYSTEM_EXT_PROP += $(COMMON_PATH)/system_ext.prop
TARGET_PRODUCT_PROP += $(COMMON_PATH)/product.prop

# Recovery
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_NO_RECOVERY := false
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.qcom

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_samsung
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

# Root
TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/config.fs
BOARD_ROOT_EXTRA_FOLDERS := \
    carrier \
    dqmdbg \
    efs \
    keydata \
    keyrefuge \
    metadata \
    optics \
    prism \
    spu \
    omr

# SELinux
include device/qcom/sepolicy/SEPolicy.mk

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/samsung_slsi/sepolicy/common/private \
    $(COMMON_PATH)/sepolicy/private

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/samsung_slsi/sepolicy/common/public

BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(COMMON_PATH) \
    hardware/google/interfaces \
    hardware/google/pixel

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
