To test the Ethernet interface use the ifconfig command to get the details of the network interfaces. Then use the iperf3 tool to transmit and receive the data over the ethernet.

    # ifconfig
    eth0      Link encap:Ethernet  HWaddr f8:dc:7a:0d:d5:27
              inet addr:192.168.0.12  Bcast:192.168.0.255  Mask:255.255.255.0
              inet6 addr: fe80::fadc:7aff:fe0d:d527/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:548815 errors:0 dropped:0 overruns:0 frame:0
              TX packets:358361 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000
              RX bytes:328176041 (312.9 MiB)  TX bytes:51058166 (48.6 MiB)

**iperf3 server (on Target/Host):**

Run the iperf server on either Target/Host and then run the client on the other side.
    
    # iperf3 -s

**iperf3 client (on Host/Target):**

For TCP/IP test

    $ iperf3 -c <IP_ADDRESS_OF_IPERF_SERVER> -u -b 400M

For UDP test

    $ iperf3 -c <IP_ADDRESS_OF_IPERF_SERVER> -u -b 400M
