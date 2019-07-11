#!/bin/bash

## From https://gist.github.com/zeuxisoo/980174
# Create patch file:
#   > git diff --no-prefix > [path file name]
# Apply path file:
#   > patch -p0 < [path file name]
#
## Or
#
# Create patch:
#   > git diff > patch.diff
# Apply patch:
#   > patch -p1 < patch.diff

## Created with:
#   > git diff fix_buffer_compile_error~1 fix_buffer_compile_error > ../fix_openocd-esp32_espressif_compile-error.patch

cd openocd-esp32_espressif 
patch -p1 < ../fix_openocd-esp32_espressif_compile-error.patch
cd ..
