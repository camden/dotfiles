" vim: fdm=marker foldmarker=(--,___ foldlevelstart=0 foldlevel=0

" ____________________________________________________________________
" IMPORTANT (-----------------------------------------------------------
" ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

set nocompatible
filetype off

" ____________________________________________________________________
" PLUGINS (-----------------------------------------------------------
" ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-repeat'
Plug 'haya14busa/incsearch.vim'
Plug 'maxbrunsfeld/vim-yankstack'
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

" ____________________________________________________________________
" PLUGIN OPTIONS (----------------------------------------------------
" ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

" [ YANKSTACK ]
    " keys to trigger yankstack
    let g:yankstack_yank_keys = ['y', 'd']

    " initialization
    call yankstack#setup()


" [ CTRL-P ]
    " open new files in current window
    let g:ctrlp_open_new_file = 'r'

    " ignore certain file types
    let g:ctrlp_custom_ignore = 'pyc\|ds_store\|git|CACHE/'

    " ctrlp-cmatcher
    let g:ctrlp_match_func = {'match': 'matcher#cmatch' }

    " ignore node_modules and other common useless files
    let g:ctrlp_custom_ignore = '\v[\/](node_modules)|(\.(swp|ico|git|svn))$'

" [ YCM ]
    " ycm stuff
    let g:ycm_filepath_completion_use_working_dir = 1
    let g:ycm_python_binary_path = '/usr/local/bin/python3'
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_autoclose_preview_window_after_insertion = 1

    " fix YCM status annoyances
    set shortmess+=c


" [ SYNTASTIC ]
    " syntastic recommended settings
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:syntastic_javascript_checkers = ['eslint']

    let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [],'passive_filetypes': ['html', 'js'] }

" [ OTHER ]
    " [ javascript-libraries-syntax ]
        let g:used_javascript_libs = 'react, angularjs'

    " [ vim-jsx ] 
        " use for js files too
        let g:jsx_ext_required = 0

    " [ ag.vim ] 
        " turn off auto preview
        cabbrev Ag Ag!

    " [ vim-closetag ]
        let g:closetag_filenames = "*.html,*.js,*.jsx"

    " [ auto-pairs ]
        " remove autopairs shortcut to be compatible with yankstack
        let g:AutoPairsShortcutToggle = ''
        " fix annoyance
        let g:AutoPairsOnlyWhitespace = 1

    " [ NERDTree ]
        " ignore files
        let NERDTreeIgnore = ['\.pyc$']

    " [ vim-notes stuff ]
        let g:notes_directories = ['~/Dropbox/vim notes']
        let g:notes_suffix = '.txt'

    " [ sneak ]
        " insensitive case
        let g:sneak#use_ic_scs = 1

    " [ colorizer ]
        let g:colorizer_auto_filetype='css,html'



" ____________________________________________________________________
" VIM OPTIONS (-------------------------------------------------------
" ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

syntax enable           " enable syntax processing

colorscheme solarized
set background=light
let g:solarized_termcolors=256

set relativenumber

set ignorecase          " case insensitive search unless 
set smartcase           " search includes a capital letter

set laststatus=2
set statusline=%f       " display filename in status bar

set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set incsearch           " search as characters are entered

set number              " line numbers

set clipboard=unnamed

" indentation
set shiftwidth=4
set tabstop=4 " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces

" allow buffers to be unsaved in the background
set hidden

" don't beep at me!
set visualbell
set noerrorbells

" backspace over autoindent, line breaks, start of insert (see :help 'backspace')
set backspace=indent,eol,start

" number of lines to see above and below the cursor
" set scrolloff=8

" set central swp files location
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" folds open by default
set foldlevelstart=999

" fix option key
if has("gui_macvim")
    set macmeta
end

" ____________________________________________________________________
" AUTOCMD (-----------------------------------------------------------
" ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

" js indentation
autocmd Filetype javascript,jsx setlocal shiftwidth=4 tabstop=4 softtabstop=4

" detect json files correctly
autocmd BufRead,BufNewFile *.json set filetype=json

" disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" source vim on save
autocmd! bufwritepost $MYVIMRC source %

" " use js syntax highlighting for json
" autocmd BufNewFile,BufRead *.json set ft=javascript


" ____________________________________________________________________
" ALIASES/FUNCTIONS (-------------------------------------------------
" ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

" aliases for myvimrc
command! Editvim :tabe $MYVIMRC
command! Editzsh :tabe ~/.zshrc
command! Sourcevim :source $MYVIMRC

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


" ____________________________________________________________________
" KEY MAPPINGS (------------------------------------------------------
" ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

" set leader to spacebar
let mapleader = "\<space>"

" when searching, center result in screen
nnoremap n nzz
nnoremap N Nzz

" easier command entering
nnoremap <leader>; :

" ctrl p stuff
nnoremap <leader>o :CtrlP<cr>
nnoremap <leader>p :CtrlPMRU<cr>

" ag
nnoremap <leader>a :Ag!<space>

" toggle gundo
nnoremap <leader>u :GundoToggle<cr>

" save
nnoremap <leader>w :w<cr>

" alternate file
nnoremap <leader>r <c-^>

" nerdtree toggle
nnoremap <leader>n :NERDTreeToggle<cr>

" copy line no. + file name
nnoremap <leader>cfn :let @*=expand("%").":".line(".")<cr>

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" move between splits
map <leader>h :wincmd h<cr>
map <leader>j :wincmd j<cr>
map <leader>k :wincmd k<cr>
map <leader>l :wincmd l<cr>

" remap for emmet
" nnoremap <leader>e <c-y>

" toggle syntastic, check on <leader>e
nnoremap <Leader>e :SyntasticToggleMode<CR>

" ____________________________________________________________________
" ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
