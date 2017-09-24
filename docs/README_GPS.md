The GPS device we have communicates over the UART port and its has one control pin using which we can turn it On or Off.

**To turn on/off the GPS**

Export the GPIO pin

    # echo 10 > /sys/class/gpio/export
    # echo out > /sys/class/gpio/gpio10/direction

To turn the GPS on

    # echo 1 > /sys/class/gpio/gpio10/value

Similarly to turn off the GPS

    # echo 0 > /sys/class/gpio/gpio10/value

**To Receive data from GPS and send commands to GPS**

Set the baud rate of UART port

    # stty -F /dev/ttymxc2 9600 cs8 -cstopb -parenb -crtscts

To receive data from the GPS

    # cat /dev/ttymxc2

To send commands to GPS

    # echo <command> > /dev/ttymxc2

