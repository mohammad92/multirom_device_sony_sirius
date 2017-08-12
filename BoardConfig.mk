# Bootloader
# Make it equal to ro.product.board from your build.prop
TARGET_BOOTLOADER_BOARD_NAME := D6503
TARGET_NO_BOOTLOADER := true

# Platform
# BOARD_PLATFORM is usually the processor for MTK devices, and chipset for MSM ones.
TARGET_BOARD_PLATFORM := msm8974
#TARGET_BOARD_PLATFORM_GPU :=

# Architecture

# all this info can be grabbed right off the build.prop
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait

# Kernel

# You can get these by unpacking your stock recovery.img through osm0sis's AIK tool. Go on, have a Google ;)
BOARD_KERNEL_CMDLINE := androidboot.hardware=sirius
BOARD_KERNEL_CMDLINE += user_debug=31 androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += dwc3.maximum_speed=high dwc3_msm.prop_chg_detect=Y
BOARD_KERNEL_CMDLINE += coherent_pool=8M
BOARD_KERNEL_CMDLINE += console=ttyHSL0,115200,n8
BOARD_KERNEL_CMDLINE += vmalloc=300M
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048

BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

BOARD_KERNEL_IMAGE_NAME := zImage-dtb

KERNEL_TOOLCHAIN        := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-

# If you want to use a kernel source, uncomment the next two lines
# TARGET_KERNEL_CONFIG := aosp_shinano_sirius_defconfig
# TARGET_KERNEL_SOURCE := kernel/sony/msm
TARGET_PREBUILT_KERNEL := device/sony/sirius/kernel
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
#BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00000000 --ramdisk_offset 0x00000000 --dt device/vendor/codename/dt.img --tags_offset 0x00000000
BOARD_KERNEL_SEPARATED_DT :=

# Partition info
TARGET_USERIMAGES_USE_EXT4 := true

# This is usually not needed for standalone devices. If you are creating a unified tree for
# multiple variants, you may want to read up about Vendor init.
TARGET_PLATFORM_DEVICE_BASE :=
# Sizes to be put in in bytes. cant stress this enough.
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2671771648
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12656242688
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

TARGET_TAP_TO_WAKE_NODE := "/sys/devices/virtual/input/max1187x/wakeup_gesture"

# Assert
TARGET_OTA_ASSERT_DEVICE := D6502,D6503,D6506,D6543,sirius

# TWRP
include device/sony/sirius/twrp.mk

# multirom
include device/sony/sirius/multirom/multirom.mk
