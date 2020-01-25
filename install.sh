#"/usr/bin/bash
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

git clone https://github.com/foxx3r/amazing-vimrc ~/.config/nvim > /dev/null

if [ -e "/data/data/com.termux/files/usr/bin/apt-get" ]
then
    mkdir $PREFIX/var/tmp/nvim/backups -p
else
    mkdir /var/tmp/nvim/backups -p
fi

echo "pronto! agora entre no NeoVim digitando 'nvim' e rode :PlugInstall (ou :PlugI, ele auto-completa pra gente :))"
