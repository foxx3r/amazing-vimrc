#!/usr/bin/env bash

echo "Usuário atual: `whoami`"
echo "ATENÇÃO: você precisa ser root para executar este script, a menos que você esteja usando termux"

if [ "`whoami`" == "root" ];then
    read -p "Instalar programas extras para melhorar ainda mais o NeoVim?[s/n] " extra
else
    extra="n"
fi
if [ "$extra" == "s" -o "$extra" == "S" ];then
    programs="nodejs curl neovim git"
    extra="s"
else
    programs="curl neovim git"
    extra="n"
fi

echo "instalando os programas..."
if [ "`whoami`" != "root" ];then
    echo "Pulando instalações por falta de root..."
elif [ -e "/bin/apt-get" ];then
    apt-get update
    apt-get install $programs -y
    if [ "$extra" == "s" ];then
        echo "Instalando o npm..."
        apt-get install npm -y
    fi
elif [ -e "/bin/dnf" ];then
    dnf check-update
    dnf install $programs
elif [ -e "/bin/apk" ];then
    apk update
    apk add $programs -y
    if [ "$extra" == "s" ];then
        apk add npm -y
    fi
elif [ -e "/bin/pacman" ];then
    pacman -Sy
    pacman -S $programs
elif [ -e "/data/data/com.termux/files/usr/bin/apt-get" ];then
    apt-get update
    apt-get install $programs -y
fi

if [ -d "$HOME/.config/nvim" ];then
    rm -rf ~/.config/nvim
else
    mkdir -p ~/.config/nvim
fi

git clone https://github.com/foxx3r/amazing-vimrc ~/.config/nvim

if [ -e "/data/data/com.termux/files/usr/bin/apt-get" ];then
    mkdir -p $PREFIX/var/tmp/nvim/backups $PREFIX/var/tmp/nvim/swaps/
    echo "\" BACKUP" >> ~/.config/nvim/init.vim
    echo "set writebackup" >> ~/.config/nvim/init.vim
    echo "set backupdir=.,$PREFIX/var/tmp/nvim/backups" >> ~/.config/nvim/init.vim
    echo "set dir=.,$PREFIX/var/tmp/nvim/swaps" >> ~/.config/nvim/init.vim
else
    mkdir -p ~/.local/share/nvim/backup ~/.local/share/nvim/swaps/
    echo "\" BACKUP" >> ~/.config/nvim/init.vim
    echo "set writebackup" >> ~/.config/nvim/init.vim
    echo "set backupdir=.,~/.local/share/nvim/backup" >> ~/.config/nvim/init.vim
    echo "set dir=.,~/.local/share/nvim/swaps" >> ~/.config/nvim/init.vim
fi

if [ "$extra" == "s" ];then
    echo "Instalando dependências adicionais..."
    npm i -g yarn
    yarn global add vim-language-server
fi

echo "pronto! agora entre no NeoVim digitando 'nvim' e rode :PlugInstall (ou :PlugI, ele auto-completa pra gente :))"
