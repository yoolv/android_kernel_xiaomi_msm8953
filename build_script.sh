#!/bin/bash

export ARCH=arm64
export SUBARCH=arm64
export HEADER_ARCH=arm64
export PATH="${HOME}/Documents/Kernel/proton-clang-master/bin:${PATH}"
export STRIP="${HOME}/Documents/Kernel/proton-clang-master/bin/strip"

if [[ -d "out" ]]
then
cd out && make clean && make distclean && make mrproper && cd ..
else
    mkdir -p out
    fi

    make O=out ARCH=arm64 tissot_defconfig

make -j$(nproc --all) O=out \
		ARCH=arm64 \
		AR=llvm-ar \
		NM=llvm-nm \
		OBJCOPY=llvm-objcopy \
		OBJDUMP=llvm-objdump \
		STRIP=llvm-strip \
		CC=clang \
		CROSS_COMPILE=aarch64-linux-gnu- \
		CROSS_COMPILE_ARM32=arm-linux-gnueabi- \
                       

