Managing wifi using connman
---------------------------

ConnMan is a command-line network manager designed for use with embedded devices and fast resolve times. It is modular through a plugin architecture, but has native dhcp and ntp support. 

**Enabling and disabling wifi**

To check if wifi is enabled you can run 

    # connmanctl technologies

and check for the line that says Powered: True/False. 

To power the wifi on you can run 

    # connmanctl enable wifi

or if you need to disable it you can run 

    # connmanctl disable wifi

**Connecting to an open access point**

The commands in this section show how to run connmanctl in command mode. 
To scan the network connmanctl accepts simple names called technologies. To scan for nearby wifi networks: 

    # connmanctl scan wifi

To list the available networks found after a scan run (example output): 

    # connmanctl services

    CGW_WLAN             wifi_209148bffca0_4347575f574c414e_managed_psk
    Electricity Exchange wifi_209148bffca0_456c6563747269636974792045786368616e6765_managed_psk

Every wifi network is identified by a name composed as 
wifi_<hashlocal>_<hashremote>_managed_<encrption>
To connect to an open network, look for wifi networks ending with _managed_none: 

    # connmanctl connect <wifi_xxx_xxx>_managed_none

Network names can be tab-completed
You should now be connected to the network. Check using ip addr or run 

    # connmanctl state.

**Connecting to a protected access point**

For protected access points you will need to provide some information to the ConnMan daemon, at the very least a password or a passphrase. 
The commands in this section show how to run connmanctl in interactive mode, it is required for running the agent command. To start interactive mode simply type: 

    # connmanctl

You then proceed almost as above, first scan for any wifi technologies: 

    # connmanctl> scan wifi

To list services: 

    # connmanctl> services

    CGW_WLAN             wifi_209148bffca0_4347575f574c414e_managed_psk
    ElectricityExchangeEircom wifi_209148bffca0_456c65637472696369747945786368616e6765456972636f6d_managed_psk
    Electricity Exchange wifi_209148bffca0_456c6563747269636974792045786368616e6765_managed_psk

Now you need to register the agent to handle user requests. The command is: 

    # connmanctl> agent on

You now need to connect to one of the protected services. 
To do this easily, just use tab completion for the wifi_ service. 
If you were connecting to CGW_WLAN in the example above you would type: 

    # connmanctl> connect wifi_209148bffca0_4347575f574c414e_managed_psk

The agent will then ask you to provide any information the daemon needs to complete the connection. 
The information requested will vary depending on the type of network you are connecting to. 
The agent will also print additional data about the information it needs as shown in the example below.

    Agent RequestInput wifi_209148bffca0_4347575f574c414e_managed_psk
      Passphrase = [ Type=psk, Requirement=mandatory, Alternates=[ WPS ] ]
      WPS = [ Type=wpspin, Requirement=alternate ]
    Passphrase?

Provide the information requested, in this example the passphrase, and then type: 

    # connmanctl> quit

If the information you provided is correct you should now be connected to the protected access point. 
