modprobe zram
zramctl /dev/zram0 --algorithm zstd --size 14G
mkswap -U clear /dev/zram0
swapon --priority 100 /dev/zram0
