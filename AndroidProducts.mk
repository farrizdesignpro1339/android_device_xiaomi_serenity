#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/aosp_serenity.mk \
    $(LOCAL_DIR)/lineage_serenity.mk \
    $(LOCAL_DIR)/pixelos_serenity.mk

COMMON_LUNCH_CHOICES := \
    aosp_serenity-user \
    aosp_serenity-userdebug \
    aosp_serenity-eng \
    lineage_serenity-user \
    lineage_serenity-userdebug \
    lineage_serenity-eng \
    pixelos_serenity-user \
    pixelos_serenity-userdebug \
    pixelos_serenity-eng
