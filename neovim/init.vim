set mouse=""
set encoding=utf-8

set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set autochdir

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
  set runtimepath+=~/.config/nvim/plugged/deoplete.nvim/
  let g:deoplete#enable_at_startup = 1
  set runtimepath+=~/.config/nvim/snippets/
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


Plug 'sheerun/vim-polyglot'
Plug 'neomake/neomake'
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup END
  let g:neomake_markdown_enabled_makers = []
  " let g:neomake_javascript_enabled_makers = ['eslint']

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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
  let g:rainbow_active = 1

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
  let g:neosnippet#enable_snipmate_compatibility = 1
  let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

  " Plugin key-mappings.
  imap <C-j>     <Plug>(neosnippet_expand_or_jump)
  smap <C-j>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-j>     <Plug>(neosnippet_expand_target)

  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

Plug 'aaren/arrowkeyrepurpose'

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

" Automatic fixing indentation
autocmd! bufwritepost *.js :normal ma gg=G 'a

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Switch between the last two files
nnoremap <leader><leader> <c-^>

set pastetoggle=<F2>
set clipboard=unnamed
"
" This turns off Vim’s crazy default regex characters and makes searches use normal regexes.
nnoremap / /\v
vnoremap / /\v

" Every unnecessary keystroke that can be saved is good for your health :)
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-k>
nnoremap <C-L> <C-W><C-L>
