**To check if the APT package manager is working**

The APT package manager has been enabled for package management which allows
using the existing debian package repositories compatible with armhf
architecture.

Using the package repository requires manually adding the path of the 
package repositories into a file at /etc/apt/sources.list.d/ with .list
extension.

For example, the repositories for debian stretch version can be added by
creating a file /etc/apt/sources.list.d/debian.list with below contents:

```bash
root@elecex-zgateway-mx6:~# cat /etc/apt/sources.list.d/debian.list
deb  http://deb.debian.org/debian stretch main contrib non-free
deb-src  http://deb.debian.org/debian stretch main contrib non-free

deb  http://deb.debian.org/debian stretch-updates main contrib non-free
deb-src  http://deb.debian.org/debian stretch-updates main contrib non-free

deb http://security.debian.org/ stretch/updates main contrib non-free
deb-src http://security.debian.org/ stretch/updates main contrib non-free
```
After creating the above file, run below command
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
