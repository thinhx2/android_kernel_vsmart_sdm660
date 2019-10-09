#!/bin/bash

echo "--------------------------------------------"
echo "Kernel Source For Nokia 6.1 Plus"
echo "Lets Compile kernel sit Back Have A coffee "
echo "--------------------------------------------"


cd
mkdir kiwis-kernel
git clone https://github.com/RaghuVarma331/aarch64-linux-android-4.9.git -b master aarch64-linux-android-4.9
cd Kernel
rm -r output
export ARCH=arm64
export CROSS_COMPILE=/root/aarch64-linux-android-4.9/bin/aarch64-linux-android-
clear
mkdir output
make -C $(pwd) O=output SAT-perf_defconfig
make -j32 -C $(pwd) O=output
cp -r output/arch/arm64/boot/Image.gz-dtb /root/Kernel/DRG_sprout
cd DRG_sprout
zip -r Kiwis-kernel-9.0-DRG_sprout-$(date +"%Y%m%d")-$(date +"%H%M").zip META-INF patch tools Image.gz-dtb anykernel.sh   
cp -r Kiwis-kernel-9.0-DRG_sprout-$(date +"%Y%m%d")-$(date +"%H%M").zip /root/kiwis-kernel
cd

echo "--------------------------------------------"
echo "All Right now flash at your own risk"
echo "Flashable Zip located in kiwis-kernel Folder"
echo "Good Bye ..!! @ RaghuVarma "
echo "--------------------------------------------"
