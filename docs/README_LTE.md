The LTE device we have is connected on the USB port and its has two control pins using which we can turn it On or Off.

**To turn on/off the LTE**

Export the GPIO pins

    # echo 15 > /sys/class/gpio/export
    # echo out > /sys/class/gpio/gpio15/direction
    # echo 11 > /sys/class/gpio/export
    # echo out > /sys/class/gpio/gpio11/direction

To turn the LTE on

    # echo 1 > /sys/class/gpio/gpio15/value

To turn the LTE RF module on

    # echo 1 > /sys/class/gpio/gpio11/value

Load the kernel module if not already loaded. 

    # modprobe option

Similarly to turn off the LTE

    # echo 0 > /sys/class/gpio/gpio15/value

Or to turn off just the LTE RF module

    # echo 0 > /sys/class/gpio/gpio11/value


**Send commands to LTE and receive data from LTE**

To send command to the LTE

    # echo "ati;+csub" > /dev/ttyUSB2

To receive data from LTE

    # cat /dev/ttyUSB2
    ati;+csub
        
    Quectel
    EC20
    Revision: EC20EQAR02A11E2G
       
    SubEdition: V06
       
    OK

