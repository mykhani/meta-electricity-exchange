**GPIO state**

The current state of the system's GPIOs can be obtained in user-mode, as shown in the following example:

    root@elecex-zgateway-mx6:~# cat /sys/kernel/debug/gpio
    GPIOs 0-31, platform/209c000.gpio, 209c000.gpio:
     gpio-10  (sysfs               ) out lo
     gpio-11  (sysfs               ) out lo
     gpio-15  (sysfs               ) out lo
     gpio-25  (phy-reset           ) out lo
    
    GPIOs 32-63, platform/20a0000.gpio, 20a0000.gpio:
    
    GPIOs 64-95, platform/20a4000.gpio, 20a4000.gpio:
    
    GPIOs 96-127, platform/20a8000.gpio, 20a8000.gpio:
     gpio-101 (tlv320aic3x reset   ) out lo
     gpio-120 (spi_imx             ) in  hi
    
    GPIOs 128-159, platform/20ac000.gpio, 20ac000.gpio:
    
    GPIOs 160-191, platform/20b0000.gpio, 20b0000.gpio:
     gpio-178 (sysfs               ) out lo
    
    GPIOs 192-223, platform/20b4000.gpio, 20b4000.gpio:
     gpio-200 (wlan-en-regulator   ) out lo

Each GPIO is defined as in or out and the state is shown as lo or hi.
 
**Manipulating a single GPIO via /sys/class/gpio**

**Using a command line or a script**

GPIOs in i.MX are grouped in groups of 32 pins.
For example, GPIO1_3 belong to the first group, pin 3. Its absolute number will be 3.
GPIO7_4 will be (7-1)*32+4=196.
Assuming this GPIO is defined in your device tree, the following is an example of how to use it from userspace.

To export the GPIO for userspace use:

    # echo 196 > /sys/class/gpio/export

To configure as output:

    # echo out > /sys/class/gpio/gpio196/direction

Set GPIO high:

    # echo 1 > /sys/class/gpio/gpio196/value

Set GPIO low:

    # echo 0 > /sys/class/gpio/gpio196/value

To configure as input:

    # echo in > /sys/class/gpio/gpio196/direction

Read the current value:

    # cat /sys/class/gpio/gpio196/value

To free the GPIO after you're done using it:

    # echo 196 > /sys/class/gpio/unexport


----------

**Manage GPIO from a C application**

All of the command line operations above can be translated to C code:
Reserve (export) the GPIO:

    #define IMX_GPIO_NR(port, index)    ((((port)-1)*32)+((index)&31))
    
    int fd;
    char buf[MAX_BUF]; 
    int gpio = IMX_GPIO_NR(7, 4); /* Just an example */
    
    fd = open("/sys/class/gpio/export", O_WRONLY);
    
    sprintf(buf, "%d", gpio); 
    
    write(fd, buf, strlen(buf));
    
    close(fd);
    Set the GPIO direction:
    sprintf(buf, "/sys/class/gpio/gpio%d/direction", gpio);
    
    fd = open(buf, O_WRONLY);
    
    /* Set out direction */
    write(fd, "out", 3); 
    /* Set in direction */
    write(fd, "in", 2); 
    
    close(fd);
    In case of out direction set the GPIO value:
    sprintf(buf, "/sys/class/gpio/gpio%d/value", gpio);
    
    fd = open(buf, O_WRONLY);
    
    /* Set GPIO high status */
    write(fd, "1", 1); 
    /* Set GPIO low status */
    write(fd, "0", 1); 
    
    close(fd);
    In case of in direction get the current GPIO value:
    char value;
    
    sprintf(buf, "/sys/class/gpio/gpio%d/value", gpio);
    
    fd = open(buf, O_RDONLY);
    
    read(fd, &value, 1);
    
    if (value == '0') { 
         /* Current GPIO status low */
    } else {
         /* Current GPIO status high */
    }
    
    close(fd);
    Once finished, free (unexport) the GPIO:
    fd = open("/sys/class/gpio/unexport", O_WRONLY);
    
    sprintf(buf, "%d", gpio);
    
    write(fd, buf, strlen(buf));
    
    close(fd);

Important notes:
Remember that after the first read operation the file pointer will move to the next position in the file, so to get a correct value for each read operation you simply have to set the file pointer at the beginning of the file before read by using the following command:
lseek(fd, 0, SEEK_SET);
This is only a short example. If you want to use it in your code remember add error handling to it.
