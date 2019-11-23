echo "instalando o neovim..."
apt-get update > /dev/null
apt-get install neovim > /dev/null
mkdir -p $HOME/.config/nvim
mv ./* $HOME/.config/nvim/ > /dev/null
echo "pronto!"
