#!/usr/bin/env bash

# Install
pip3 install telegram-send
pip3 install --force-reinstall -v "python-telegram-bot==20.1"
# End

BASE_DIR="/root/project"

# Helper function for cloning: gsc = git shallow clone
gsc() {
	git clone --depth=1 -q $@
}

Clone Neutron Clang
echo "Downloading Neutron Clang"
mkdir "$BASE_DIR"/clang1
TC1_DIR="$BASE_DIR"/clang1
cd $TC1_DIR
bash <(curl -s https://raw.githubusercontent.com/Neutron-Toolchains/antman/main/antman) -S=latest
echo "$(pwd)"
cd ../..

# Clone Neutron Clang
echo "Downloading LyN-clang"
mkdir "$BASE_DIR"/clang2
TC2_DIR="$BASE_DIR"/clang2
git clone https://gitlab.com/lynnnnzx/clang-lyn.git $TC2_DIR
cd $TC2_DIR
echo "$(pwd)"
cd ../..

# Clone Kernel Source
BRANCH="R0.1"
echo "Downloading Electron_$BRANCH Kernel Source"
mkdir $BASE_DIR/Kernel
KERNEL_SRC="$BASE_DIR"/Kernel
OUTPUT="$KERNEL_SRC"/out
gsc https://github.com/KazuDante89/android_kernel_xiaomi_sm8350.git -b Proton_$BRANCH $KERNEL_SRC
echo "Cloning Kernel Source Completed"

echo "Cloning AnyKernel3"
mkdir "$BASE_DIR"/AnyKernel3
AK3_DIR="$BASE_DIR"/AnyKernel3
gsc https://github.com/ghostrider-reborn/AnyKernel3.git -b lisa $AK3_DIR
echo "AnyKernel3 Completed"

# Exports
export  BASE_DIR TC1_DIR TC2_DIR KERNEL_SRC OUTPUT AK3_DIR BNAME BREV BRANCH TELEGRAM

# Copy script over to source
cd $KERNEL_SRC
bash .circleci/build.sh
