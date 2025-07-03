include $(GDK)/makefile.gen

PROJECT_NAME = hello_world

# Override the default target to copy the ROM file
rom_copy: release
	@if [ -f out/rom.bin ]; then \
		cp out/rom.bin $(PROJECT_NAME).bin; \
		echo "ROM built successfully: $(PROJECT_NAME).bin"; \
	fi

.PHONY: rom_copy