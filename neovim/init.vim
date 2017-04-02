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
Plug 'pbogut/deoplete-elm'


Plug 'sheerun/vim-polyglot'
" Plug 'mxw/vim-jsx'
  " let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" Plug 'pangloss/vim-javascript'
" Plug 'othree/javascript-libraries-syntax.vim'
Plug 'neomake/neomake'
  augroup localneomake
    autocmd bufwritepost *.js silent !standard --fix -w % > /dev/null
    autocmd bufwritepost *.jsx silent !standard --fix -w % > /dev/null
    autocmd! BufWritePost * Neomake
  augroup END
  set autoread
  let g:neomake_markdown_enabled_makers = []
  " let g:neomake_javascript_eslint_exe = '/Users/riza/.nvm/versions/node/v6.9.1/bin/eslint_d'
  " sleep 100m
  let g:neomake_javascript_enabled_makers = ['standard', 'eslint']
  let g:neomake_jsx_enabled_makers = ['standard']
  let g:neomake_javascript_standard_exe = '/Users/riza/.nvm/versions/node/v6.9.1/bin/standard'


Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  set laststatus=2
  let g:airline_powerline_fonts = 1
  set noshowmode
  set statusline=%=&P\ %f\ %m
  set fillchars=vert:\ ,stl:\ ,stlnc:\ 
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ctrlpvim/ctrlp.vim'
  " let g:ctrlp_cmd = 'CtrlPMixed'
  " let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
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
Plug 'tpope/vim-unimpaired'
  " Bubble single line
  nmap <A-k> [e
  nmap <A-j> ]e

  " Bubble multiple line
  vmap <A-k> [egv
  vmap <A-j> ]egv

Plug 'elmcast/elm-vim'
  let g:polyglot_disabled = ['elm']
  let g:elm_detailed_complete = 1
  let g:elm_format_autosave = 1
  let g:elm_syntastic_show_warnings = 1
  autocmd Filetype elm setlocal ts=4 sw=4 sts=0 expandtab

Plug 'morhetz/gruvbox'
  let g:gruvbox_italic = 1
Plug 'ryanoasis/vim-devicons'
  set guifont=FuraCode\ Nerd\ Font:h22
  let g:airline_powerline_fonts = 1
Plug 'EinfachToll/DidYouMean'

Plug 'noahfrederick/vim-hemisu'
Plug 'tpope/vim-eunuch'
Plug 'kristijanhusak/vim-hybrid-material'
call plug#end()


" Persistence undo
set undodir=~/.config/nvim/undodir
set undofile

" Theming
set background=dark
syntax enable
" colorscheme dracula
" colorscheme gruvbox
colorscheme hybrid_material
hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi EndOfBuffer ctermfg=237 ctermbg=235


set completeopt=longest,menuone,preview

" Automatic reloading .vimrc
autocmd! bufwritepost *.vim source %

" Automatic fixing indentation
" autocmd! bufwritepost *.js :normal ma gg=G 'a

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

" Italic
highlight Comment gui=italic
highlight Comment cterm=italic
highlight htmlArg gui=italic
highlight htmlArg cterm=italic

" Prettify JavaScript
" autocmd FileType javascript set formatprg=prettier\ --stdin
" autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"
