NAME := itls

DEBUG := no

GLOBAL_INCLUDES     += ../include

$(NAME)_DEFINES     += CONFIG_PLAT_AOS

ifneq ($(HOST_ARCH), ck802)
$(NAME)_DEFINES     += CONFIG_KEY_OTP_ENABLED
endif

ifeq ($(HOST_ARCH), linux)
HOST_NAME := $(HOST_ARCH)
else
HOST_NAME := $(shell echo $(CONFIG_SYSINFO_DEVICE_NAME)|tr A-Z a-z)
endif

ifeq ($(DEBUG), no)
$(NAME)_PREBUILT_LIBRARY := lib/$(HOST_NAME)/libitls.a
else
GLOBAL_DEFINES           += CONFIG_SSL_DEBUG
$(NAME)_PREBUILT_LIBRARY := lib/$(HOST_NAME)/libitls.a.dbg
endif

$(NAME)_COMPONENTS  := alicrypto
$(NAME)_COMPONENTS  += id2
$(NAME)_COMPONENTS  += irot

$(NAME)_SOURCES     := src/mbedtls_net.c
$(NAME)_SOURCES     += src/mbedtls_alt.c
$(NAME)_SOURCES     += src/mbedtls_auth.c
