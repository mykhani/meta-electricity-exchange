To verify the support of QT, build the image with QT contents included.

    $ bitbake fsl-image-qt5

After deploying the image to the device run the following commands to launch the qt demo application.

    # export QT_QPA_PLATFORM=eglfs
    # cd /usr/share/qt5everywheredemo-1.0
    # ./QtDemo

To find more information and detail about QT framework and how to develop the applications based on QT, consult the QT documentation.

http://doc.qt.io/qt-5/embedded-linux.html
