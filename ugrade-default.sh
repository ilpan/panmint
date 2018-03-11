#!/bin/bash

# updata repo & upgrade
sudo apt-get update && sudo apt-get upgrade

# upgrade oh-my-zsh
upgrade_oh_my_zsh

# upgrade sp13-vim
curl https://j.mp/spf13-vim3 -L -o - | sh

