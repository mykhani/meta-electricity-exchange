**Debian based APT package manager**

The APT package manager has been enabled for package management which allows
using the existing debian package repositories compatible with armhf
architecture. The current yocto build is compatible with debian jessie version.

More apt repositories compatible with debian jessie version can be added by
modifying file /etc/apt/sources.list.d/debian.list.

**Enabling secure APT**
To make sure the package being installed is authentic, apt uses gpg tool to
sign package archives with the private key of repository and check their
signatures when they are being downloaded for installation.

The packages are signed with the private key of repository and apt needs
to know the public key of the repository to verify the signature.

In order to use secure apt, make sure to install the public key of the
debian repository following below steps:

```bash
root@elecex-zgateway-mx6:~# gpg --keyserver pgpkeys.mit.edu --recv-key  8B48AD6246925553
root@elecex-zgateway-mx6:~# gpg -a --export 8B48AD6246925553 | apt-key add -
```
After entering above commands, run below command
```bash
root@elecex-zgateway-mx6:~# apt-get update
```
To see the list of available packages, enter:
```bash
root@elecex-zgateway-mx6:~# apt-cache search .
```
To install a specific available package:
```bash
root@elecex-zgateway-mx6:~# apt-get install <package-name>
```
