#!/bin/bash
## http://www.uchiembedded.co.in/jtag_debugging_for_esp32_en.pdf

firmware=$1
[[ "${firmware}" == "" ]] && firmware="blink.bin"
echo 'Firmware: '"${firmware}" 

# openocd_path=openocd-esp32-linux64-0.10.0-esp32-20180920
openocd_path=openocd-esp32-latest
cmd=${openocd_path}/bin/openocd
cfg=myopenocd_bb.cfg

# program_esp32 <image_file> <offset> [verify] [reset] [exit]
#parameters="-c 'program_esp32 ${firmware} 0x10000 verify exit'"  

echo $cmd -s "${openocd_path}/share/openocd/scripts" -f "$cfg" ${parameters}
$cmd -s "${openocd_path}/share/openocd/scripts" -f "$cfg" ${parameters} &

pid=$!  # NOT $$
trap 'kill -9 $pid; exit' INT TERM EXIT
echo "Running .. OpenOCD's pid: $pid"

# Explanation:
# -n defines the required character count to stop reading
# -s hides the user's input
# -r causes the string to be interpreted "raw" (without considering backslash escapes)
read -n 1 -s -r -p "Press any key to stop ... "
echo
