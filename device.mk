#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/motorola/saipan

# Particiones dinamicas (variable de producto: va aqui, no en BoardConfig.mk)
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL (A/B)
# PRODUCT_STATIC_BOOT_CONTROL_HAL esta obsoleto desde Android 12: se usa el HAL compartido.
# El HAL de MediaTek (android.hardware.boot@1.0-impl-1.2-mtkimpl.so) se copia desde el
# firmware stock a recovery/root/system/lib64/hw/
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload
