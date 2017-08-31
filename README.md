# meta-electricity-exchange
Yocto layer for Electricity Exchange Products

# Replacing bits on SD card
1. Copy over the bits built using yocto using scp to the running target connected over internet. Use the below command
scp -P <ssh-port> -i <path-to-ssh-key> <path-to-file-to-copy> cgw1@bsp.electricityexchange.ie:

2. ssh the target and move the bits to required location. Place kernel image and devicetree to boot partition on SD card
based rootfs.

# Booting the target (using resistive touch on LVDS display)
1. Interrupt the default u-boot boot. Enter below commands

ext2load mmc 1:1 ${loadaddr} boot/uImage-var-som-mx6.bin
ext2load mmc 1:1 ${fdt_addr} boot/uImage-imx6q-var-som-res.dtb
run bootargs_emmc;bootm ${loadaddr} - ${fdt_addr}


# GPS testing
1. Export GPIO1[10] pin (GPIO pin number 42). It is used to drive nReset signal.
2. Set it to output.
3. Set it's value to 1 to de-assert reset condition.
4. Launch minicom on /dev/ttymxc2 from an ssh shell to target.
5. Set serial settings to 96008N1.
6. You should see some strings on minicom.

# LTE modem testing
1. Check output of lsusb to see if LTE modem is detected.

2. Load option module if it is not automatically loaded. This will create 4 /dev/ttyUSBn nodes.
root@var-som-mx6:~# modprobe option

3. Launch minicom with device ttyUSB2 used for AT interface
root@var-som-mx6:~# minicom -D /dev/ttyUSB2

Welcome to minicom 2.7

OPTIONS: I18n
Compiled on May 24 2017, 17:32:45.
Port /dev/ttyUSB2, 08:35:12

Press CTRL-A Z for help on special keys

4. Disable flow control and use 1152008N1 settings. 

5. Enter the below AT command to check LTE modem revision.
ati;+csub
Quectel
EC20
Revision: EC20EQAR02A11E2G

SubEdition: V06

OK
