#
# Copyright (C) 2009 The Android Open Source Project
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

#
# This is the product configuration for a generic GSM passion,
# not specialized for any geography.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/motorola/umts_sholes/init.mapphone_umts.rc:root/init.mapphone_umts.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/motorola/umts_sholes/umts_sholes-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.error.receiver.system.apps=com.google.android.feedback \
	ro.setupwizard.enterprise_mode=1 \
        ro.com.google.clientid=android-motorola \
	ro.com.google.clientidbase=android-motorola \
	ro.com.google.locationfeatures=1 \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
	ro.config.vc_call_vol_steps=7 \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.call_ring.delay=3000 \
	ro.url.safetylegal=http://www.motorola.com/staticfiles/Support/legal/?model=A853 \
	ro.setupwizard.enable_bypass=1 \
	ro.media.dec.jpeg.memcap=20000000 \
	dalvik.vm.lockprof.threshold=500 \
	dalvik.vm.dexopt-flags=m=y \
        ro.product.multi_touch_enabled=true \
        ro.product.max_num_touch=2 \
        ro.com.google.gmsversion=2.2_r6 

DEVICE_PACKAGE_OVERLAYS += device/motorola/umts_sholes/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/motorola/umts_sholes/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    librs_jni

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Passion uses high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    device/motorola/umts_sholes/vold.fstab:system/etc/vold.fstab \
    device/motorola/umts_sholes/prebuilt/default.prop:system/default.prop \
    device/motorola/umts_sholes/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/motorola/umts_sholes/prebuilt/etc/voicemail-conf.xml:system/etc/voicemail-conf.xml \
    device/motorola/umts_sholes/prebuilt/etc/init.d/10overclock:/system/etc/init.d/10overclock \
    device/motorola/umts_sholes/prebuilt/etc/location.cfg:/system/etc/location.cfg \
    device/motorola/umts_sholes/prebuilt/etc/rootfs/default.prop:/system/etc/rootfs/default.prop \
    device/motorola/umts_sholes/prebuilt/etc/rootfs/init.rc:/system/etc/rootfs/init.rc \
    device/motorola/umts_sholes/prebuilt/etc/rootfs/init.mapphone_umts.rc:/system/etc/rootfs/init.mapphone_umts.rc \
    device/motorola/umts_sholes/prebuilt/etc/wifi/tiwlan.ini:/system/etc/wifi/tiwlan.ini \
    device/motorola/umts_sholes/prebuilt/bin/2nd-init:/system/bin/2nd-init \
    device/motorola/umts_sholes/prebuilt/bin/init_prep_keypad.sh:/system/bin/init_prep_keypad.sh \
    device/motorola/umts_sholes/prebuilt/bin/sh_hijack.sh:/system/bin/sh_hijack.sh \
    device/motorola/umts_sholes/prebuilt/usr/keychars/sholesp2a-keypad.kcm.bin:/system/usr/keychars/sholesp2a-keypad.kcm.bin \
    device/motorola/umts_sholes/prebuilt/app/Usb.apk:/system/app/Usb.apk \
    device/motorola/umts_sholes/prebuilt/app/Toggle2G.apk:/system/app/Toggle2G.apk \
    device/motorola/umts_sholes/prebuilt/app/Toggle_2G_Notification_Plugin.apk:/system/app/Toggle_2G_Notification_Plugin.apk \
    device/motorola/umts_sholes/prebuilt/lib/modules/symsearch.ko:/system/lib/modules/symsearch.ko \
    device/motorola/umts_sholes/prebuilt/lib/modules/cpufreq_interactive.ko:/system/lib/modules/cpufreq_interactive.ko \
    device/motorola/umts_sholes/prebuilt/lib/modules/cpufreq_conservative.ko:/system/lib/modules/cpufreq_conservative.ko \
    device/motorola/umts_sholes/prebuilt/lib/modules/overclock.ko:/system/lib/modules/overclock.ko

$(call inherit-product-if-exists, vendor/motorola/umts_sholes/umts_sholes-vendor.mk)

# media profiles and capabilities spec
# $(call inherit-product, device/motorola/sholes/media_a1026.mk)

# stuff common to all HTC phones
#$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full.mk)


PRODUCT_NAME := umts_sholes
PRODUCT_DEVICE := umts_sholes
