#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/aosp_serenity.mk \
    $(LOCAL_DIR)/lineage_serenity.mk \
    $(LOCAL_DIR)/pixelos_serenity.mk

COMMON_LUNCH_CHOICES := \
    aosp_serenity-cp2a-user \
    aosp_serenity-cp2a-userdebug \
    aosp_serenity-cp2a-eng \
    lineage_serenity-cp2a-user \
    lineage_serenity-cp2a-userdebug \
    lineage_serenity-cp2a-eng \
    pixelos_serenity-cp2a-user \
    pixelos_serenity-cp2a-userdebug \
    pixelos_serenity-cp2a-eng
