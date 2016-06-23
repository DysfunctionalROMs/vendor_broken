# Inherit common stuff
$(call inherit-product, vendor/broken/config/common.mk)

# World APN list
PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Selective SPN list for operator number who has the problem.
PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    messaging \
    Stk

