#!/bin/sh

# Enable keyboard backlight on resume
# Disable red LED.

# Put in /usr/lib/systemd/system-sleep/ so systemd runs this after resume
if [ "${1}" = "post" ]; then
  light -s sysfs/leds/tpacpi::kbd_backlight -S 100
fi
