#!/usr/bin/bash
if [[ `whoami` == "root" && -e "/data/data/com.termux/files/usr/bin/apt-get" ]]
then
    cd . # nada
elif [ `whoami` == "root" ]
then
    echo "você precisa ser root para executar este script"
    exit 1
fi

echo "instalando o neovim..."

if [ -e "/bin/apt-get" ]
then
    apt-get update > /dev/null
    apt-get install neovim -y > /dev/null
elif [ -e "/bin/dnf" ]
then
    dnf check-update
    dnf install neovim
elif [ -e "/bin/apk" ]
then
    apk update > /dev/null
    apk add neovim -y > /dev/null
elif [ -e "/bin/pacman" ]
then
    pacman -Sy > /dev/null
    pacman -S neovim
elif [ -e "/data/data/com.termux/files/usr/bin/apt-get" ]
then
    apt-get update > /dev/null
    apt-get install neovim -y > /dev/null
fi

if [ -d "$HOME/.config/nvim" ]
then
    rm -rf ~/.config/nvim
fi

git clone https://github.com/foxx3r/amazing-vimrc ~/.config/nvim 2> /dev/null

if [ -e "/data/data/com.termux/files/usr/bin/apt-get" ]
then
    mkdir $PREFIX/var/tmp/nvim/backups -p
    echo "\" BACKUP" >> ~/.config/nvim/init.vim
    echo "set backup" >> ~/.config/nvim/init.vim
    echo "set writebackup" >> ~/.config/nvim/init.vim
    echo "set backupdir=$PREFIX/var/tmp/nvim/backups" >> ~/.config/nvim/init.vim
    echo "set dir=$PREFIX/var/tmp/nvim/swaps" >> ~/.config/nvim/init.vim
else
    mkdir /var/tmp/nvim/backups -p
    echo "\" BACKUP" >> ~/.config/nvim/init.vim
    echo "set backupdir" >> ~/.config/nvim/init.vim
    echo "set writebackup" >> ~/.config/nvim/init.vim 
    echo "set backup=/var/tmp/nvim/backups" >> ~/.config/nvim/init.vim 
    echo "set dir=/var/tmp/nvim/swaps" >> ~/.config/nvim/init.vim
fi

echo "pronto! agora entre no NeoVim digitando 'nvim' e rode :PlugInstall (ou :PlugI, ele auto-completa pra gente :))"
