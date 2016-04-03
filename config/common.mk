PRODUCT_BRAND ?= Broken

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    ro.layers.noIcon=noIcon

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/broken/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/broken/prebuilt/common/bin/50-broken.sh:system/addon.d/50-broken.sh \
    vendor/broken/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/broken/prebuilt/common/etc/backup.conf:system/etc/backup.conf
    
# Layers Backup
PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/bin/71-layers.sh:system/addon.d/71-layers.sh

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/bin/otasigcheck.sh:system/bin/otasigcheck.sh

# Broken-specific init file
PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/etc/init.local.rc:root/init.broken.rc

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/etc/SuperSU.zip:system/addon.d/SuperSU.zip \
    vendor/broken/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/broken/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

# Added xbin files
PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/xbin/zip:system/xbin/zip \
    vendor/broken/prebuilt/common/xbin/zipalign:system/xbin/zipalign

# Layers Theme
PRODUCT_COPY_FILES += \
    vendor/broken/config/permissions/com.layers.theme.xml:system/etc/permissions/com.layers.theme.xml \
    vendor/broken/prebuilt/common/app/Layers.apk:system/app/Layers/Layers.apk

# Workaround for NovaLauncher zipalign fails
PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/app/NovaLauncher.apk:system/app/NovaLauncher/NovaLauncher.apk

# Amaze File Manager
PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/app/Amaze.apk:system/app/Amaze/Amaze.apk

# KernelAdiutor
PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/app/KernelAdiutor.apk:system/app/KernelAdiutor/KernelAdiutor.apk
    
# Viper
PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/app/Viper4Android.apk:system/app/Viper4Android/Viper4Android.apk
    
# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

#Init.d Support
PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/broken/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/broken/prebuilt/common/etc/init.d/00check:system/etc/init.d/00check \
    vendor/broken/prebuilt/common/etc/init.d/01zipalign:system/etc/init.d/01zipalign \
    vendor/broken/prebuilt/common/etc/init.d/02sysctl:system/etc/init.d/02sysctl \
    vendor/broken/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/broken/prebuilt/common/etc/init.d/05freemem:system/etc/init.d/05freemem \
    vendor/broken/prebuilt/common/etc/init.d/06removecache:system/etc/init.d/06removecache \
    vendor/broken/prebuilt/common/etc/init.d/07fixperms:system/etc/init.d/07fixperms \
    vendor/broken/prebuilt/common/etc/init.d/09cron:system/etc/init.d/09cron \
    vendor/broken/prebuilt/common/etc/init.d/10sdboost:system/etc/init.d/10sdboost \
    vendor/broken/prebuilt/common/etc/init.d/11battery:system/etc/init.d/11battery \
    vendor/broken/prebuilt/common/etc/init.d/12touch:system/etc/init.d/12touch \
    vendor/broken/prebuilt/common/etc/init.d/13minfree:system/etc/init.d/13minfree \
    vendor/broken/prebuilt/common/etc/init.d/14gpurender:system/etc/init.d/14gpurender \
    vendor/broken/prebuilt/common/etc/init.d/15sleepers:system/etc/init.d/15sleepers \
    vendor/broken/prebuilt/common/etc/init.d/16journalism:system/etc/init.d/16journalism \
    vendor/broken/prebuilt/common/etc/init.d/17sqlite3:system/etc/init.d/17sqlite3 \
    vendor/broken/prebuilt/common/etc/init.d/18wifisleep:system/etc/init.d/18wifisleep \
    vendor/broken/prebuilt/common/etc/init.d/19iostats:system/etc/init.d/19iostats \
    vendor/broken/prebuilt/common/etc/init.d/20setrenice:system/etc/init.d/20setrenice \
    vendor/broken/prebuilt/common/etc/init.d/21tweaks:system/etc/init.d/21tweaks \
    vendor/broken/prebuilt/common/etc/init.d/98tweaks:system/etc/init.d/98tweaks \
    vendor/broken/prebuilt/common/etc/helpers.sh:system/etc/helpers.sh \
    vendor/broken/prebuilt/common/etc/init.d.cfg:system/etc/init.d.cfg \
    vendor/broken/prebuilt/common/bin/sysinit:system/bin/sysinit

