include build/make/target/product/aosp_arm64.mk
$(call inherit-product, device/phh/treble/base.mk)

# Use Scudo instead of Jemalloc
# PRODUCT_USE_SCUDO := true

$(call inherit-product, vendor/aosp/config/common_full_phone.mk)
$(call inherit-product, vendor/aosp/config/BoardConfigSoong.mk)
#$(call inherit-product, device/custom/sepolicy/common/sepolicy.mk)
-include vendor/aosp/build/core/config.mk

TARGET_BOOT_ANIMATION_RES := 1080
TARGET_NO_KERNEL_OVERRIDE := true
TARGET_NO_KERNEL_IMAGE := true
TARGET_GAPPS_ARCH := arm64
BUILD_BROKEN_DUP_RULES := true
PRODUCT_NAME := aosp_arm64_bgN
PRODUCT_DEVICE := arm64_bgN
PRODUCT_BRAND := google
PRODUCT_SYSTEM_BRAND := google
PRODUCT_MODEL := Phh-Treble GSI

# Disable "emulator" characteristics
PRODUCT_CHARACTERISTICS := device

# Project-Elixir
PRODUCT_PACKAGES += OverlaySettings
IS_PHONE := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_SUPPORTS_GOOGLE_RECORDER := false
TARGET_INCLUDE_STOCK_ACORE := false
TARGET_INCLUDE_LIVE_WALLPAPERS := false
TARGET_FACE_UNLOCK_SUPPORTED := true
ELIXIR_BUILD_TYPE := OFFICIAL
TARGET_BUILD_APERTURE_CAMERA := true
FORCE_LAWNCHAIR := true

# Certain devices need scudo
PRODUCT_USE_SCUDO := true

# Prebuilt Sepolicy
TARGET_USES_PREBUILT_VENDOR_SEPOLICY := true

# Share blocks
BOARD_EXT4_SHARE_DUP_BLOCKS := true

# GMS
ifeq ($(WITH_GMS),true)
GMS_MAKEFILE=gms_minimal.mk
endif
