#!/bin/sh

rm -f /home/anderson/SpeedMax/speedmax-e/boot/zImage-dtb
rm -f /home/anderson/SpeedMax/speedmax-e/system/lib/modules/*.ko
rm -f /home/anderson/SpeedMax/speedmax-e/system/lib/modules/pronto/pronto_wlan.ko
rm -f /home/anderson/SpeedMax/arch/arm/boot/zImage-dtb

mv /home/anderson/SpeedMax/arch/arm/boot/zImage-dtb /home/anderson/SpeedMax/speedmax-e/boot

# get modules into one place
find -name "*.ko" -exec cp {} /home/anderson/SpeedMax/speedmax-e/system/lib/modules \;
sleep 2

# Remove Unneeded
/home/anderson/uber-4.8/bin/arm-eabi-strip --strip-unneeded /home/anderson/SpeedMax/speedmax-e/system/lib/modules/*.ko

# move to proper place
mv /home/anderson/SpeedMax/speedmax-e/system/lib/modules/wlan.ko /home/anderson/SpeedMax/speedmax-e/system/lib/modules/pronto/pronto_wlan.ko

cd /home/anderson/SpeedMax/speedmax-e
zip -r /home/anderson/release/speedmax-e-.zip *