# stock ui sounds
PRODUCT_COPY_FILES += \
    vendor/broken/proprietary/common/system/media/audio/ui/audio_end.ogg:system/media/audio/ui/audio_end.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/audio_initiate.ogg:system/media/audio/ui/audio_initiate.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/camera_click.ogg:system/media/audio/ui/camera_click.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/camera_focus.ogg:system/media/audio/ui/camera_focus.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/Dock.ogg:system/media/audio/ui/Dock.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/Effect_Tick.ogg:system/media/audio/ui/Effect_Tick.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/KeypressDelete.ogg:system/media/audio/ui/KeypressDelete.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/KeypressInvalid.ogg:system/media/audio/ui/KeypressInvalid.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/KeypressReturn.ogg:system/media/audio/ui/KeypressReturn.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/KeypressSpacebar.ogg:system/media/audio/ui/KeypressSpacebar.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/KeypressStandard.ogg:system/media/audio/ui/KeypressStandard.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/Lock.ogg:system/media/audio/ui/Lock.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/LowBattery.ogg:system/media/audio/ui/LowBattery.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/NFCFailure.ogg:system/media/audio/ui/NFCFailure.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/NFCInitiated.ogg:system/media/audio/ui/NFCInitiated.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/NFCSuccess.ogg:system/media/audio/ui/NFCSuccess.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/NFCTransferComplete.ogg:system/media/audio/ui/NFCTransferComplete.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/NFCTransferInitiated.ogg:system/media/audio/ui/NFCTransferInitiated.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/Trusted.ogg:system/media/audio/ui/Trusted.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/Undock.ogg:system/media/audio/ui/Undock.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/Unlock.ogg:system/media/audio/ui/Unlock.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/VideoRecord.ogg:system/media/audio/ui/VideoRecord.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/VideoStop.ogg:system/media/audio/ui/VideoStop.ogg \
    vendor/broken/proprietary/common/system/media/audio/ui/WirelessChargingStarted.ogg:system/media/audio/ui/WirelessChargingStarted.ogg

# Alarms
PRODUCT_COPY_FILES += \
    vendor/broken/proprietary/common/system/media/audio/alarms/Argon.ogg:system/media/audio/alarms/Argon.ogg \
    vendor/broken/proprietary/common/system/media/audio/alarms/Carbon.ogg:system/media/audio/alarms/Carbon.ogg \
    vendor/broken/proprietary/common/system/media/audio/alarms/Helium.ogg:system/media/audio/alarms/Helium.ogg \
    vendor/broken/proprietary/common/system/media/audio/alarms/Krypton.ogg:system/media/audio/alarms/Krypton.ogg \
    vendor/broken/proprietary/common/system/media/audio/alarms/Neon.ogg:system/media/audio/alarms/Neon.ogg \
    vendor/broken/proprietary/common/system/media/audio/alarms/Osmium.ogg:system/media/audio/alarms/Osmium.ogg \
    vendor/broken/proprietary/common/system/media/audio/alarms/Oxygen.ogg:system/media/audio/alarms/Oxygen.ogg \
    vendor/broken/proprietary/common/system/media/audio/alarms/Platinum.ogg:system/media/audio/alarms/Platinum.ogg \
    vendor/broken/proprietary/common/system/media/audio/alarms/Timer.ogg:system/media/audio/alarms/Timer.ogg

# Ringtones
PRODUCT_COPY_FILES += \
    vendor/broken/proprietary/common/system/media/audio/ringtones/Atria.ogg:system/media/audio/ringtones/Atria.ogg \
    vendor/broken/proprietary/common/system/media/audio/ringtones/Callisto.ogg:system/media/audio/ringtones/Callisto.ogg \
    vendor/broken/proprietary/common/system/media/audio/ringtones/Dione.ogg:system/media/audio/ringtones/Dione.ogg \
    vendor/broken/proprietary/common/system/media/audio/ringtones/Ganymede.ogg:system/media/audio/ringtones/Ganymede.ogg \
    vendor/broken/proprietary/common/system/media/audio/ringtones/ImBroken.ogg:system/media/audio/ringtones/ImBroken.ogg \
    vendor/broken/proprietary/common/system/media/audio/ringtones/Luna.ogg:system/media/audio/ringtones/Luna.ogg \
    vendor/broken/proprietary/common/system/media/audio/ringtones/Oberon.ogg:system/media/audio/ringtones/Oberon.ogg \
    vendor/broken/proprietary/common/system/media/audio/ringtones/Phobos.ogg:system/media/audio/ringtones/Phobos.ogg \
    vendor/broken/proprietary/common/system/media/audio/ringtones/Pyxis.ogg:system/media/audio/ringtones/Pyxis.ogg \
    vendor/broken/proprietary/common/system/media/audio/ringtones/Sedna.ogg:system/media/audio/ringtones/Sedna.ogg \
    vendor/broken/proprietary/common/system/media/audio/ringtones/Titania.ogg:system/media/audio/ringtones/Titania.ogg \
    vendor/broken/proprietary/common/system/media/audio/ringtones/Triton.ogg:system/media/audio/ringtones/Triton.ogg \
    vendor/broken/proprietary/common/system/media/audio/ringtones/Umbriel.ogg:system/media/audio/ringtones/Umbriel.ogg

