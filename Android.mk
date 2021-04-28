LOCAL_PATH := $(call my-dir)

ifneq ($(filter r5q r5que beyond0qlte beyond1qlte beyond2qlte d1q d2q,$(TARGET_DEVICE)),)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
