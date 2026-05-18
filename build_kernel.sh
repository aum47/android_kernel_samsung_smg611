#!/bin/bash
export ARCH=arm64
export CROSS_COMPILE=/home/aumpatel/toolchain/gcc-linaro-4.9/bin/aarch64-linux-gnu-
export ANDROID_MAJOR_VERSION=p

# Fix yylloc double definition (idempotent)
grep -q 'extern YYLTYPE yylloc' scripts/dtc/dtc-lexer.l || \
    sed -i 's/YYLTYPE yylloc/extern YYLTYPE yylloc/' scripts/dtc/dtc-lexer.l
flex -o scripts/dtc/dtc-lexer.lex.c scripts/dtc/dtc-lexer.l

make exynos7870-on7xreflte_defconfig
make -j64 2>&1 | tee build.log
