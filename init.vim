" Author: Filipe Deschamps
" Source: https://github.com/filipedeschamps/dotfiles

" LEADER KEY
let mapleader=","

" COMPATIBILITY
" Set 'nocompatible' to avoid unexpected things that your distro might have
set nocompatible
set t_ut=

" BUNDLE
" Automatically download vim-plug if it doesn't exist
"if empty(glob('~/.vim/autoload/plug.vim'))
  "silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
function! Executar(arq)
  :w
  if &filetype == 'go'
    :exec '!go run' a:arq
  elseif &filetype == 'python'
    :exec '!pypy' a:arq '|| python3' a:arq
  elseif &filetype == 'javascript'
    :exec '!node' a:arq
  elseif &filetype == 'c'
    :exec '!clang' a:arq '|| gcc' a:arq
  elseif &filetype == 'rust'
    :exec "!cargo-fmt"
    :exec '!cargo-clippy && cargo run || cargo run || rustc' a:arq
  elseif &filetype == 'typescript'
    :exec '!tsc -w' a:arq
  elseif &filetype == 'cpp'
    :exec '!clang++' a:arq '|| g++' a:arq
  elseif &filetype == 'ruby'
    :exec '!ruby' a:arq
  elseif &filetype == 'php'
    :exec '!php' a:arq
  elseif &filetype == 'java'
    :exec '!javac' a:arq
  elseif &filetype == 'cs'
    :exec '!dotnet run'
  elseif &filetype == 'matlab'
    :exec '!gcc `gnustep-config --objc-flags` -lgnustep-base' a:arq
  elseif &filetype == 'swift'
    :exec '!swift' a:arq
  elseif &filetype == 'perl'
    :exec '!perl' a:arq
  elseif &filetype == 'sh'
    :exec '!bash' a:arq
  elseif &filetype == "lisp"
    :exec "!sbcl --script" a:arq
  elseif &filetype == "prolog"
    :exec "!swipl" a:arq
  elseif &filetype == "haskell"
    :exec "!stack run || cabal run || ghc" a:arq
  elseif &filetype == "elixir"
    :exec "!elixir" a:arq
  endif
endfunction

noremap <C-g> :call Executar(shellescape(@%, 1))<CR>

" Configure vim-plug
call plug#begin('~/.vim/bundle')

    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'scrooloose/syntastic'
    Plug 'tomasr/molokai'
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'vim-scripts/AutoComplPop'
    Plug 'Raimondi/delimitMate'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'rking/ag.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'nanotech/jellybeans.vim'
    Plug 'danilo-augusto/vim-afterglow'
    Plug 'gregsexton/Atom'
    Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
    Plug 'ajmwagar/vim-deus'
    Plug 'dracula/vim'
    Plug 'whatyouhide/vim-gotham'
    Plug 'christophermca/meta5'
    Plug 'joshdick/onedark.vim'
    Plug 'liuchengxu/space-vim-dark'
    Plug 'vim-airline/vim-airline'
    Plug 'kyoz/purify', { 'rtp': 'vim' }
    Plug 'ciaranm/inkpot'
    Plug 'connorholyday/vim-snazzy'
    Plug 'mhartington/oceanic-next'
    Plug 'jacoborus/tender.vim'
    Plug 'veloce/vim-aldmeris'

call plug#end()


" SYNTAX
" Enable syntax highlighting
syntax on


" SEARCH
" Highlight search term. Use :nohl to redraw screen and disable highlight
set hlsearch

let g:airline#entensions#tabline#enabled = 1
let g:airline#entensions#tabline#left_sep = ' '
let g:airline#entensions#tabline#left_alt_sep = '|'
let g:airline#entensions#tabline#formatter = 'default'
" Make Ag search from your project root
let g:ag_working_path_mode="r"

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase


" AUTO IDENTATION
" Enable auto identation with 'spaces' instead of 'tabs'
set smartindent
set expandtab
set softtabstop=4
set shiftwidth=4


" MOVING BETWEEN FILES
" Set 'hidden' if you want to open a new file inside the same buffer without the
" need to save it first (if there's any unsaved changes).
set hidden


" REMEMBER THIGS
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" BACKUP
set backup
set writebackup
set backupdir=/var/tmp/nvim/backups
set dir=/var/tmp/nvim/swaps

" SYNTASTIC
" Syntastic is a syntax checking plugin for Vim that runs files through
" external syntax checkers and displays any resulting errors to the user.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Configure Standar JS as default linter
let g:syntastic_javascript_checkers = ['standard']

" COLOR SCHEME
" Load molokai (alternative to Monokai from TextMate) color scheme
colorscheme snazzy

" FONT
set guifont=Monaco\ for\ Powerline:h12s

" ENCODING
set encoding=utf-8

" COMMAND LINE
" Enhanced command line completion
set wildmenu

set cursorline
" Complete files like a shell
set wildmode=list:longest

" SEARCH
" Vim will start searching as you type
set incsearch
set ttyfast

" Automatically date
" =============== DATA AUTOMÁTICA ===========================
" insira na em seus arquivos =   "ultima modificação:"
" em qualquer das três primeiras linhas
fun! SetDate()
  mark z
  if getline(1) =~ ".* ultima modificação:" ||
                          \ getline(2) =~ ".*ultima modificação:"  ||
                          \ getline(3) =~ ".*ultima modificação:"  ||
                          \ getline(4) =~ ".*ultima modificação:"  ||
                          \ getline(5) =~ ".*ultima modificação:"
     exec "1,5s/\s*ultima modificação: .*$/ultima modificação: " . strftime("%c") . "/"
  endif
  exec "'z"
