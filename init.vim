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

call plug#end()


" SYNTAX
" Enable syntax highlighting
syntax on


" SEARCH
" Highlight search term. Use :nohl to redraw screen and disable highlight
set hlsearch

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
" Disable all backup files, never used them
set nobackup
set nowritebackup
set noswapfile


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
colorscheme molokai

" FONT
set guifont=Monaco\ for\ Powerline:h12s

" ENCODING
set encoding=utf-8

" COMMAND LINE
" Enhanced command line completion
set wildmenu

" Complete files like a shell
set wildmode=list:longest

" SEARCH
" Vim will start searching as you type
set incsearch

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
noremap <C-r> :call Repl() <CR>
