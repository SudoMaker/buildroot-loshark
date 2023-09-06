#!/bin/bash

[ "${FLOCKER}" != "$0" ] && exec env FLOCKER="$0" flock -en "$0" "$0" "$@" || :

if [ -z "output/images/rootfs.tar" ]; then
	echo "Please run this script in the root directory of buildroot."
	exit 2
fi

OUTPUT_IMAGE="output/images/rootfs.jfs.img"

if [ -e "$OUTPUT_IMAGE" ]; then
	echo "$OUTPUT_IMAGE already exists, please remove it manually."
	exit 2
fi

fallocate -l 50331648 "$OUTPUT_IMAGE" || exit 2

echo y|mkfs.jfs "$OUTPUT_IMAGE" || exit 2

TMPDIR=`mktemp -d`

mount "$OUTPUT_IMAGE" "$TMPDIR" || exit 2

tar -C "$TMPDIR" -xvf "output/images/rootfs.tar" || exit 2

df -h "$TMPDIR"

umount "$TMPDIR" || exit 2

rmdir "$TMPDIR" || exit 2

echo Generated "$OUTPUT_IMAGE".

exit 0