endfun
"  abaixo a chamada a função de data que é chamada toda vez que você
"  salva um arquivo preexistente
fun! LastChange()
  mark z
  if getline(1) =~ ".*Last Change:" ||
                          \ getline(2) =~ ".*Last Change:"  ||
                          \ getline(3) =~ ".*Last Change:"  ||
                          \ getline(4) =~ ".*Last Change:"  ||
                          \ getline(5) =~ ".*Last Change:"
     exec "1,5s/\s*Last Change: .*$/Last Change: " . strftime("%c") . "/"
  endif
     exec "'z"
endfun
" coloquei duas opções (alteração e modificação), assim
" não tem perigo de você esquecer e o sistema
" não atualizar a data do salvamento, outra melhoria na função
" é que agora é válida para qualquer tipo de arquivo. se usar
" num html por exemplo insira um começo de comentário na linha
" da data e feche o comentário na próxima linha
"  abaixo a chamada a função de data que é chamada toda vez que você
"  salva um arquivo preexistente
au BufWritePre * call SetDate()
au BufWritePre * call LastChange()
"============ Fim da Data Automática ===================
" FILE NUMBERS
" Enable relative and absolute file numbers
set number relativenumber

" WRAP
" Stop wrapping long lines
" set nowrap

" AUTORELOAD
" Automatically reload buffers when file changes
set autoread

" PLUGINS CONFIGURATIONS

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Syntastic
nnoremap <leader>st :SyntasticToggleMode<cr>

" NERDTree
nnoremap <leader>ft :NERDTreeToggle<cr>
set ts=4
set cul
syn match ipaddr   /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
 hi link ipaddr Identifier
 imap ><Tab> ><Esc>mt?<\w<Cr>:let @/=""<Cr>lyiw`ta</><Esc>P`tli
" --------------------------------------
" Ativa fechamento automático para parêntese
" Set automatic expansion of parenthesis/brackets
inoremap ( ()<esc>:call BC_AddChar(")")<cr>i
inoremap { {}<esc>:call BC_AddChar("}")<cr>i
inoremap [ []<esc>:call BC_AddChar("]")<cr>i
" inoremap " ""<esc>:call BC_AddChar(""")<cr>i
"
" mapeia CTRL+j para pular fora de parênteses colchetes etc...
inoremap <C-j> <esc>:call search(BC_GetChar(), "W")<cr>a
" Function for the above
function! BC_AddChar(schar)
   if exists("b:robstack")
       let b:robstack = b:robstack . a:schar
   else
       let b:robstack = a:schar
   endif
endfunction
function! BC_GetChar()
   let l:char = b:robstack[strlen(b:robstack)-1]
   let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
   return l:char
endfunction
function! Repl()
    :w
    if &filetype == "javascript"
        :exec "!node"
    elseif &filetype == "lisp"
        :exec "terminal sbcl"
    elseif &filetype == "haskell"
        :exec "terminal ghci"
    elseif &filetype == "elixir"
        :exec "terminal iex"
    elseif &filetype == "python"
        :exec "terminal python3"
    elseif &filetype == "v"
        :exec "terminal v repl"
    elseif &filetype == "prolog"
        :exec "terminal swipl"
    elseif &filetype == "php"
        :exec "terminal php -a"
    elseif &filetype == "sh"
        :exec "terminal"
    elseif &filetype == "ruby"
        :exec "terminal irb"
    elseif &filetype == "scala"
        :exec "terminal scala"
    elseif &filetype == "erlang"
        :exec "terminal erl"
    endif
endfunction
noremap <C-a> :call Repl() <CR>

" Changelog automático
" === Cria um registro de alterações de arquivo ========
" ChangeLog entry convenience
" Função para inserir um status do arquivo
" cirado: data de criação, alteração, autor etc (em modo normal)
fun! InsertChangeLog()
   normal(1G)
   call append(0, "// Arquivo: " . expand('%:t1'))
   call append(1, "// Criado: " . strftime("%a %d/%b/%Y hs %H:%M"))
   call append(2, "// ultima modificação: " . strftime("%a %d/%b/%Y hs %H:%M"))
   call append(3, "// Autor: Gustavo Gabriel Santos Bandeira Mignot (foxx3r)")
   call append(4, "/* * Alterações: */")
   normal($)
endfun
map ,cl :call InsertChangeLog()<cr>A
"
" Cria um cabeçalho para scripts bash
fun! InsertHeadBash()
   normal(1G)
   :set ft=bash
   :set ts=4
   call append(0, "#!bin/bash")
   call append(1, "# Criado em:" . strftime("%a %d/%b/%Y hs %H:%M"))
   call append(2, "# ultima modificação:" . strftime("%a %d/%b/%Y hs %H:%M"))
   call append(3, "# Nome da empresa")
   call append(3, "# Propósito do script")
   normal($)
endfun
map ,sh :call InsertHeadBash()<cr>A

"rola janela alternativa
fun! ScrollOtherWindow(dir)
    if a:dir == "down"
        let move = "\<C-E>"
    elseif a:dir == "up"
        let move = "\<C-Y>"
    endif
    exec "normal \<C-W>p" . move . "\<C-W>p"
endfun
nmap <silent> <M-Down> :call ScrollOtherWindow("down")<CR>
nmap <silent> <M-Up> :call ScrollOtherWindow("up")<CR>
