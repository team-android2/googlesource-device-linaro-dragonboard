#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_SOONG_NAMESPACES += \
    device/linaro/dragonboard

# setup dalvik vm configs
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

PRODUCT_COPY_FILES := \
    $(DB845C_KERNEL_DIR)/Image.gz:kernel \
    $(DB845C_KERNEL_DIR)/sdm845-db845c.dtb:dtb.img \
    device/linaro/dragonboard/fstab.common:$(TARGET_COPY_OUT_RAMDISK)/fstab.db845c \
    device/linaro/dragonboard/fstab.common:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.db845c \
    device/linaro/dragonboard/init.common.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.db845c.rc \
    device/linaro/dragonboard/init.common.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.db845c.usb.rc \
    device/linaro/dragonboard/common.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/db845c.kl

# Build generic Audio HAL
PRODUCT_PACKAGES := audio.primary.db845c

# BootControl HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl \
    android.hardware.boot@1.1-impl.recovery \
    android.hardware.boot@1.1-service

PRODUCT_PACKAGES += \
    pd-mapper \
    qrtr-ns \
    qrtr-cfg \
    qrtr-lookup \
    rmtfs \
    tqftpserv

PRODUCT_COPY_FILES += \
    device/linaro/dragonboard/qcom/init.qcom.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.qcom.rc

# Install scripts to set Ethernet MAC address
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/eth_mac_addr.rc:/system/etc/init/eth_mac_addr.rc \
    $(LOCAL_PATH)/eth_mac_addr.sh:/system/bin/eth_mac_addr.sh

# Copy firmware files
$(call inherit-product-if-exists, $(LOCAL_PATH)/firmware/device.mk)
