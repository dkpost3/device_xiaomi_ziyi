#
# Copyright (C) 2022-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from ziyi device
$(call inherit-product, device/xiaomi/ziyi/device.mk)

# Inherit from common lineage configuration
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# stuff
WITH_GMS := true
#TARGET_BUILD_APERTURE_CAMERA := false
TARGET_BUILD_GOOGLE_TELEPHONY := true
TARGET_BOOT_ANIMATION_RES := 1080
#TARGET_SHIPS_FULL_GAPPS := true
TARGET_DISABLE_EPPE := true
TARGET_SUPPORTS_BLUR := true
TARGET_SHIPS_MIUI := true

# Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_ziyi
PRODUCT_DEVICE := ziyi
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := 2210129SG

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="ziyi_global-user 15 AQ3A.240912.001 OS2.0.2.0.VLLMIXM release-keys" \
    BuildFingerprint=Xiaomi/ziyi_global/ziyi:15/AQ3A.240912.001/OS2.0.2.0.VLLMIXM:user/release-keys \
    DeviceProduct=ziyi \
    SystemName=ziyi_global

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
