" vim-latex-suite defaults {{{
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

let g:Tex_DefaultTargetFormat='pdf'

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" " of indentation.
set shiftwidth=2
set tabstop=2
set expandtab
set ai
" " TIP: if you write your \label's as \label{fig:something}, then if you
" " type in \ref{fig: and press <C-n> you will automatically cycle through
" " all the figure labels. Very useful!
" set iskeyword+=:
"
"
" }}}
"
syntax on

" vim-plug {{{
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/wombat256.vim'

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
" Plug 'w0rp/ale', { 'for': 'haskell' }

Plug 'cespare/vim-toml'

Plug 'rust-lang/rust.vim', {'for': 'rust'}

Plug 'Valloric/YouCompleteMe', {'for': ['rust', 'haskell']}

call plug#end()
" }}}

" Colorscheme {{{
set t_Co=256
colorscheme wombat256mod
" }}}
" YCM {{{
command GoDef YcmCompleter GoTo
let g:ycm_server_keep_logfiles = 1
" }}}
" Syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}
" Non-plugin settings {{{
set ttymouse=xterm2
set mouse=a
" }}}
