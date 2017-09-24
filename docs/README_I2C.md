**Available I2C buses**

List I2C available devices:

    root@elecex-zgateway-mx6:~# ls -l /dev/i2c-*
    crw------- 1 root root 89, 0 Jan  1  1970 /dev/i2c-0
    crw------- 1 root root 89, 1 Jan  1  1970 /dev/i2c-1
    crw------- 1 root root 89, 2 Jan  1  1970 /dev/i2c-2

**I2C devices per bus**

Scan bus 0:

    root@elecex-zgateway-mx6:~# i2cdetect -y -r 0
         0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
    00:          -- -- -- -- -- -- -- -- -- -- -- -- --
    10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    70: -- -- -- -- -- -- -- --
                    

Scan bus 1:

    root@elecex-zgateway-mx6:~# i2cdetect -y -r 1
         0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
    00:          -- -- -- -- -- UU -- -- -- -- -- -- --
    10: -- -- -- -- -- -- -- -- -- -- -- UU -- -- -- --
    20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    50: UU -- -- -- -- -- 56 57 -- -- -- -- -- -- -- --
    60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    70: -- -- -- -- -- -- -- --

Scan bus 2:

    root@elecex-zgateway-mx6:~# i2cdetect -y -r 2
         0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
    00:          -- -- -- -- -- -- -- -- -- -- -- -- --
    10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    70: -- -- -- -- -- -- -- --               

**Reading / Writing from an I2C device**

BSP includes I2CTools as a part of the default file system build, examples of optional commands: 

i2cdump - dump the content of an I2C device 

i2cset - write a single character to an I2C device

i2cget - read a single character to an I2C device.

In addition follow 'C' code example as describe in the linux kernel documentation : https://www.kernel.org/doc/Documentation/i2c/dev-interface
