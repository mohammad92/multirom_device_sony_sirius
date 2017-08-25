##==================================
##  RECOVERY_VARIANT := multirom
TARGET_RECOVERY_IS_MULTIROM := true

# Still needed by MultiROM Boot Menu
MR_PIXEL_FORMAT := "RGBX_8888"
MR_USE_QCOM_OVERLAY := true
MR_QCOM_OVERLAY_HEADER := device/sony/sirius/multirom/overlay/mr_qcom_overlay.h
MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888

# Custom Flags
MR_NO_KEXEC := true
MR_DEVICE_SPECIFIC_VERSION := c
TW_THEME := portrait_hdpi

include device/sony/sirius/multirom/version-info/MR_REC_VERSION.mk

ifeq ($(MR_REC_VERSION),)
MR_REC_VERSION := $(shell date -u +%Y%m%d)-01
endif

BOARD_MKBOOTIMG_ARGS += --board mrom$(MR_REC_VERSION)

# MultiROM config
MR_CUSTOM_INPUT_PATH := device/sony/sirius/multirom/mr_input.c
MR_INIT_DEVICES := device/sony/sirius/multirom/mr_init_devices.c
MR_DPI := xhdpi
MR_DPI_FONT := 340
MR_DEFAULT_BRIGHTNESS := 200

MR_DEVICE_HOOKS := device/sony/sirius/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 3

MR_FSTAB := device/sony/sirius/multirom/mrom.fstab
MR_USE_MROM_FSTAB := true

# not just yet :(
MR_DEVICE_VARIANTS := z2
MR_KEXEC_MEM_MIN := 0x0ff00000
#MR_KEXEC_DTB := true
