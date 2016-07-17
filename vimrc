set nocompatible

filetype off

call plug#begin('~/.vim/plugged')

Plug 'JazzCore/ctrlp-cmatcher'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json'
Plug 'edsono/vim-matchit'
Plug 'gavocanov/vim-js-indent'
Plug 'jmcantrell/vim-virtualenv'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim'
Plug 'ternjs/tern_for_vim'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'VundleVim/Vundle.vim'
Plug 'wellle/targets.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'alvan/vim-closetag'
Plug 'justinmk/vim-sneak'
Plug 'hynek/vim-python-pep8-indent'
Plug 'ap/vim-css-color'
Plug 'KabbAmine/vCoolor.vim'

call plug#end()

" javascript-libraries-syntax config
let g:used_javascript_libs = 'react, angularjs'

" vim-jsx -> use for js files too
let g:jsx_ext_required = 0

" vim-closetag
let g:closetag_filenames = "*.html,*.js,*.jsx"

" Case insensitive search + case sensitive when including a capital letter in
" search
set ignorecase
set smartcase

syntax enable " enable syntax processing
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set incsearch           " search as characters are entered

set laststatus=2
set statusline=%f " display filename in status bar

set modelines=0
set nomodeline " modelines are annoying

" line numbers
set number
highlight LineNr guibg=white

" indentation stuff
set shiftwidth=4
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces

" aliases for myvimrc
command! Editvim :tabe $MYVIMRC
command! Editzsh :tabe ~/.zshrc
command! Sourcevim :source $MYVIMRC

" allow buffers to be unsaved in the background
set hidden

" don't beep at me!
set visualbell
set noerrorbells

let g:ctrlp_open_new_file = 'r'

" ignore certain file types
let g:ctrlp_custom_ignore = 'pyc\|DS_Store\|git'


" set leader to spacebar
let mapleader = "\<Space>"

" ctrl p stuff
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>p :CtrlPMRU<CR>

" toggle gundo
nnoremap <Leader>u :GundoToggle<CR>

" save
nnoremap <Leader>w :w<CR>

" alternate file
nnoremap <Leader>r <C-^>

" nerdtree toggle
nnoremap <Leader>n :NERDTreeToggle<CR>

" copy line no. + file name
nnoremap <Leader>cfn :let @*=expand("%").":".line(".")<CR>

" move between splits
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" remap for emmet
" nnoremap <Leader>e <C-y>

" syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

" YCM stuff
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" toggle syntastic, check on <Leader>e
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [],'passive_filetypes': ['html', 'js'] }
nnoremap <Leader>e :SyntasticToggleMode<CR>

" fix YCM status annoyances
set shortmess+=c

" disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" source vim on save
autocmd! bufwritepost .vimrc source %

" use js syntax highlighting for json
autocmd BufNewFile,BufRead *.json set ft=javascript

" number of lines to see above and below the cursor
" set scrolloff=8

" set central swp files location
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" folds open by default
set foldlevelstart=999

" NERDTree ignore files
let NERDTreeIgnore = ['\.pyc$']

" js indentation
autocmd Filetype javascript,jsx setlocal shiftwidth=4 tabstop=4 softtabstop=4

" detect json files correctly
autocmd BufRead,BufNewFile *.json set filetype=json

" reveal in finder
function! s:RevealInFinder()
  if filereadable(expand("%"))
    let l:command = "open -R " . shellescape("%")
  elseif getftype(expand("%:p:h")) == "dir"
    let l:command = "open " . shellescape("%") . ":p:h"
  else
    let l:command = "open ."
  endif

  execute ":silent! !" . l:command

  " For terminal Vim not to look messed up.
  redraw!
endfunction

command! Reveal call <SID>RevealInFinder()

""" vim-notes stuff
let g:notes_directories = ['~/Dropbox/vim notes']
let g:notes_suffix = '.txt'

" " easy motion color fix
" call EasyMotion#highlight#init()

" " easy motion config
" let g:EasyMotion_do_mapping = 0 "disable defaults
" nmap <Leader>s <Plug>(easymotion-overwin-f)
" let g:EasyMotion_smartcase = 1 "case insensitive features
" map <Leader> <Plug>(easymotion-prefix)

" sneak insensitive case
let g:sneak#use_ic_scs = 1

" ignore node_modules and other common useless files
let g:ctrlp_custom_ignore = '\v[\/](node_modules)|(\.(swp|ico|git|svn))$'

" colorizer config
let g:colorizer_auto_filetype='css,html'

" fix option key
if has("gui_macvim")
    set macmeta
end

" ctrlp-cmatcher
let g:ctrlp_match_func = {'match': 'matcher#cmatch' }
