# Copyright (C) 2017-2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := device/samsung/j7elte

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_0.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-service

# Boot animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Camera
PRODUCT_PACKAGES += \
    Snap

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/gps.xml:system/etc/gps.xml

# Graphics
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_AAPT_PREBUILT_DPI := hdpi mdpi

# HIDL Manifest
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/manifest.xml:$(TARGET_COPY_OUT_VENDOR)/manifest.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio_keys.kl:system/usr/keylayout/gpio_keys.kl \
    $(LOCAL_PATH)/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    $(LOCAL_PATH)/configs/permissions/com.samsung.permission.HRM_EXT.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.samsung.permission.HRM_EXT.xml \
    $(LOCAL_PATH)/configs/permissions/com.samsung.permission.SSENSOR.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.samsung.permission.SSENSOR.xml

# Properties
-include $(LOCAL_PATH)/system_prop.mk

# Radio
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    libsecril-client \
    modemloader \
    libxml2 \
    rild \
    libril \
    libreference-ril \
    libsecril-client-sap \
    android.hardware.radio@1.1 \
    android.hardware.radio.deprecated@1.0

PRODUCT_COPY_FILES += \
    device/samsung/universal7580-common/configs/init/rild.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/rild.legacy.rc

# Ramdisk
PRODUCT_PACKAGES += \
    init.target.rc

# Vendor security patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2018-04-01

# Wi-fi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/cred.conf:system/etc/wifi/cred.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/filter_ie:system/etc/wifi/filter_ie

# Inherit from universal7580-common
$(call inherit-product, device/samsung/universal7580-common/device-common.mk)

# Call the proprietary setup
$(call inherit-product, vendor/samsung/j7elte/j7elte-vendor.mk)
