#!/bin/bash
export ARCH=arm64
export CROSS_COMPILE=/home/aumpatel/toolchain/gcc-linaro-4.9/bin/aarch64-linux-gnu-
export ANDROID_MAJOR_VERSION=p

make exynos7870-on7xreflte_defconfig
make -j64 2>&1 | tee build.log