# Notifications
PRODUCT_COPY_FILES += \
    vendor/broken/proprietary/common/system/media/audio/notifications/Ariel.ogg:system/media/audio/notifications/Ariel.ogg \
    vendor/broken/proprietary/common/system/media/audio/notifications/Carme.ogg:system/media/audio/notifications/Carme.ogg \
    vendor/broken/proprietary/common/system/media/audio/notifications/Ceres.ogg:system/media/audio/notifications/Ceres.ogg \
    vendor/broken/proprietary/common/system/media/audio/notifications/Elara.ogg:system/media/audio/notifications/Elara.ogg \
    vendor/broken/proprietary/common/system/media/audio/notifications/Europa.ogg:system/media/audio/notifications/Europa.ogg \
    vendor/broken/proprietary/common/system/media/audio/notifications/Iapetus.ogg:system/media/audio/notifications/Iapetus.ogg \
    vendor/broken/proprietary/common/system/media/audio/notifications/Io.ogg:system/media/audio/notifications/Io.ogg \
    vendor/broken/proprietary/common/system/media/audio/notifications/Rhea.ogg:system/media/audio/notifications/Rhea.ogg \
    vendor/broken/proprietary/common/system/media/audio/notifications/Salacia.ogg:system/media/audio/notifications/Salacia.ogg \
    vendor/broken/proprietary/common/system/media/audio/notifications/Tethys.ogg:system/media/audio/notifications/Tethys.ogg \
    vendor/broken/proprietary/common/system/media/audio/notifications/Titan.ogg:system/media/audio/notifications/Titan.ogg

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Development \
    SpareParts \
    LatinIME

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    LiveWallpapersPicker \
    PhaseBeam \
    SlimLauncher

# DSPManager
PRODUCT_PACKAGES += \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf

# Extra Optional packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    DashClock \
    LockClock \
    WallpaperPicker \
    BrokenOTA \
    BrokenWalls \
    BrokenCenter \
    Browser

# AudioFX
#PRODUCT_PACKAGES += \
#    AudioFX
    
#Screen recorder
#PRODUCT_PACKAGES += \
#    ScreenRecorder \
#    libscreenrecorder
    
# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs 
#    ntfsfix \
#    ntfs-3g

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# easy way to extend to add more packages
-include vendor/extra/product.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/broken/overlay/common

# Boot animation include
ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))

# determine the smaller dimension
TARGET_BOOTANIMATION_SIZE := $(shell \
  if [ $(TARGET_SCREEN_WIDTH) -lt $(TARGET_SCREEN_HEIGHT) ]; then \
    echo $(TARGET_SCREEN_WIDTH); \
  else \
    echo $(TARGET_SCREEN_HEIGHT); \
  fi )

# get a sorted list of the sizes
bootanimation_sizes := $(subst .zip,, $(shell ls vendor/broken/prebuilt/common/bootanimation))
bootanimation_sizes := $(shell echo -e $(subst $(space),'\n',$(bootanimation_sizes)) | sort -rn)

# find the appropriate size and set
define check_and_set_bootanimation
$(eval TARGET_BOOTANIMATION_NAME := $(shell \
  if [ -z "$(TARGET_BOOTANIMATION_NAME)" ]; then
    if [ $(1) -le $(TARGET_BOOTANIMATION_SIZE) ]; then \
      echo $(1); \
      exit 0; \
    fi;
  fi;
  echo $(TARGET_BOOTANIMATION_NAME); ))
endef
$(foreach size,$(bootanimation_sizes), $(call check_and_set_bootanimation,$(size)))

PRODUCT_COPY_FILES += \
    vendor/broken/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
endif

# BrokenOs freeze code
ifeq ($(OFFICIAL),true)
BUILD_TYPE = OFFICIAL
else
BUILD_TYPE = UNOFFICIAL
endif
BROKEN_VERSION_MAJOR = 6.0.1
BROKEN_VERSION_MINOR = build
BROKEN_POSTFIX := -$(shell date +"%Y%m%d")
PRODUCT_VERSION_MAINTENANCE = v4.4

ifeq ($(BUILD_TYPE),NINJA)
    PLATFORM_VERSION_CODENAME := NINJA
endif
ifeq ($(BUILD_TYPE),OFFICIAL)
    PLATFORM_VERSION_CODENAME := OFFICIAL
endif
ifeq ($(BUILD_TYPE),MILESTONE)
    PLATFORM_VERSION_CODENAME := MILESTONE
endif 
ifeq ($(BUILD_TYPE),UNOFFICIAL)
    PLATFORM_VERSION_CODENAME := UNOFFICIAL
endif 

ifdef BROKEN_BUILD_EXTRA
    BROKEN_POSTFIX := -$(BROKEN_BUILD_EXTRA)
endif

# Set all versions
BROKEN_VERSION := Broken-$(PRODUCT_VERSION_MAINTENANCE)-$(BROKEN_BUILD)-$(BROKEN_VERSION_MAJOR)-$(PLATFORM_VERSION_CODENAME)$(BROKEN_POSTFIX)
BROKEN_MOD_VERSION := Broken-$(PRODUCT_VERSION_MAINTENANCE)

# by default, do not update the recovery with system updates
PRODUCT_PROPERTY_OVERRIDES += persist.sys.recovery_update=false

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    broken.ota.version=$(PRODUCT_VERSION_MAINTENANCE) \
    ro.broken.version=$(BROKEN_VERSION) \
    ro.mod.version=$(BROKEN_MOD_VERSION) \
    ro.broken.type=$(PLATFORM_VERSION_CODENAME)

#EXTENDED_POST_PROCESS_PROPS := vendor/broken/tools/broken_process_props.py
