INSTALLED_DTBOIMAGE_TARGET := $(PRODUCT_OUT)/dtbo.img
$(INSTALLED_DTBOIMAGE_TARGET): $(BOARD_PREBUILT_DTBOIMAGE)
	@echo "Install dtbo.img"
	$(copy-file-to-target)

INSTALLED_DTBIMAGE_TARGET := $(PRODUCT_OUT)/dtb.img
$(INSTALLED_DTBIMAGE_TARGET): device/xiaomi/serenity/prebuilt/dtb.img
	@echo "Install dtb.img"
	$(copy-file-to-target)
