#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

import extract_utils.tools
extract_utils.tools.DEFAULT_PATCHELF_VERSION = '0_18'

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixup_remove,
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/xiaomi/sm8450-common',
    'hardware/qcom-caf/sm8450',
    'hardware/xiaomi',
    'vendor/qcom/opensource/commonsys-intf/display',
    'vendor/xiaomi/sm8450-common',
]

lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    (
        'libagmclient',
        'libagmmixer',
        'vendor.qti.hardware.pal@1.0-impl',
    ): lib_fixup_remove,
}

blob_fixups: blob_fixups_user_type = {
    'vendor/lib64/hw/audio.primary.taro.so': blob_fixup()
        .replace_needed('libstagefright_foundation.so', 'libstagefright_foundation-v33.so'),
    (
        'vendor/etc/camera/ziyi_enhance_motiontuning.xml',
        'vendor/etc/camera/ziyi_motiontuning.xml',
        ): blob_fixup().regex_replace('xml=version', 'xml version'),
    (
        'vendor/etc/camera/pureShot_parameter.xml',
        'vendor/etc/camera/pureView_parameter.xml',
    ): blob_fixup().regex_replace(r'=([0-9]+)>', r'="\1">'),
    'vendor/lib64/hw/fingerprint.goodix_fod.default.so': blob_fixup().binary_regex_replace(
        b'/sys/class/touch/touch_dev/fod_press_status',
        b'/sys/class/touch/touch_dev/fod_finger_state'
    ),
        'vendor/lib64/libcamximageformatutils.so': blob_fixup().replace_needed(
        'vendor.qti.hardware.display.config-V2-ndk_platform.so',
        'vendor.qti.hardware.display.config-V2-ndk.so'
    ),
    (
        'vendor/bin/hw/dolbycodec2',
        'vendor/bin/hw/vendor.dolby.hardware.dms@2.0-service',
    ): blob_fixup()
        .add_needed('libstagefright_foundation-v33.so'),
    (
        'vendor/lib/c2.dolby.client.so',
        'vendor/lib64/c2.dolby.client.so',
    ): blob_fixup()
        .add_needed('libcodec2_hidl_shim.so'),
}

module = ExtractUtilsModule(
    'ziyi',
    'xiaomi',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
    check_elf=True,
    add_firmware_proprietary_file=True,)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'sm8450-common', module.vendor
    )
    utils.run()
