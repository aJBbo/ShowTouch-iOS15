ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
TARGET = iphone:16.2:15.0
else
TARGET = iphone:14.5:12.0
endif

ARCHS = arm64e arm64
FINALPACKAGE=1
DEBUG=0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ShowTouch
ShowTouch_FILES = Tweak.xm
ShowTouch_LIBRARIES = colorpicker
ShowTouch_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += showtouch
include $(THEOS_MAKE_PATH)/aggregate.mk
