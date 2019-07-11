# An Example for ESP32 Debugging via OpenOCD


## Build __OpenOCD__ from Source

* Prepare:

```bash
sudo apt-get install build-essential automake autoconf texinfo cmake libtool pkg-config libusb-dev libusb-1.0.0-dev libftdi-dev
```

* Call __build.sh__ to build __openocd-esp32_espressif__ from scratch.


## Quick Start

* Plug the BusBlaster adapter as the first usb device, and
* Run __openocd.sh__ as gdbserver, then
* Use __debug_esp32.sh__ as command-line debugger version, or
* Use the debugging function in Vscode (please extract __blink_lolin32_debugging.tar.gz__ and open the folder).


## Quick Fix

Use __fix\_openocd-esp32\_espressif\_compile-error.patch__ for solving compilation error 
  in openocd-esp32\_espressif submodule.
Just call __patch.sh__.
Currently, it is called along with __build.sh__.


## References

* https://darkdust.net/files/GDB%20Cheat%20Sheet.pdf
