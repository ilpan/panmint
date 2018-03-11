#!/bin/bash

# install git first
sudo add-apt-repository ppa:git-core/ppa && sudo apt-get update && sudo apt-get install git

# install oh-my-zsh
sudo apt-get install wget curl axel zsh && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# chsh -s `which zsh`

# install Powerline fonts
# sudo apt-get install fonts-powerline
git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. && rm -rf fonts

# install zsh-theme
curl https://raw.githubusercontent.com/zakaziko99/agnosterzak-ohmyzsh-theme/master/agnosterzak.zsh-theme -o agnosterzak.zsh-theme && mv agnosterzak.zsh-theme $ZSH_CUSTOM/themes/
sed -i "s/.*ZSH_THEME=\".*\"/ZSH_THEME=\"agnosterzak\"/g" ${HOME}/.zshrc

# install tmux
sudo apt-get install tmux && git clone https://github.com/gpakosz/.tmux.git && cd .tmux && cp .tmux.conf ${HOME}/

# install vim
sudo apt-get install vim && curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

# install terminal
sudo apt-get install guake terminator

