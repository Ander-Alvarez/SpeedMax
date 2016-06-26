#!/bin/sh

rm -f /home/anderson/SpeedMaxl/speedmax-e/boot/zImage-dtb
rm -f /home/anderson/SpeedMaxl/speedmax-e/system/lib/modules/*.ko
rm -f /home/anderson/SpeedMaxl/speedmax-e/system/lib/modules/pronto/pronto_wlan.ko
rm -f /home/anderson/SpeedMaxl/arch/arm/boot/zImage-dtb

mv /home/anderson/SpeedMaxl/arch/arm/boot/zImage-dtb /home/anderson/SpeedMaxl/speedmax-e/boot

# get modules into one place
find -name "*.ko" -exec cp {} /home/anderson/SpeedMaxl/speedmax-e/system/lib/modules \;
sleep 2

# Remove Unneeded
/home/anderson/uber-4.8/bin/arm-eabi-strip --strip-unneeded /home/anderson/SpeedMaxl/speedmax-e/system/lib/modules/*.ko

# move to proper place
mv /home/anderson/SpeedMaxl/speedmax-e/system/lib/modules/wlan.ko /home/anderson/SpeedMaxl/speedmax-e/system/lib/modules/pronto/pronto_wlan.ko

cd /home/anderson/SpeedMaxl/speedmax-e
zip -r /home/anderson/release/speedmax-e-.zip *
