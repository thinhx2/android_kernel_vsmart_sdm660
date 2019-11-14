#!/bin/bash

echo "--------------------------------------------"
echo "Kernel Source For Nokia 6.1 Plus"
echo "Lets Compile kernel sit Back Have A coffee "
echo "--------------------------------------------"

sudo apt-get update 
echo -ne '\n' | sudo apt-get upgrade
echo -ne '\n' | sudo apt-get install git ccache schedtool lzop bison gperf build-essential zip curl zlib1g-dev g++-multilib python-networkx libxml2-utils bzip2 libbz2-dev libghc-bzlib-dev squashfs-tools pngcrush liblz4-tool optipng libc6-dev-i386 gcc-multilib libssl-dev gnupg flex lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev xsltproc unzip python-pip python-dev libffi-dev libxml2-dev libxslt1-dev libjpeg8-dev openjdk-8-jdk imagemagick device-tree-compiler repo mailutils-mh expect python3-requests python-requests
cd ..
mkdir kiwis-kernel
git clone https://github.com/RaghuVarma331/aarch64-linux-android-4.9.git -b master aarch64-linux-android-4.9
cd android_kernel_nokia_sdm660
rm -r output
export ARCH=arm64
export CROSS_COMPILE=/home/runner/work/android_kernel_nokia_sdm660/aarch64-linux-android-4.9/bin/aarch64-linux-android-
clear
mkdir output
make -C $(pwd) O=output SAT-perf_defconfig
make -j32 -C $(pwd) O=output
cp -r output/arch/arm64/boot/Image.gz-dtb /home/runner/work/android_kernel_nokia_sdm660/android_kernel_nokia_sdm660/DRG_sprout
cd DRG_sprout
zip -r Kiwis-kernel-10.0-DRG_sprout-$(date +"%Y%m%d").zip META-INF patch tools Image.gz-dtb anykernel.sh   
cp -r Kiwis-kernel-10.0-DRG_sprout-$(date +"%Y%m%d").zip /home/runner/work/android_kernel_nokia_sdm660/kiwis-kernel
cd 
cd /home/runner/work/android_kernel_nokia_sdm660/kiwis-kernel

echo "--------------------------------------------"
echo "All Right now flash at your own risk"
echo "Flashable Zip located in kiwis-kernel Folder"
echo "Good Bye ..!! @ RaghuVarma "
echo "--------------------------------------------"
