#!/bin/sh

echo 255 > /sys/class/leds/red:indicator/brightness
echo 128 > /sys/class/leds/green:indicator/brightness

exit 0
