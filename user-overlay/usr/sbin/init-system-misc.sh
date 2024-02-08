#!/bin/sh

/sbin/init-device-uuid.sh

chrt -p 50 `pgrep spi0` -f

echo 8 > /sys/block/mmcblk0/queue/read_ahead_kb
echo 8 > /sys/block/ly68psram/queue/read_ahead_kb

sysctl -w vm.dirty_expire_centisecs=1000
sysctl -w vm.min_free_kbytes=32
sysctl -w vm.extfrag_threshold=250
sysctl -w vm.swappiness=80
sysctl -w vm.oom_kill_allocating_task=1

exit 0
