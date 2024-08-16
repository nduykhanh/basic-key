ARCHS = arm64 
DEBUG = 0
FINALPACKAGE = 1
# THEOS = /home/ubuntu/theos

include $(THEOS)/makefiles/common.mk
TARGET = iphone:clang:latest:10.0

FRAMEWORK_NAME = BasicKey

$(FRAMEWORK_NAME)_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText
$(FRAMEWORK_NAME)_LDFLAGS+= API/libBasicKey.a
$(FRAMEWORK_NAME)_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG

$(FRAMEWORK_NAME)_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/framework.mk

after-install::
	install.exec "killall -9 kgvn || :"
	mkdir -p $(THEOS_STAGING_DIR)/Frameworks/$(FRAMEWORK_NAME).framework

	# Sao chép Info.plist vào thư mục .framework
	cp Info.plist $(THEOS_STAGING_DIR)/Frameworks/$(FRAMEWORK_NAME).framework

	# Sao chép các tệp Headers vào thư mục .framework/Headers
	mkdir -p $(THEOS_STAGING_DIR)/Frameworks/$(FRAMEWORK_NAME).framework/Headers
	cp -R Headers/. $(THEOS_STAGING_DIR)/Frameworks/$(FRAMEWORK_NAME).framework/Headers

	# Sao chép tệp module.modulemap vào thư mục .framework/Modules
	mkdir -p $(THEOS_STAGING_DIR)/Frameworks/$(FRAMEWORK_NAME).framework/Modules
	cp Modules/module.modulemap $(THEOS_STAGING_DIR)/Frameworks/$(FRAMEWORK_NAME).framework/Modules
	
clean::
	rm -rf ./packages/*
