# Inherit common stuff
$(call inherit-product, vendor/broken/config/common.mk)
$(call inherit-product, vendor/broken/config/broken_extras.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/broken/overlay/tablet

# BT config
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf
