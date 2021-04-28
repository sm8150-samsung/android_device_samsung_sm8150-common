COMMON_PATH := device/samsung/sm8150-common

PRODUCT_TARGET_VNDK_VERSION := 29

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Proprietary blobs
$(call inherit-product-if-exists, vendor/samsung/sm8150-common/sm8150-common-vendor.mk)

# Audio 
PRODUCT_PACKAGES += \
    audio.a2dp.default

# Bootanimation Resolution
TARGET_BOOT_ANIMATION_RES := 1080

# Camera
PRODUCT_PACKAGES += \
    Snap

# Display Auto Device Selector- PizzaG
## Beyond1qlte
ifeq ($(PRODUCT_DEVICE), beyond1qlte)
  PRODUCT_PRODUCT_PROPERTIES := ro.sf.lcd_density=560
endif

## Beyond2qlte
ifeq ($(PRODUCT_DEVICE), beyond2qlte)
  PRODUCT_PRODUCT_PROPERTIES := ro.sf.lcd_density=560
endif

## D1Q
ifeq ($(PRODUCT_DEVICE), d1q)
  PRODUCT_PRODUCT_PROPERTIES := ro.sf.lcd_density=560
endif

## D2Q
ifeq ($(PRODUCT_DEVICE), d2q)
  PRODUCT_PRODUCT_PROPERTIES := ro.sf.lcd_density=560
endif

# Fingerprint 
## All Devices
PRODUCT_COPY_FILES += \
    device/samsung/sm8150-common/configs/vendor.lineage.biometrics.fingerprint.inscreen.xml:system/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml

## Beyond0qlte
ifeq ($(PRODUCT_DEVICE), beyond0qlte)
  PRODUCT_PACKAGES := android.hardware.biometrics.fingerprint@2.1-service.samsung
endif

## Beyond1qlte
ifeq ($(PRODUCT_DEVICE), beyond1qlte)
  PRODUCT_PACKAGES := lineage.biometrics.fingerprint.inscreen@1.0-service.beyond1qlte
endif

## Beyond2qlte
ifeq ($(PRODUCT_DEVICE), beyond2qlte)
  PRODUCT_PACKAGES := lineage.biometrics.fingerprint.inscreen@1.0-service.beyond2qlte
endif

## D1Q
ifeq ($(PRODUCT_DEVICE), d1q)
  PRODUCT_PACKAGES := lineage.biometrics.fingerprint.inscreen@1.0-service.d1q
endif

## D2Q
ifeq ($(PRODUCT_DEVICE), d2q)
  PRODUCT_PACKAGES := lineage.biometrics.fingerprint.inscreen@1.0-service.d2q
endif

# Gapps Selector
ifeq ($(HAS_GAPPS), true)
  $(call inherit-product, vendor/gapps/gapps.mk)
endif

# GSI Skip Mount
PRODUCT_PACKAGES += \
    gsi_skip_mount.cfg

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/com.android.hotwordenrollment.common.util.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.android.hotwordenrollment.common.util.xml \
    $(COMMON_PATH)/configs/hotword-hiddenapi-package-allowlist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/hotword-hiddenapi-package-allowlist.xml \
    $(COMMON_PATH)/configs/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# Init
PRODUCT_PACKAGES += \
    init.qcom.rc \
	fstab.qcom

# Lights
PRODUCT_PACKAGES += \
	android.hardware.light-service.sm8150

# NFC
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag \
    com.android.nfc_extras

# OTA Updater
AB_OTA_UPDATER := false

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    $(COMMON_PATH)/overlay \
    $(COMMON_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_TARGETS += *

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.sm8150-libperfmgr

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/etc/powerhint.json

# Recovery
PRODUCT_PACKAGES += \
    fastbootd \
    init.recovery.qcom.rc

# SamsungDoze
PRODUCT_PACKAGES += \
    SamsungDoze

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.1-service.sm8150-multihal

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:system/etc/permissions/android.hardware.sensor.hifi_sensors.xml

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Touch
PRODUCT_PACKAGES += \
    lineage.touch@1.0-service.sm8150

# Trust HAL
PRODUCT_PACKAGES += \
    lineage.trust@1.0-service

# WiFi
PRODUCT_PACKAGES += \
    WifiOverlay

#PRODUCT_PROPERTY_OVERRIDES += \
#    wifi.interface=wlan0

