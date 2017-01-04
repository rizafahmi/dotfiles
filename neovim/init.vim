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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

Plug 'sheerun/vim-polyglot'
Plug 'neomake/neomake'
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup END
  let g:neomake_markdown_enabled_makers = []

Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  set laststatus=2
  let g:airline_powerline_fonts = 1
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'


call plug#end()

" Theming
set background=dark
syntax enable
colorscheme dracula

set completeopt=longest,menuone,preview
