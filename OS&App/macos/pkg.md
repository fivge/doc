# pkg

## 1.Term

### (1) 显示包列表

```bash
pkgutil --pkgs
```

### (2)列出所关联的文件

```bash
pkgutil --files com.Hackintosh.voodoohda287.Voodoo.pkg
```

## 2.UninstallPKG(要钱的)

[UninstallPKG][2]

# 3.pkg_uninstaller(貌似没用)

[pkg_uninstaller][1]

```bash
## Installation

Installation is as simple as:

    [sudo] bash < <(curl -sL https://raw.github.com/mpapis/pkg_uninstaller/master/pkg-install)

Adding to PATH, for system installation (with sudo):

    echo 'PATH=$PATH:/opt/pkg_uninstaller' >> /etc/profile
    
Adding PATH when installed as user (without sudo):

    echo 'PATH=$PATH:$HOME/.pkg_uninstaller' >> $HOME/.bash_profile

Note the single quotes are important in both cases.

## Installing package file

Install packages with:

    pkg-install <package_file.pkg>

This will create `uninstall_<package_file_pkg>.sh` in current directory.

To uninstall this package just execute `./uninstall_<package_file_pkg>.sh`.

## Uninstalling single packages by name.

List available package names (possibly filtering by [name]):

    pkg-list [name]

Uninstall package:

    pkg-uninstall <name>

## Using internally in package to build uninstaller

- You have to bundle `pkg-wrapper` with your application 
and install it to disk before executing the hook bellow.

- In before installing hook call this script:
```

```
#!/bin/bash

pkg-wrapper before "your package name"
```

- In after installing hook call this script:

```
#!/bin/bash

pkg-wrapper before "your package name" /path/to/uninstaller_name.sh
```

- In uninstall hook call:

```
#!/bin/bash

/path/to/uninstaller_name.sh
rm /path/to/uninstaller_name.sh
```

[1]: https://github.com/mpapis/pkg_uninstaller
[2]: http://www.corecode.at/uninstallpkg/
