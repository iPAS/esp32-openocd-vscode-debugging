#!/bin/bash
## http://www.uchiembedded.co.in/jtag_debugging_for_esp32_en.pdf

firmware=$1
[[ "${firmware}" == "" ]] && firmware="blink.elf"
echo 'Firmware: '"${firmware}" 

cmd='/home/ipas/Workspace/Arduino/hardware/espressif/esp32/tools/xtensa-esp32-elf/bin/xtensa-esp32-elf-gdb'
$cmd  \
    -ex 'target remote localhost:3333'  \
    -ex 'monitor reset init'  \
    -ex 'set remotelogfile gdb_log.txt'  \
    "${firmware}"
