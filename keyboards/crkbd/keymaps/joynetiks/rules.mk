#OLED_DRIVER_ENABLE = yes
RGBLIGHT_ENABLE=yes
SLEEP_LED_ENABLE=yes
# If you want to change the display of OLED, you need to change here
SRC +=  ./lib/glcdfont.c \
        ./lib/rgb_state_reader.c \
        ./lib/layer_state_reader.c \
        ./lib/logo_reader.c \
        ./lib/keylogger.c \
				# ./drivers/oled/oled_driver.c \
        # ./lib/mode_icon_reader.c \
        # ./lib/host_led_state_reader.c \
        # ./lib/timelogger.c \

MH_OLED_IMAGE=image.c
this_dir=keyboards/crkbd/keymaps/joynetiks
images=$(this_dir)/mh_images
originals=$(images)/originals
converted=$(images)/converted

$(converted)/%.c: $(originals)/%.*
	$(this_dir)/mh_image_to_oled $< > $@

CFLAGS += -flto
SRC += $(converted)/$(MH_OLED_IMAGE)
