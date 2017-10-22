To verify the support of nodejs and npm package manager, build either fsl-image-gui or fsl-image-qt and deploy the respective image to the device.

Then develop the following test javascript file with name helloworld.js.

root@elecex-zgateway-mx6:~# echo 'console.log("HelloWorld!")' > helloworld.js

Run the above created javascript file using node runtime.

root@elecex-zgateway-mx6:~# node helloworld.js
HelloWorld!

To verify npm package manager, install the following test package.
root@elecex-zgateway-mx6:~# npm install -g jshint
