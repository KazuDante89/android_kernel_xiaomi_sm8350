# Makefile for the focaltech touchscreen drivers.

ifneq ($(KERNELRELEASE),)
    obj-m += focaltech_touch.o
focaltech_touch-y := \
    focaltech_core.o \
    focaltech_ex_fun.o \
    focaltech_ex_mode.o \
    focaltech_gesture.o \
    focaltech_esdcheck.o \
    focaltech_point_report_check.o \
    focaltech_test/focaltech_test.o \
    focaltech_test/focaltech_test_ini.o \
    focaltech_test/supported_ic/focaltech_test_ft5662.o \
    focaltech_flash.o \
    focaltech_spi.o
else
    KDIR = $(OUT)/obj/KERNEL_OBJ
    CROSS_COMPILE = $(ANDROID_TOOLCHAIN)/aarch64-linux-android-
    CLANG = $(TC_DIR)
    REAL_CC = $(TC_DIR)/bin/clang
    AR = $(TC_DIR)/bin/llvm-ar
    LLVM_NM = $(TC_DIR)/bin/llvm-nm
    LD = $(TC_DIR)/bin/ld.lld
.PHONY: clean
default:
    $(MAKE_PARAMS)
clean:
    @rm -rf *.order *.symvers* .tmp_versions
    @find -name "*.o*" -o -name "*.mod*" -o -name "*.ko*" | xargs rm -f
endif
