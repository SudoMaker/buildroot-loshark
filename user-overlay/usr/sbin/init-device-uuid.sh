#!/bin/sh

UUID_FILE_PATH="/etc/device_uuid"

if [ ! -e "$UUID_FILE_PATH" ]; then
	mount / -wo remount
	printf '%04x%04x%04x' $RANDOM $RANDOM $RANDOM > "$UUID_FILE_PATH"
	mount / -ro remount
	sync
fi

exit 0
