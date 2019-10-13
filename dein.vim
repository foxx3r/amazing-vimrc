 " Dein
 # REQUIRED: Add a syntax file. YATS is the best
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
 " For async completion
  call dein#add('Shougo/deoplete.nvim')
 " For Denite features
  call dein#add('Shougo/denite.nvim')


 " Vim-Plug
 # REQUIRED: Add a syntax file. YATS is the best
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
 " For async completion
  Plug 'Shougo/deoplete.nvim'
 " For Denite features
  Plug 'Shougo/denite.nvim'


" Enable deoplete at startup

  let g:deoplete#enable_at_startup = 1
