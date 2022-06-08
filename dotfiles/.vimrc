set encoding=utf-8
set number
set nowrap
set showcmd
set showmatch
set list
set listchars=eol:¬,tab:▸\

set hlsearch
set nowrapscan
set noincsearch
set smartcase

set backspace=indent,eol,start
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent

set nobackup
set history=100
set wildmenu
set wildmode=longest:full,full
set ttyfast

" autoload vim plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
