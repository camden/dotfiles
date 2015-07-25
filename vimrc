set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'xolox/vim-session'
Bundle 'xolox/vim-misc'

set shortmess=c

let g:session_autoload="yes"
let g:session_autosave="yes"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=%f
set laststatus=2

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['jshint']

set backspace=2

set guifont=Menlo:h14

let mapleader = "\<Space>"
noremap <Leader>w :update<CR>

set autoindent
set smartindent

syntax enable
set background=dark
colorscheme solarized

set relativenumber
set number
set cursorline
highlight Cursor guibg=Black 

set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch
set history=1000
set undolevels=1000

set tabstop=4
set softtabstop=4
set shiftwidth=4

set lazyredraw
set wildmenu

set clipboard=unnamed
