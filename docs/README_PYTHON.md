To verify the support of python, build either fsl-image-gui or fsl-image-qt and deploy the respective image to the device.

Then develop the following test python script and run it on the device, the script can be named "test_python.py".

    #!/usr/bin/python
    
    print "Hello World!";

To run the script on the device run the following command.

    # python test_python.py
