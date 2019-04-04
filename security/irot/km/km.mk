NAME := libkm

$(NAME)_COMPONENTS := irot.km.platform alicrypto

ifeq ($(HOST_ARCH), linux)
HOST_NAME := $(HOST_ARCH)
else
HOST_NAME := $(shell echo $(CONFIG_SYSINFO_DEVICE_NAME)|tr A-Z a-z)
endif

$(NAME)_PREBUILT_LIBRARY := lib/$(HOST_NAME)/libkm.a
