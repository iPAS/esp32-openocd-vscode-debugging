#!/bin/bash
# sudo apt-get install build-essential automake autoconf texinfo cmake libtool pkg-config libusb-dev libusb-1.0.0-dev libftdi-dev

target=$(pwd)/openocd-esp32-latest
echo "Target: $target"
trash "${target}"
mkdir "${target}"

git submodule update --init --recursive
git submodule foreach --recursive git clean -xfd
git submodule foreach --recursive git reset --hard

./patch.sh  # FIXME: Quick-fix the openocd-esp32_espressif repo.

cd openocd-esp32_espressif

./bootstrap
options='--enable-buspirate --enable-ftdi --enable-stlink --enable-cmsis-dap --enable-jlink'
## --enable-legacy-ft2232_libftdi
## --enable-maintainer-mode --disable-werror
./configure ${options} --prefix="${target}"
make clean && make && make install
cd ..
