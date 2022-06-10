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

" color
set background=dark
colorscheme hybrid

" autoload vim plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" warning
let g:coc_disable_startup_warning = 1

" autocomplete by tab
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()

" code jump
nmap gd (coc-definition)

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0ng/vim-hybrid'
Plug 'tpope/vim-endwise'
Plug 'Townk/vim-autoclose'
call plug#end()
