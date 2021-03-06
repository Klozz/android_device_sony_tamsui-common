TARGET_SPECIFIC_HEADER_PATH := device/sony/tamsui-common/include

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_HAS_NO_MISC_PARTITION := true

# Init
BOARD_WANTS_EMMC_BOOT := true

# Legacy
TARGET_QCOM_DISPLAY_VARIANT := legacy
TARGET_QCOM_AUDIO_VARIANT := legacy
TARGET_QCOM_MEDIA_VARIANT := legacy

# Platform
TARGET_BOOTLOADER_BOARD_NAME := tamsui
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_VARIANT := cortex-a5
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_ARCH_LOWMEM := true

ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

COMMON_GLOBAL_CFLAGS += -DSONY_CAMERA -DQCOM_HARDWARE -DQCOM_SONY_HARDWARE -DMR0_AUDIO_BLOB -DANCIENT_GL -DQCOM_BSP_WITH_GENLOCK -Wno-sign-compare -Wno-error -Wno-deprecated -Wno-parentheses -Wno-ignored-qualifiers
COMMON_GLOBAL_CFLAGS += -DEGL_NEEDS_FNW

# Kernel information
TARGET_KERNEL_SOURCE := kernel/sony/msm7x27a
# Remove the hash from below line when building for mesona
# TARGET_KERNEL_SOURCE := kernel/sony/mesona
BOARD_KERNEL_BASE := 0x00200000
BOARD_RECOVERY_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_FORCE_BOOT_ADDRESS := 0x00208000
BOARD_SONY_RAMDISK_ADDRESS := 0x01400000

# Graphics
USE_OPENGL_RENDERER := true
TARGET_USES_OVERLAY := false
TARGET_HAVE_BYPASS  := false
TARGET_USES_GENLOCK := true
TARGET_QCOM_HDMI_OUT := false
TARGET_USES_ION := true
TARGET_NO_HW_VSYNC := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_EGL_CFG := device/sony/tamsui-common/config/egl.cfg
BOARD_USE_MHEAP_SCREENSHOT := true
TARGET_DOESNT_USE_FENCE_SYNC := true
QCOM_BSP_WITH_GENLOCK := true

# libEGL: allow devices to workaround Google bug 10194508
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# Device specific hardware abstract layers 
TARGET_PROVIDES_LIBLIGHT := true

# Camera
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DQCOM_NO_SECURE_PLAYBACK -DQCOM_ICS_DECODERS
COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_COMPAT
BOARD_USES_QCOM_LEGACY_CAM_PARAMS := true
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
TARGET_DISABLE_ARM_PIE := true
BOARD_NEEDS_MEMORYHEAPPMEM := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true

# Add h/w acceleration in browser
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome

# GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27a
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
TARGET_NEEDS_BLUETOOTH_INIT_DELAY := true

# Vibrator
BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/sony/tamsui-common/vibrator/vibrator.c

# Custom boot
TARGET_RECOVERY_PRE_COMMAND := "touch /cache/recovery/boot; \#"
BOARD_CUSTOM_BOOTIMG_MK := device/sony/tamsui-common/custombootimg.mk
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/sony/tamsui-common/releasetools/semc_ota_from_target_files
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/sony/tamsui-common/recovery/recovery-keys.c

BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# RIL
BOARD_USES_LEGACY_RIL := true
BOARD_RIL_CLASS := ../../../device/sony/tamsui-common/ril/

# Web Rendering
TARGET_FORCE_CPU_UPLOAD := true
ENABLE_WEBGL := true

# Disable adb RSA security and enable adb root when debug
ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
ADDITIONAL_DEFAULT_PROPERTIES := ro.adb.secure=0	\
	ro.secure=0
endif
