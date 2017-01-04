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

filetype plugin on

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
  let g:neomake_javascript_enabled_makers = ['eslint']

Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  set laststatus=2
  let g:airline_powerline_fonts = 1
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
  " let g:ctrlp_cmd = 'CtrlPMixed'
  " let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_max_height = 30
  set wildignore+=*.pyc
  set wildignore+=*_build/*
  set wildignore+=*/coverage/*
  set wildignore+=*/tmp/*
  set wildignore+=*/node_modules/*
  map <C-B> :CtrlPBuffer<CR>
  map <C-P> :CtrlPMixed<CR>
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'


call plug#end()

" Persistence undo
set undodir=~/.config/nvim/undodir
set undofile

" Theming
set background=dark
syntax enable
colorscheme dracula

set completeopt=longest,menuone,preview

" Automatic reloading .vimrc
autocmd! bufwritepost *.vim source %

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Switch between the last two files
nnoremap <leader><leader> <c-^>
