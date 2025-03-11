#
# Copyright (C) 2022-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from xiaomi sm8450-common
$(call inherit-product, device/xiaomi/sm8450-common/common.mk)

# Inherit from the proprietary version
$(call inherit-product, vendor/xiaomi/ziyi/ziyi-vendor.mk)

# Call the BCR setup
$(call inherit-product, vendor/bcr/bcr.mk)

# MIUI CAMERA
$(call inherit-product-if-exists, device/xiaomi/miuicamera-ziyi/device.mk)

# GMS
$(call inherit-product-if-exists, vendor/gms/products/gms.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display/display_id_4630946480857061762.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/displayconfig/display_id_4630946480857061762.xml \
    $(LOCAL_PATH)/configs/display/display_id_4630946545580055170.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/displayconfig/display_id_4630946545580055170.xml

# init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.ziyi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.ziyi.rc

# Overlay
PRODUCT_PACKAGES += \
    ApertureResZiyi \
    ZiyiEuiccOverlay \
    FrameworksResZiyi \
    NfcResZiyi \
    SettingsProviderResZiyi \
    SettingsProviderResZiyiCN \
    SettingsResZiyi \
    SystemUIResZiyi \
    WifiResZiyi \
    WifiResZiyiCN

PRODUCT_PACKAGES += \
    XiaomiEuicc

PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.feature.esim_enabled=true
    ro.setupwizard.rotation_locked=true \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    setupwizard.feature.day_night_mode_enabled=true \
    setupwizard.feature.portal_notification=true \
    setupwizard.feature.show_pixel_tos=true \
    setupwizard.feature.show_support_link_in_deferred_setup=true \
    ro.setupwizard.enterprise_mode=1

# Logging
SPAMMY_LOG_TAGS := \
    MiStcImpl \
    SDM \
    SDM-histogram \
    SRE \
    SensorService \
    WifiHAL \
    cnss-daemon \
    libcitsensorservice@2.0-impl \
    libsensor-displayalgo \
    libsensor-parseRGB \
    libsensor-ssccalapi \
    sensors \
    vendor.qti.hardware.display.composer-service \
    vendor.xiaomi.sensor.citsensorservice@2.0-service

ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_VENDOR_PROPERTIES += \
    $(foreach tag,$(SPAMMY_LOG_TAGS),log.tag.$(tag)=E)
endif

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# System properties
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/properties/build_CN.prop:$(TARGET_COPY_OUT_ODM)/etc/build_CN.prop \
    $(LOCAL_PATH)/properties/build_GL.prop:$(TARGET_COPY_OUT_ODM)/etc/build_GL.prop

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/properties/build_CN.prop:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/odm/etc/build_CN.prop \
    $(LOCAL_PATH)/properties/build_GL.prop:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/odm/etc/build_GL.prop
