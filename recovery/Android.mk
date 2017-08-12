LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS 	:= eng
LOCAL_MODULE 		:= twrp.fstab
LOCAL_MODULE_CLASS 	:= ETC
LOCAL_SRC_FILES         := root/etc/twrp.fstab
LOCAL_MODULE_PATH       := $(TARGET_RECOVERY_ROOT_OUT)/etc
LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_PREBUILT)


#workaround for cp blobs when make recoveryimage
recovery-full: twrp.fstab recoveryimage
	echo "done!"
