# Copyright (C) 2015 The CyanogenMod Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/a5-common

# Platform
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno306
TARGET_BOOTLOADER_BOARD_NAME := MSM8916

# Arch
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_CORTEX_A53 := true

# Kernel
TARGET_KERNEL_ARCH := arm
BOARD_DTBTOOL_ARGS := -2
#BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=enforcing
BOARD_KERNEL_BASE := 0x80000000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_SOURCE := kernel/samsung/msm8916
TARGET_KERNEL_CONFIG := cm_a5ultexx_defconfig 
#cm_a5ultexx_defconfig
#TARGET_PREBUILT_KERNEL := device/samsung/a5-common/prebuilt/kernel

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) --cmdline "console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=enforcing"


# Toolchain
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.8/bin
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-

# Partition sizes
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 13631488
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640  	# the default value is: 167286400 Increased from 1572... to 1672... because the kernel is too small for recovery.
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2411724800  	# If u want to build cm recovery use prebuilt kernel (uncomment the line) which is compressed with LZMA
BOARD_PERSISTIMAGE_PARTITION_SIZE := 8388608 		#2516582400   # and reset the size to 157286400
BOARD_CACHEIMAGE_PARTITION_SIZE := 314572800 		#209715200
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12775829504 	#12775813120
BOARD_FLASH_BLOCK_SIZE := 131072

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/a5-common/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Custom RIL class
TARGET_RIL_VARIANT := caf
BOARD_RIL_CLASS := ../../../device/samsung/a5-common/ril/
USE_DEVICE_SPECIFIC_DATASERVICES := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGER_ENABLE_SUSPEND := true

# Enable QCOM FM feature
TARGET_QCOM_NO_FM_FIRMWARE := true

# Build our own PowerHAL
TARGET_POWERHAL_VARIANT := qcom
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(LOCAL_PATH)/power/power_ext.c

# Touchscreen
TARGET_TAP_TO_WAKE_NODE := "/sys/class/sec/sec_touchscreen/wake_gesture"

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_PROVIDES_WCNSS_QMI := true
TARGET_USES_QCOM_WCNSS_QMI := true
TARGET_USES_WCNSS_CTRL := true
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_MAX_PARTITIONS := 65

# Camera
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true

# CMHW
BOARD_HARDWARE_CLASS += device/samsung/a5-common/cmhw

# Workaround to avoid issues with legacy liblights on QCOM platforms
TARGET_PROVIDES_LIBLIGHT := true

# Qcom
BOARD_USES_QC_TIME_SERVICES := true
TARGET_USES_QCOM_BSP := true
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
PROTOBUF_SUPPORTED := true
HAVE_SYNAPTICS_I2C_RMI4_FW_UPGRADE := true

# Media
TARGET_QCOM_MEDIA_VARIANT := caf

# Display
TARGET_CONTINUOUS_SPLASH_ENABLED := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    device/samsung/a5-common/sepolicy

# Misc.
TARGET_SYSTEM_PROP := device/samsung/a5-common/system.prop

# Display
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"

# Keys
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/a5-common/recovery/recovery_keys.c
BOARD_HAS_NO_SELECT_BUTTON := true

# Storage
TARGET_RECOVERY_FSTAB := device/samsung/a5-common/rootdir/etc/fstab.qcom

RECOVERY_SDCARD_ON_DATA := true

# Misc.
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Text Relocations
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

#RECOVERY_VARIANT := twrp
# TWRP
ifeq ($(RECOVERY_VARIANT),twrp)
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 100
TW_MTP_DEVICE := "/dev/usb_mtp_gadget"
TW_EXCLUDE_SUPERSU := true
TW_USE_TOYBOX := true
TWRP_NEW_THEME := true
endif

# Carliv Recovery
ifeq ($(RECOVERY_VARIANT),carliv)
TARGET_RECOVERY_DENSITY := xhdpi
VIBRATOR_TIMEOUT_FILE := /sys/devices/virtual/timed_output/vibrator/enable
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
DEVICE_RESOLUTION := 720x1280
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
BOARD_USE_PROTOCOL_TYPE_B := true
BOARD_INCLUDE_CRYPTO := true
# USB OTG and External Sdcard
TARGET_USES_EXFAT := true
TARGET_USES_NTFS := true
# Qcom
RECOVERY_GRAPHICS_FORCE_USE_LINELENGTH := true
USE_NEW_ION_HEAP := true
endif

# MultiROM
ifeq ($(RECOVERY_VARIANT),multirom)
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/samsung/a53g/multirom/mr_init_devices.c
MR_RD_ADDR := 0x82000000
MR_DPI := xhdpi
MR_DPI_FONT := 216
MR_FSTAB := device/samsung/a53g/recovery/twrp.fstab
MR_KEXEC_MEM_MIN := 0x85700000
MR_INFOS := device/samsung/a53g/mrom_infos
MR_NO_KEXEC := 4
endif

# Dex
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif