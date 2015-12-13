# asm
Bare metal assembler on the Raspberry Pi

These examples are designed to be run without a pre-exsisting Linux kernel/OS. They directly access/store memory and are unsafe to be run in a typical OS environment. You will require a machine with the ARM toolchain to compile these examples.

Nothing within this repository is useful for anything other than research/education purposes.

Based on [Baking Pi – Operating Systems Development](https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/)

**How to compile examples:**

You will require the [GCC ARM Embedded toolchain](https://launchpad.net/gcc-arm-embedded)

```shell
$ make
```

For reference, the manual commands are:

```shell
$ arm-none-eabi-as -o main.o ./source/main.s
$ arm-none-eabi-ld -o output.elf -T kernel.ld main.o
$ arm-none-eabi-objcopy output.elf -O binary kernel.img
```

**How to install/run examples:**

* Download [Debian Jessie](https://downloads.raspberrypi.org/raspbian_lite_latest)
* Install onto Raspberry Pi SD Card [ApplePi-Baker](http://www.tweaking4all.com/hardware/raspberry-pi/macosx-apple-pi-baker/)
* Delete kernel.img from Raspberry Pi SD Card
* Move newly built kernel.img to Raspberry Pi SD
* Power up Raspberry Pi
