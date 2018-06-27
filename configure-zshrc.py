#!/usr/bin/env python3

import os
import sh

home = os.environ['HOME']

zshrc = os.path.join(home, '.zshrc')
if os.path.exists(zshrc) and os.path.isfile(zshrc):
    sh.cp(zshrc, zshrc+".bak")

zf = open(zshrc, 'a')

# some personal alias
sh.echo("\n\nalias c=clear", _out=zf)
sh.echo("\nalias x=exit", _out=zf)
sh.echo("\nalias pw='ping www.baidu.com'", _out=zf)


# set for conda
# not test on a clean os
conda_path = sh.which('conda').rstrip('/conda')
sh.echo("\n\nexport PATH=" + conda_path + ":$PATH", _out=zf)
sh.echo("\nsource " + conda_path + "/virtualenvwrapper.sh", _out=zf)
sh.echo("\nworkon personal_dev", _out=zf)

# set for golang
sh.echo("\n\nexport GOPATH=$HOME/go", _out=zf)
sh.echo("\nexport PATH=$PATH:$GOPATH/bin", _out=zf)

# set lang
sh.echo("\n\nexport LC_ALL=en_US.UTF-8", _out=zf)
sh.echo("\nexport LANG=en_US.UTF-8", _out=zf)

