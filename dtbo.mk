INSTALLED_DTBOIMAGE_TARGET := $(PRODUCT_OUT)/dtbo.img
$(INSTALLED_DTBOIMAGE_TARGET): $(BOARD_PREBUILT_DTBOIMAGE)
	@echo "Install dtbo.img"
	$(copy-file-to-target)
