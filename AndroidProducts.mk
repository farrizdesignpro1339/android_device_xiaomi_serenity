#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/aosp_serenity.mk \
    $(LOCAL_DIR)/lineage_serenity.mk \
    $(LOCAL_DIR)/pixelos_serenity.mk

COMMON_LUNCH_CHOICES := \
    aosp_serenity-bp4a-user \
    aosp_serenity-bp4a-userdebug \
    aosp_serenity-bp4a-eng \
    lineage_serenity-bp4a-user \
    lineage_serenity-bp4a-userdebug \
    lineage_serenity-bp4a-eng \
    pixelos_serenity-bp4a-user \
    pixelos_serenity-bp4a-userdebug \
    pixelos_serenity-bp4a-eng
