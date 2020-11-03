OLED_DRIVER_ENABLE = yes
RGBLIGHT_ENABLE=yes
SLEEP_LED_ENABLE=yes

SSD1306OLED=no
MH_OLED_IMAGE=image.c
this_dir=keyboards/crkbd/keymaps/joynetiks
images=$(this_dir)/mh_images
originals=$(images)/originals
converted=$(images)/converted

$(converted)/%.c: $(originals)/%.*
	$(this_dir)/mh_image_to_oled $< > $@

CFLAGS += -flto
SRC += $(converted)/$(MH_OLED_IMAGE)
