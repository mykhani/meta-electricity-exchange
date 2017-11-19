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


**Establish the Internet Connectivity**

To establish the internet connectivity over the LTE we need following files/scripts that will instruct the LTE module on how to setup and disconnect the internet connectivity.

Create the file "/etc/ppp/peers/quectel-chat-disconnect" with the following contents.

    # /etc/ppp/peers/quectel-chat-disconnect
    ABORT "ERROR"
    ABORT "NO DIALTONE"
    SAY "\nSending break to the modem\n"
    ""  +++
    ""  +++
    ""  +++
    SAY "\nGoodbay\n"

Create the file "/etc/ppp/peers/quectel-chat-connect" with the following contents, and change the APN as per provided by the network operator.

    # /etc/ppp/peers/quectel-chat-connect
    ABORT "BUSY"
    ABORT "NO CARRIER"
    ABORT "NO DIALTONE"
    ABORT "ERROR"
    ABORT "NO ANSWER"
    TIMEOUT 30
    "" AT
    OK ATE0
    OK ATI;+CSUB;+CSQ;+CPIN?;+COPS?;+CGREG?;&D2
    # Insert the APN provided by your network operator
    OK AT+CGDCONT=1,"IP","hs.vodafone.ie",,0,0
    OK ATD*99#
    CONNECT

Create the file "/etc/ppp/peers/quectel-ppp" with the following contents, and change the user and password as per provided by the network operator.

    # /etc/ppp/peers/quectel-pppd
    # Usage:root>pppd call quectel-pppd
    #Modem path, like /dev/ttyUSB3,/dev/ttyACM0, depend on your module
    /dev/ttyUSB3 115200
    #Insert the username and password for authentication
    user "" password ""
    # The chat script, customize your APN in this file
    connect 'chat -s -v -f /etc/ppp/peers/quectel-chat-connect'
    # The close script
    disconnect 'chat -s -v -f /etc/ppp/peers/quectel-chat-disconnect'
    # Hide password in debug messages
    hide-password
    # The phone is not required to authenticate
    noauth
    # Debug info from pppd
    debug
    # If you want to use the HSDPA link as your gateway
    defaultroute
    # pppd must not propose any IP address to the peer
    noipdefault
    # No ppp compression
    novj
    novjccomp
    noccp
    ipcp-accept-local
    ipcp-accept-remote
    local
    # For sanity, keep a lock on the serial line
    lock
    modem
    dump
    nodetach
    # Hardware flow control
    nocrtscts
    remotename 3gppp
    ipparam 3gppp
    ipcp-max-failure 30
    # Ask the peer for up to 2 DNS server addresses
    usepeerdns

Now execute the following command to establish the internet connectivity over LTE.

    # pppd call quectel-ppp &

Check the network interfaces, we should find a ppp0 interface if the communication with the LTE module and service provider completed successfully.

    # ifconfig

Check the DNS server settings, we should find the DNS server IP(s) that are provided by the service provider through LTE module.

    # cat /etc/resolv.conf

Check the default route, we should find the route/gateway set for ppp0 interface.

    # route

Now ping google.com or any other online server/device.

    # ping google.com

