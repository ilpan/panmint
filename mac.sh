#!/bin/bash

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install required apps
brew install axel curl wget zsh git

# configure git
git config --global user.name "ilpan"
git config --global user.email "pna.dev@outlook.com"

# install oh-my-zsh and other
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
    curl https://raw.githubusercontent.com/zakaziko99/agnosterzak-ohmyzsh-theme/master/agnosterzak.zsh-theme -o agnosterzak.zsh-theme && \
    mv agnosterzak.zsh-theme $ZSH_CUSTOM/themes/ && \
    sed -i "s/.*ZSH_THEME=\".*\"/ZSH_THEME=\"agnosterzak\"/g" ${HOME}/.zshrc && \
    git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. && rm -rf fonts

# init python
wget -c --no-check-certificate https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
source virtualenv.sh

# init golang
brew install go dep

# add some configurations on zshrc
./configure_zshrc.py

# install vim
brew install vim && && curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

# install jenv
curl -L -s get.jenv.io | bash && \
    source ${HOME}/.jenv/bin/jenv-init.sh # && \
#    jenv selfupdate

# install itemr2
brew cask install iterm2

