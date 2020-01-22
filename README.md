# init.vim para neovim

**Instalacao do neovim em sistemas debian-like:**

`$ sudo apt install neovim`

**Configurando o ambiente:**

`$ mkdir ~/.config -p`

**Instalacao do init.vim:**

`$ git clone https://github.com/foxx3r/amazing-vimrc ~/.config/nvim`

Para instalar os plugins necessarios, voce precisa das seguintes ferramentas instaladas:

```
curl
git
wget
```

# Instalação no VIM

Não recomendo o uso do VIM até porque eu não o testei, mas caso queira do mesmo jeito (pode ser que algumas funções não funcionem), mova o init.vim para o diretório padrão do seu usuário (no Linux, $HOME) e renomeie-o para .vimrc, após isso, os demais diretórios, mova-os para a pasta .vim no diretório do seu usuário.

# Atualização

Para atualizar o script, você terá que clonar de novo. Mas eu inserí uma opção no install.sh para contornar este meu erro. Então futuramente, caso queira atualizar, basta apenas digitar:

`$ git pull`

O script ainda não é compatível com distribuições não baseadas no Debian, futuramente adicionarei suporte às demais distros.

# Features

**1. Compilação automática**

Para salvar e executar/compilar seu projeto aperte `CTRL + G`

**2. REPL integrada**

Para rodar a REPL, use `CTRL + a`

**3. Log de última modificação**

Para adicionar o log de última modificação no seu VIM, adicione `ultima modificação: ` e `Last Change: ` nas 5 primeiras linhas do seu projeto. 

Atenção:

1 - Os seus projetos devem conter os dois comentários, obrigatoriamente, caso contrário, não funcionará.

2 - Eles também devem ter um espaço após o ":".

3 - Fique atento ao "ção", "L" e "C", eles são obrigatórios.

Exemplo:

```rust
// ultima modificação: 
// Last Change: 
fn main() {
    println!("Hello, World!");
}
```

Após isso, salve-o.

**4. Fechamento automático em HTML**

...

**5. Destaque de IP**

...

**6. Changelog automático**

No modo normal do VIM, chame `:call InsertChangelog()` ou `:call InsertHeadBash()` para scripts em bash.

Perceba que ao fazer isso, o nome do Autor será o meu, você poderá mudá-lo no `~/.vimrc` ou `~/.config/nvim/init.vim`, ou então mudá-lo toda vez que executar a função.

**7. Rolar janela alternativa de forma mais amigável**

Após usar `Ctrl-w-n` ou `:split`, você poderá rolar a janela abaixo com `ALT + teclas (up, down)`.

Obs: Ainda não disponivel com `:vsplit`, não suportado com mais de 2 janelas.

# Backup

Existem 2 tipos de backup no VIM/NeoVim:

1. Ao programa ser interrompido ou a máquina for desligada inesperadamente, é o que chamamos de "swap" e irá ser guardado automaticamente no diretório /var/tmp/nvim/swaps e devem começar com um ponto no Linux ou underline no Windows (prefixo de arquivo oculto).

2. A cada vez que você modifica um arquivo, o estado anterior a modificação dele é criado com um til (~) no final, é o que chamamos de "backups" e irá ser automaticamente armazenado no /var/tmp/nvim/backups.

**Obs:** Você terá que criar manualmente o diretório /var/tmp/nvim/backups

# Plugins

**delimitMate** - Auto-fechamento de delimitadores

**ag.vim** - Está deprecated, vou atualizar e colocar o ack.vim, mas simplesmente extende a capacidade do VIM buscar fazendo regex e dar split na tela

**ctrlp.vim** - É um fuzzy de path e buffer bstante leve

**nerdcommenter** - Auto comment

**vim-polyglot** - Um plugin com vários outros plugins e inclui suporte a 200 linguagens na qual o VIM/neovim não tem suporte (ficando 700 no total)

**syntastic** - Analisador sintático completo

**nerdtree** - Um tree path

**vim-numbertoggle** - Um number navigation

**AutoComplPop** - Auto complete

**vim-editorconfig** - Extende as possibilidades de configuração do VIM

# Temas

**Molokai:**

![molokai](https://github.com/foxx3r/amazing-vimrc/blob/master/molokai.png)

Este tema já vem por padrão, mas caso queira mudar, insira isso no seu .vimrc ou init.vim:

`colorscheme molokai`

**Jellybeans:**

![jellybeans](https://camo.githubusercontent.com/707cd3e91122014ee4b6273e6873838e5b5df558/68747470733a2f2f6e616e6f746563682e6e616e6f74656368636f72702e6e65742f646f776e6c6f6164732f6a656c6c796265616e732d707265766965772e706e67)

Para mudar para este tema, insira:

`colorscheme jellybeans`

**Afterglow:**

![afterglow](https://user-images.githubusercontent.com/8104631/68043099-cfbc4800-fcd4-11e9-8b9d-2ba0372f4196.png)

Para mudar para este tema, insira:

`colorscheme afterglow`

**Atom:**

![atom](https://camo.githubusercontent.com/55b6c4d5865471724a4a5a61d028588f158273a5/687474703a2f2f7777772e67726567736578746f6e2e6f72672f696d616765732f61746f6d2f61746f6d2d707974686f6e2e6a7067)

Para mudar para este tema, insira:

`colorscheme atom`

**Challenger-deep**

![challenger-deep](https://camo.githubusercontent.com/e98aa9cc4316c955f349634ad95e26b45163536b/68747470733a2f2f6368616c6c656e6765722d646565702d7468656d652e6769746875622e696f2f696d616765732f73637265656e73686f74732f76696d2e706e67)

Para mudar para este tema, insira:

`colorscheme challenger_deep`

**Deus:**

![deus](https://github.com/ajmwagar/vim-deus/blob/master/screencaps/Deus.png)

Para mudar para este tema, insira:

`colorscheme deus`

**Dracula:**

![dracula](https://github.com/dracula/vim/blob/master/screenshot.png)

Para mudar para este tema, insira:

`colorscheme dracula`

**Gotham:**

![gotham](https://camo.githubusercontent.com/06a9ca5f2b4bb4b1066bf304fc2dddb44be09cec/687474703a2f2f692e696d6775722e636f6d2f4e66527548464e2e706e67)

Para mudar para este tema, insira:

`colorscheme gotham`

ou

`colorscheme gotham256`

**Meta5:**

![meta5](https://camo.githubusercontent.com/4123aa2a8f5c40efca6a53206cebf88237780c0b/687474703a2f2f6368726973746f706865726d63612e6769746875622e696f2f696d672f6d657461352d73637265656e73686f742e706e67)

Para mudar para este tema, insira:

`colorscheme meta5`

**Onedark:**

![onedark](https://github.com/joshdick/onedark.vim/blob/master/img/readme_header.png)

Para mudar para este tema, insira:

`colorscheme onedark`

**Space-vim-dark**

![space-vim-dark](https://raw.githubusercontent.com/liuchengxu/img/master/space-vim/space-vim-gui.png)

Para mudar para este tema, insira:

`colorscheme space-vim-dark`

**Dica:** caso queira experimentar novos temas, dentro do vim/neovim, insira `:colorscheme <nome do tema>`. Para desenvolvimento, recomendamos os temas Deus ou Molokai, sendo o Deus o mais completo e Monokai o mais legível.

# Tutorial de VIM

Logo em breve criarei um tutorial de VIM =D aguardem.
