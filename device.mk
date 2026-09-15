#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/serenity

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

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

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# Kernel
PRODUCT_ENABLE_UFFD_GC := true

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@7.1-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio-impl \
    audio.bluetooth.default \
    audio.usb.default \
    audio.r_submix.default \
    audio_policy.stub

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.1-service.unisoc \
    android.hardware.bluetooth@1.1.vendor \
    libbluetooth_audio_session

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-service_64 \
    android.hardware.camera.provider@2.4-impl-sprd \
    camera.unisoc

# Display & Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@4.0-service \
    android.hardware.graphics.allocator@4.0-impl-arm \
    android.hardware.graphics.mapper@4.0-impl-arm \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.memtrack-service \
    libutils.vendor \
    libgralloc_extra \
    gralloc.unisoc \
    hwcomposer.unisoc \
    dpu.unisoc \
    gsp.unisoc

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service-lazy.clearkey \
    android.hardware.drm-service-lazy.widevine

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-service \
    vendor.silead.hardware.fingerprintext-service \
    vendor.sprd.hardware.fingerprintmmi-service \
    libvendor.goodix.hardware.biometrics.fingerprint@2.1 \
    fingerprint.goodix.default \
    fingerprint.silead.default

# Face
PRODUCT_PACKAGES += \
    mifaced

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service.trusty

# Keymaster / Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint@2.0-unisoc.service.trusty \
    android.hardware.identity-service.trusty

# Light
PRODUCT_PACKAGES += \
    android.hardware.light

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@aidl-service-armnn-gpu

# Power
PRODUCT_PACKAGES += \
    vendor.unisoc.hardware.power-service \
    android.hardware.power-service \
    android.hardware.power.stats-service.example

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors-service.multihal

# Thermal
PRODUCT_PACKAGES += \
    thermald

# Trusty / TEE
PRODUCT_PACKAGES += \
    vendor.sprd.hardware.trusty-service \
    vendor.sprd.hardware.tui-service

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb-service.unisoc

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service-lazy \
    android.hardware.wifi.service \
    wpa_supplicant \
    hostapd \
    libwifi-hal-wrapper

# GNSS
PRODUCT_PACKAGES += \
    vendor.sprd.hardware.gnss-service

# Xiaomi HIDL interfaces
PRODUCT_PACKAGES += \
    vendor.xiaomi.hardware.micharge@1.0 \
    vendor.xiaomi.hardware.misys@1.0 \
    vendor.xiaomi.hardware.misys@2.0 \
    vendor.xiaomi.hardware.misys@3.0 \
    vendor.xiaomi.hardware.misys@4.0

# Media
PRODUCT_PACKAGES += \
    android.hardware.media.c2@1.1-unisoc-service \
    android.hardware.media.omx@1.0-service

# CAS
PRODUCT_PACKAGES += \
    android.hardware.cas@1.2-service-lazy

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
PRODUCT_BUILD_SUPER_PARTITION := false

# Product characteristics
PRODUCT_CHARACTERISTICS := phone

# Cgroup
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups_30.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

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
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/configs/audio/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/bluetooth/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/bluetooth/bluetooth_audio_policy_configuration_disable_offload.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration_disable_offload.xml \
    $(LOCAL_PATH)/configs/bluetooth/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
    $(LOCAL_PATH)/configs/bluetooth/bt_configure_pskey.ini:$(TARGET_COPY_OUT_ODM)/etc/bluetooth/bt_configure_pskey.ini \
    $(LOCAL_PATH)/configs/bluetooth/bt_configure_rf.ini:$(TARGET_COPY_OUT_ODM)/etc/bluetooth/bt_configure_rf.ini \
    $(LOCAL_PATH)/configs/audio/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/primary_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/primary_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_config.xml \
    $(LOCAL_PATH)/configs/audio/audio_route.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_route.xml \
    $(LOCAL_PATH)/configs/audio/audio_pcm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_pcm.xml

# Audio params (Unisoc sprd)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_params/sprd/version1/audio_pga.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version1/audio_pga.xml \
    $(LOCAL_PATH)/configs/audio/audio_params/sprd/version1/audio_process.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version1/audio_process.xml \
    $(LOCAL_PATH)/configs/audio/audio_params/sprd/version1/audio_structure.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version1/audio_structure.xml \
    $(LOCAL_PATH)/configs/audio/audio_params/sprd/version1/audioparam_config.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version1/audioparam_config.xml \
    $(LOCAL_PATH)/configs/audio/audio_params/sprd/version1/codec.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version1/codec.xml \
    $(LOCAL_PATH)/configs/audio/audio_params/sprd/version1/cvs.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version1/cvs.xml \
    $(LOCAL_PATH)/configs/audio/audio_params/sprd/version1/dsp_vbc.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version1/dsp_vbc.xml \
    $(LOCAL_PATH)/configs/audio/audio_params/sprd/version2/audio_pga.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version2/audio_pga.xml \
    $(LOCAL_PATH)/configs/audio/audio_params/sprd/version2/audio_process.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version2/audio_process.xml \
    $(LOCAL_PATH)/configs/audio/audio_params/sprd/version2/audio_structure.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version2/audio_structure.xml \
    $(LOCAL_PATH)/configs/audio/audio_params/sprd/version2/audioparam_config.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version2/audioparam_config.xml \
    $(LOCAL_PATH)/configs/audio/audio_params/sprd/version2/codec.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version2/codec.xml \
    $(LOCAL_PATH)/configs/audio/audio_params/sprd/version2/cvs.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version2/cvs.xml \
    $(LOCAL_PATH)/configs/audio/audio_params/sprd/version2/dsp_vbc.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_params/sprd/version2/dsp_vbc.xml

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

# Fingerprint keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/adaptive_ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/adaptive_ts.kl \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-goodix.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-silead.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-silead.kl

# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/adaptive_ts.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/adaptive_ts.idc \
    $(LOCAL_PATH)/configs/idc/focaltech_ats.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/focaltech_ats.idc \
    $(LOCAL_PATH)/configs/idc/focaltech_spi_ts.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/focaltech_spi_ts.idc \
    $(LOCAL_PATH)/configs/idc/focaltech_ts.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/focaltech_ts.idc \
    $(LOCAL_PATH)/configs/idc/msg2138_ts.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/msg2138_ts.idc \
    $(LOCAL_PATH)/configs/idc/synaptics_dsx.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/synaptics_dsx.idc \
    $(LOCAL_PATH)/configs/idc/synaptics_dsx_i2c.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/synaptics_dsx_i2c.idc

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

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
    $(LOCAL_PATH) \
    hardware/xiaomi

# Vendor modules
$(call inherit-product, vendor/xiaomi/serenity/serenity-vendor.mk)
