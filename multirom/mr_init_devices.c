#include <stdlib.h>

// These are paths to folders in /sys which contain "uevent" file
// need to init this device.
// MultiROM needs to init framebuffer, mmc blocks, input devices,
// some ADB-related stuff and USB drives, if OTG is supported
// You can use * at the end to init this folder and all its subfolders
const char *mr_init_devices[] =
{
    "/sys/class/graphics/fb0",
    "/sys/class/misc/android_adb",
    "/sys/class/android_usb/android0/f_adb",
    "/sys/class/tty/ptmx",
    "/sys/class/misc/uinput",

    // for keys and touchscreen
    "/sys/devices/gpio_keys.82*",
    "/sys/devices/virtual/misc/uinput",
    "/sys/devices/virtual/input*",
    "/sys/class/input/input*",
    "/sys/class/input/event*",

    // storage devices
    "/sys/dev/block*",
    "/sys/block/mmcblk0",
    "/sys/module/mmc_core",
    "/sys/module/mmcblk",

    "/sys/bus*",
    "/sys/devices*",

    NULL
};
