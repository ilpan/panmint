#!/bin/bash

init() {
    sudo pacman-mirrors -i -c China -m rank

    sudo echo "
[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
" >> /etc/pacman.conf

    sudo pacman -S archlinux-keyring
    sudo pacman -Syyu

    # yaourt
    sudo pacman -S yaourt-gui-manjaro aurvote
}

# install default software
default_app() {
    # some useful app
    sudo pacman -S axel htop tree speedtest-cli

    # powerline
    # sudo pacman -S powerline powerline-fonts 
    git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. && rm -rf fonts

    # oh-my-zsh
    sudo pacman -S oh-my-zsh-git && \
        cp /usr/share/oh-my-zsh/zshrc ~/.zshrc && chsh -s `which zsh` && \
        curl -s https://raw.githubusercontent.com/zakaziko99/agnosterzak-ohmyzsh-theme/master/agnosterzak.zsh-theme -o agnosterzak.zsh-theme && \
        mv agnosterzak.zsh-theme $ZSH_CUSTOM/themes/ # && yaourt -S zsh-dircolors-solarized-git

    # tmux
    sudo pacman -S tmux && \
        cd ~ && git clone https://github.com/gpakosz/.tmux.git && \
        cd .tmux && cp .tmux.conf ${HOME}/ && cd -

    # vim
    sudo pacman -S vim && \
        cd ~ && curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && \
        sh spf13-vim.sh && cd -

    # docker
    sudo pacman -S docker docker-compose && \
        sudo gpasswd -a $USER docker
}


# configure development environment
dev_config() {
    # sdkman
    sudo pacman -S zip unzip && \
        curl -s https://get.sdkman.io | bash && \
        source ${HOME}/.sdkman/bin/sdkman-init.sh
    java_version="8.0.181-oracle"
    scala_version="2.11.12"
    maven_version="3.5.4"
    sbt_version="1.2.1"
    sdk install java $java_version
    sdk install scala $scala_version
    sdk install maven $maven_version
    sdk install sbt $sbt_version

    # pipenv
    sudo pacman -S python-pipenv

    # golang && dep
    sudo pacman -S golang dep
}


# install development software
jetbrains() {
    GOLAND="goland"
    IDEA=("intellij-idea-community-edition" "intellij-idea-ultimate-edition")
    PYCHARM=("pycharm-community-edition" "pycharm-professional")

    JETBRAINS=($GOLAND $IDEA[2] $PYCHARM[2])
    sudo pacman -S $JETBRAINS
}

dev_app() {
    jetbrains
    sudo pacman -S visual-studio-code-bin
    sudo pacman -S zeal muparser albert
    yaourt -S httpie mycli pgcli
}


# install multimedia & office software
media_office_app() {
    # theme
    sudo pacman -S arc-kde capitaine-cursors numix-circle-icon-theme-git
    # yaourt -S sddm-theme-kde-plasma-chili

    # sogoupinyin
    sudo pacman -S fcitx fcitx-configtool fcitx-sogoupinyin

    # media
    sudo pacman -S docky google-chrome netease-cloud-music
    # yaourt -S miredo xx-net

    # office
    sudo pacman -S remarkable typora wps-office
}


# install flow
flow() {
    init
    default_app
    dev_config
    dev_app
    media_office_app 
}

flow

