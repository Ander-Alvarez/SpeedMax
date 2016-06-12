#!/bin/sh

rm -f /home/technoander/android_kernel_motorola_msm8610/arch/arm/mach-msm/smd_rpc_sym.c
make clean && make mrproper
rm -f /home/technoander/android_kernel_motorola_msm8610/speedmax-e/boot/zImage-dtb
rm -f /home/technoander/android_kernel_motorola_msm8610/speedmax-e/system/lib/modules/*.ko
rm -f /home/technoander/android_kernel_motorola_msm8610/speedmax-e/system/lib/modules/pronto/pronto_wlan.ko

