#!/usr/bin/env bash

programs="curl git neovim"
echo "Instalando para o usuário: `whoami`"

if [ `whoami` = "root" ]; then
    echo "instalando os programas..."
    if [ -e "/bin/apt-get" ]; then
        apt-get update
        apt-get install $programs -y
    elif [ -e "/bin/dnf" ];then
        dnf check-update
        dnf install $programs
    elif [ -e "/bin/apk" ];then
        apk update
        apk add $programs -y
    elif [ -e "/bin/pacman" ];then
        pacman -Sy
        pacman -S $programs
    elif [ -e "/data/data/com.termux/files/usr/bin/apt-get" ];then
        apt-get update
        apt-get install $programs -y
    else
        echo "Gerenciador de pacotes não reconhecido!"
    fi
fi

for p in ${programs//neovim/nvim}; do
    which "$p" &>/dev/null
    if [ $? != 0 ]; then
        echo "Por favor instale o os programas: $programs"
        echo "ou execute como root(obs: Os temas seram instalados para o usuário root se fizer isso)"
        exit 1
    fi
done

if [ -d "$HOME/.config/nvim" ]; then
    echo "Atualizando plugins..."
    rm -rf ~/.config/nvim ~/.vim/{autoload,bundle}
else
    echo "Instalando plugins..."
    mkdir -p ~/.config/nvim
fi

git clone https://github.com/foxx3r/amazing-vimrc ~/.config/nvim

mkdir -p ~/.local/share/nvim/backup ~/.local/share/nvim/swaps
cat << EOF >> ~/.config/nvim/init.vim
" BACKUP
set writebackup
set backupdir=.,$HOME/.local/share/nvim/backup
set dir=.,$HOME/.local/share/nvim/swaps
EOF

echo "Pronto! Agora digite 'nvim' e se aparecer alguns avisos pressione enter, caso contrario pressione ESC+:PlugI para instalar os plugins, seja feliz :)"
