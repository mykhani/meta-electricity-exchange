To verify the support of usb touch screen, first identify the respective device node by executing the following command,

    dmesg | grep -i "usb touch"

The output will be something like,

    [    7.625979] input: eGalax Inc. USB TouchController as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2:1.0/input/input0

In this case the device node is /dev/input/event0 that corresponds to /devices/soc0/...input/input0. In other words the mapping is,

    /devices/soc0/...input/inputX -> /dev/input/eventX

Now to listen to the input events from the touch screen run the following command and then perform activity on the touch screen.

    evtest /dev/input/eventX

Note: In the above command replace the X with the corresponding number as identified in the previous step.
