echo "instalando o neovim..."
apt-get update > /dev/null
apt-get install neovim -y > /dev/null
if [ -d "~/.config/nvim" ]
then
    rm -rf ~/.config/nvim
fi
git clone https://github.com/foxx3r/amazing-vimrc ~/.config/nvim
mkdir -p /var/tmp/nvim/backups
echo "pronto! agora entre no NeoVim digitando 'nvim' e rode :PlugInstall (ou :PlugI, ele auto-completa pra gente :))"
