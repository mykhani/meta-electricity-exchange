**Using TFTP and u-boot**

Assuming that tftp server on the host/build machine and tftp client on device are correctly setup.

Copy the required files from build directory to tftp shared directory.

    $ cp <build directory>/tmp/deploy/images/elecex-zgateway-mx6/uImage <tftp shared directory>
    $ cp <build directory>/tmp/deploy/images/elecex-zgateway-mx6/uImage-imx6q-elecex-zgateway.dtb <tftp shared directory>
    $ cp <build directory>/tmp/deploy/images/elecex-zgateway-mx6/fsl-image-gui-elecex-zgateway-mx6.ubi <tftp shared directory>


Reboot the device and run the following commands on the u-boot prompt.

    > mw.b 0x18100000 0xff 0x800000
    > tftp 0x18100000 uImage
    > nand erase.part kernel
    > nand write 0x18100000 kernel 0x800000
    
    > mw.b 0x18100000 0xff 0x20000
    > tftp 0x18100000 uImage-imx6q-elecex-zgateway.dtb
    > nand erase 0x3e0000 0x20000
    > nand write 0x18100000 0x3e0000 0x20000
    
    > tftp 0x18100000 fsl-image-gui-elecex-zgateway-mx6.ubi
    > nand erase.part rootfs
    > nand write.trimffs 0x18100000 rootfs $filesize
    
    > reset
