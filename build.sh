#!/bin/sh

rm -f /home/technoander/android_kernel_motorola_msm8610/speedmax-e/boot/zImage-dtb
rm -f /home/technoander/android_kernel_motorola_msm8610/speedmax-e/system/lib/modules/*.ko
rm -f /home/technoander/android_kernel_motorola_msm8610/speedmax-e/system/lib/modules/pronto/pronto_wlan.ko
rm -f /home/technoander/android_kernel_motorola_msm8610/arch/arm/boot/zImage-dtb

mv /home/technoander/android_kernel_motorola_msm8610/arch/arm/boot/zImage-dtb /home/technoander/android_kernel_motorola_msm8610/speedmax-e/boot

# get modules into one place
find -name "*.ko" -exec cp {} /home/technoander/android_kernel_motorola_msm8610/speedmax-e/system/lib/modules \;
sleep 2

# Remove Unneeded
/home/technoander/uber-4.8/bin/arm-eabi-strip --strip-unneeded /home/technoander/android_kernel_motorola_msm8610/speedmax-e/system/lib/modules/*.ko

# move to proper place
mv /home/technoander/android_kernel_motorola_msm8610/speedmax-e/system/lib/modules/wlan.ko /home/technoander/android_kernel_motorola_msm8610/speedmax-e/system/lib/modules/pronto/pronto_wlan.ko

cd /home/technoander/android_kernel_motorola_msm8610/speedmax-e
zip -r /home/technoander/release/speedmax-e-.zip *