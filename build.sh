#!/bin/bash

cd openocd-esp32_espressif
target=/home/ipas/Development/OpenOCD/openocd-esp32-latest
trash "${target}"
mkdir "${target}"

options='--enable-buspirate --enable-ftdi --enable-ft2232_libftdi --enable-usb_blaster_libftdi'
## --enable-maintainer-mode --disable-werror

git submodule update
./configure ${options} --prefix="${target}"
make clean && make && make install
cd ..
