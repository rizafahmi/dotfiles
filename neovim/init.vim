set mouse=""

set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2


call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  " Use tab for completion
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

call plug#end()
