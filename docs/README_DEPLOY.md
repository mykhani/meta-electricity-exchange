## Deploy the GUI image without the QT support

GUI image without the QT support can be completely flashed into the NAND flash. So following steps can be used to deploy the boot loader, Linux kernel and file system to NAND flash.

**TFTP setup**

Assuming that tftp server on the host/build machine and tftp client on device are correctly setup.

Copy the required files from build directory to tftp shared directory.


    $ cp <build directory>/tmp/deploy/images/elecex-zgateway-mx6/u-boot.img-nand <tftp shared directory>
    $ cp <build directory>/tmp/deploy/images/elecex-zgateway-mx6/uImage <tftp shared directory>
    $ cp <build directory>/tmp/deploy/images/elecex-zgateway-mx6/uImage-imx6q-elecex-zgateway.dtb <tftp shared directory>
    $ cp <build directory>/tmp/deploy/images/elecex-zgateway-mx6/fsl-image-gui-elecex-zgateway-mx6.ubi <tftp shared directory>


**u-boot console**

Reboot the device and run the following commands on the u-boot prompt to flash the boot loader, kernel, device tree blob and root file system to NAND flash.

    > mw.b 0x18100000 0xff 0x1e0000
    > tftp 0x18100000 u-boot.img-nand
    > nand erase 0x200000 0x1e0000
    > nand write 0x18100000 0x200000 0x1e0000
	
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
    
    > setenv rootfs_device nand
    > saveenv
    
    > reset


## Deploy the GUI image with the QT support

GUI image with the QT support cannot be completely flashed into the NAND flash as the size of the image is larger than the size of NAND flash. So we flash the boot loader and kernel to NAND flash whereas we flash the file system to EMMC. Following steps can be used to deploy the boot loader, Linux kernel and file system to NAND flash and EMMC

**TFTP and NFS setup**

Assuming that TFTP server on the host/build machine and TFTP client on device are correctly setup.

Copy the required files from build directory to TFTP shared directory.


    $ cp <build directory>/tmp/deploy/images/elecex-zgateway-mx6/u-boot.img-nand <tftp shared directory>
    $ cp <build directory>/tmp/deploy/images/elecex-zgateway-mx6/uImage <tftp shared directory>
    $ cp <build directory>/tmp/deploy/images/elecex-zgateway-mx6/uImage-imx6q-elecex-zgateway.dtb <tftp shared directory>

Copy the required files from build directory to NFS shared directory.

    $ cp <build directory>/tmp/deploy/images/elecex-zgateway-mx6/fsl-image-qt5-elecex-zgateway-mx6.tar.bz2 <nfs shared directory>

**u-boot console**

Reboot the device and run the following commands on the u-boot prompt to flash the boot loader, kernel and device tree blob to NAND flash.

    > mw.b 0x18100000 0xff 0x1e0000
    > tftp 0x18100000 u-boot.img-nand
    > nand erase 0x200000 0x1e0000
    > nand write 0x18100000 0x200000 0x1e0000
	
    > mw.b 0x18100000 0xff 0x800000
    > tftp 0x18100000 uImage
    > nand erase.part kernel
    > nand write 0x18100000 kernel 0x800000
    
    > mw.b 0x18100000 0xff 0x20000
    > tftp 0x18100000 uImage-imx6q-elecex-zgateway.dtb
    > nand erase 0x3e0000 0x20000
    > nand write 0x18100000 0x3e0000 0x20000
    
    > reset

After the reboot interrupt the boot again to run the following commands on u-boot prompt to load the root file system from NAND flash for once and from EMMC for the rest.

    > setenv rootfs_device emmc
    > saveenv
    > setenv rootfs_device nand
    > boot

**Linux console**

   On the Linux console run the following commands to flash the file system to EMMC.
    
    # mkdir -p /nfs
    # mount -t nfs <nfs server IP>:<nfs shared directory path> /nfs/
    
    # export node=/dev/mmcblk0
    # cd /nfs
    
    # umount ${node}p*
    # dd if=/dev/zero of=${node}p1 bs=1024 count=1024
    # sync
    
    # (echo d; echo 1; echo d; echo w) | fdisk ${node}
    # sync
    
    # dd if=/dev/zero of=${node} bs=1M count=4
    # sync
    
    # (echo n; echo p; echo 1; echo; echo; echo p; echo w) | fdisk -u ${node}
    # sync
    
    # mkfs.ext4 ${node}p1 -L rootfs
    
    # mkdir -p /run/media/mmcblk0p1
    # mount ${node}p1 /run/media/mmcblk0p1
    
    # tar xpf fsl-image-qt5-elecex-zgateway-mx6.tar.bz2 -C /run/media/mmcblk0p1 -m
    
    # sync
    # umount /run/media/mmcblk0p1
	
    # reboot

