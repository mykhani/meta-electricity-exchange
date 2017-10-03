Yocto layer for Electricity Exchange Products

Install required packages
----------------------------

Please make sure your host PC is running Ubuntu 14.04/16.04 64-bit and install the following packages: 

    $ sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat libsdl1.2-dev
    $ sudo apt-get install autoconf libtool libglib2.0-dev libarchive-dev
    $ sudo apt-get install python-git xterm sed cvs subversion coreutils texi2html
    $ sudo apt-get install docbook-utils python-pysqlite2 help2man make gcc g++ desktop-file-utils libgl1-mesa-dev
    $ sudo apt-get install libglu1-mesa-dev mercurial automake groff curl lzop asciidoc u-boot-tools dos2unix mtd-utils
    $ sudo apt-get install pv
    $ sudo dpkg --add-architecture i386
    $ sudo apt-get update
    $ sudo apt-get install g++-multilib libssl-dev:i386 libcrypto++-dev:i386 zlib1g-dev:i386

Download Yocto Morty based on Freescale Community BSP
-----------------------------------------------------

    $ mkdir ~/bin (this step may not be needed if the bin folder already exists)
    $ curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
    $ chmod a+x ~/bin/repo
    $ export PATH=~/bin:$PATH


    $ git config --global user.email "you@example.com"
    $ git config --global user.name "Your Name"

    $ mkdir ~/elecex-yocto
    $ cd ~/elecex-yocto
    $ repo init -u https://github.com/aarshad/elecex_manifest.git -b morty
    $ repo sync -j8

Setup and build Yocto
---------------------

    $ export LANG=en_US.UTF-8
    $ cd ~/elecex-yocto
    $ MACHINE=elecex-zgateway-mx6 DISTRO=fslc-framebuffer . setup-environment build_elecex_fb

    Without Qt content:
    $ bitbake fsl-image-gui

    Or with Qt content:
    $ bitbake fsl-image-qt5
