#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from serenity device
$(call inherit-product, device/xiaomi/serenity/device.mk)

# Inherit some common PixelOS stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

PRODUCT_DEVICE := serenity
PRODUCT_NAME := aosp_serenity
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 25028RN03A
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="mivendor_ums9230-user 15 AP3A.240905.015.A2 A15.0.11.0.VGWIDXM release-keys" \
    BuildFingerprint=Redmi/mivendor_ums9230/mivendor_ums9230:15/AP3A.240905.015.A2/A15.0.11.0.VGWIDXM:user/release-keys

# PixelOS flags
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_BOOT_ANIMATION_RES := 720
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_INCLUDE_STOCK_ARCORE := false
TARGET_INCLUDE_CARRIER_SERVICES := false
