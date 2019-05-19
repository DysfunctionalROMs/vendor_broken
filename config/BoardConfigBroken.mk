# Charger
#ifneq ($(WITH_SLIM_CHARGER),false)
#    BOARD_HAL_STATIC_LIBRARIES := libhealthd.broken
#endif

include vendor/broken/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/broken/config/BoardConfigQcom.mk
endif

include vendor/broken/config/BoardConfigSoong.mk

