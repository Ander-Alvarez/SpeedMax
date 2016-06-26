#!/bin/sh

rm -f /home/technoander/SpeedMaxl/speedmax-e/boot/zImage-dtb
rm -f /home/technoander/SpeedMaxl/speedmax-e/system/lib/modules/*.ko
rm -f /home/technoander/SpeedMaxl/speedmax-e/system/lib/modules/pronto/pronto_wlan.ko
rm -f /home/technoander/SpeedMaxl/arch/arm/boot/zImage-dtb

mv /home/technoander/SpeedMaxl/arch/arm/boot/zImage-dtb /home/technoander/SpeedMaxl/speedmax-e/boot

# get modules into one place
find -name "*.ko" -exec cp {} /home/technoander/SpeedMaxl/speedmax-e/system/lib/modules \;
sleep 2

# Remove Unneeded
/home/technoander/uber-4.8/bin/arm-eabi-strip --strip-unneeded /home/technoander/SpeedMaxl/speedmax-e/system/lib/modules/*.ko

# move to proper place
mv /home/technoander/SpeedMaxl/speedmax-e/system/lib/modules/wlan.ko /home/technoander/SpeedMaxl/speedmax-e/system/lib/modules/pronto/pronto_wlan.ko

cd /home/technoander/SpeedMaxl/speedmax-e
zip -r /home/technoander/release/speedmax-e-.zip *
