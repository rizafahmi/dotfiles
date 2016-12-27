set mouse=""
set encoding=utf-8

set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

map ; :
set number
imap jj <Esc>
cmap jj <c-c>
vmap v <Esc>
let g:mapleader=','

" Better search
set hlsearch
set incsearch
set ignorecase
set smartcase
map <CR> :nohl<cr>

" Cursors
set cursorline
set cursorcolumn

set title

call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim'
Plug 'vimlab/neojs'

call plug#end()

" Theming
set background=dark
syntax enable
colorscheme dracula

set completeopt=longest,menuone,preview
