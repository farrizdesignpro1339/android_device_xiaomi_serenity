#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from serenity device
$(call inherit-product, device/xiaomi/serenity/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_DEVICE := serenity
PRODUCT_NAME := lineage_serenity
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 25028RN03A
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="mivendor_ums9230-user 16 BP2A.250805.002 A16.0.0.1.VGWIDXM release-keys" \
    BuildFingerprint=Redmi/mivendor_ums9230/mivendor_ums9230:16/BP2A.250805.002/A16.0.0.1.VGWIDXM:user/release-keys
