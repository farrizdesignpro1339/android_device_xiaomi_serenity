#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/serenity

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Inherit languages and telephony
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)

# API levels
PRODUCT_SHIPPING_API_LEVEL := 33

# A/B packages
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service \
    checkpoint_gc \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Kernel
PRODUCT_ENABLE_UFFD_GC := true

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *
PRODUCT_PACKAGES += \
    FrameworksResOverlaySerenity \
    SettingsResOverlaySerenity \
    SystemUIOverlaySerenity \
    TetheringResOverlaySerenity
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := phone

# Hardware permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.output.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.output.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.any.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.any.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.network.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.network.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml

# GPU / Graphics properties
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.egl=mali \
    ro.hardware.vulkan=ums9230 \
    ro.opengles.version=196610 \
    ro.hwui.use_vulkan=true

# Hardware HAL properties
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.audio.primary=ums9230 \
    ro.hardware.camera=unisoc \
    ro.hardware.hwcomposer=unisoc \
    ro.hardware.sensors=unisoc \
    ro.hardware.enhance=unisoc \
    ro.hardware.dpu=unisoc \
    ro.hardware.gsp=unisoc \
    ro.soc.manufacturer=Spreadtrum \
    sys.usb.controller=musb-hdrc.0.auto

# Rootdir
PRODUCT_PACKAGES += \
    log_to_csv.sh \
    loading.sh \
    para.sh \
    total.sh \
    create_splloader_dual_slot_byname_path.sh \
    idlefast.sh \
    init.insmod.sh \
    speedrestrictor.sh \
    swappiness.sh \
    trafficshow.sh \
    zramwb.sh

PRODUCT_PACKAGES += \
    fstab.cali \
    fstab.serenity \
    init.cali.rc \
    init.ram.gms.rc \
    init.ram.native.rc \
    init.ram.rc \
    init.serenity.rc \
    init.serenity.usb.rc \
    init.socmodel.rc \
    init.storage.rc \
    init.zramwb.rc \
    init.recovery.common.rc \
    ueventd.serenity.rc

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/primary_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/primary_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_platform_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_config.xml \
    $(LOCAL_PATH)/audio/audio_route.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_route.xml \
    $(LOCAL_PATH)/audio/audio_pcm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_pcm.xml

# Audio params (Unisoc sprd)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_params/sprd/version1/audio_pga.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version1/audio_pga.xml \
    $(LOCAL_PATH)/audio/audio_params/sprd/version1/audio_process.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version1/audio_process.xml \
    $(LOCAL_PATH)/audio/audio_params/sprd/version1/audio_structure.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version1/audio_structure.xml \
    $(LOCAL_PATH)/audio/audio_params/sprd/version1/audioparam_config.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version1/audioparam_config.xml \
    $(LOCAL_PATH)/audio/audio_params/sprd/version1/codec.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version1/codec.xml \
    $(LOCAL_PATH)/audio/audio_params/sprd/version1/cvs.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version1/cvs.xml \
    $(LOCAL_PATH)/audio/audio_params/sprd/version1/dsp_vbc.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version1/dsp_vbc.xml \
    $(LOCAL_PATH)/audio/audio_params/sprd/version2/audio_pga.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version2/audio_pga.xml \
    $(LOCAL_PATH)/audio/audio_params/sprd/version2/audio_process.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version2/audio_process.xml \
    $(LOCAL_PATH)/audio/audio_params/sprd/version2/audio_structure.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version2/audio_structure.xml \
    $(LOCAL_PATH)/audio/audio_params/sprd/version2/audioparam_config.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version2/audioparam_config.xml \
    $(LOCAL_PATH)/audio/audio_params/sprd/version2/codec.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version2/codec.xml \
    $(LOCAL_PATH)/audio/audio_params/sprd/version2/cvs.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version2/cvs.xml \
    $(LOCAL_PATH)/audio/audio_params/sprd/version2/dsp_vbc.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version2/dsp_vbc.xml

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_c2_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2_v1.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_c2.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/unisoc_wifi_hal_arm64.xml:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/vendor_hals/unisoc_wifi_hal_arm64.xml

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    $(LOCAL_PATH)/configs/sensors/lux_param.json:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/lux_param.json \
    $(LOCAL_PATH)/configs/sensors/sensor_config.xml:$(TARGET_COPY_OUT_ODM)/etc/sensor_config.xml

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/gps_debug.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/gps_debug.conf

# Keylayout & IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/adaptive_ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/adaptive_ts.kl \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/idc/adaptive_ts.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/adaptive_ts.idc \
    $(LOCAL_PATH)/configs/idc/focaltech_ats.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/focaltech_ats.idc \
    $(LOCAL_PATH)/configs/idc/focaltech_spi_ts.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/focaltech_spi_ts.idc \
    $(LOCAL_PATH)/configs/idc/focaltech_ts.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/focaltech_ts.idc \
    $(LOCAL_PATH)/configs/idc/msg2138_ts.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/msg2138_ts.idc \
    $(LOCAL_PATH)/configs/idc/synaptics_dsx.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/synaptics_dsx.idc \
    $(LOCAL_PATH)/configs/idc/synaptics_dsx_i2c.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/synaptics_dsx_i2c.idc

# Power & Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/power/power_adpf_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/power_adpf_config.xml \
    $(LOCAL_PATH)/configs/power/power_scene_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/power_scene_config.xml \
    $(LOCAL_PATH)/configs/thermal/thermal.conf:$(TARGET_COPY_OUT_ODM)/etc/thermal.conf \
    $(LOCAL_PATH)/configs/thermal/thm_thresh_cfg.xml:$(TARGET_COPY_OUT_ODM)/etc/thm_thresh_cfg.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.cali:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.cali \
    $(LOCAL_PATH)/rootdir/etc/fstab.serenity:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.serenity

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/serenity/serenity-vendor.mk)
