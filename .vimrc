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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }

Plug 'cespare/vim-toml'

Plug 'rust-lang/rust.vim', {'for': 'rust'}

call plug#end()
" }}}

" Colorscheme {{{
set t_Co=256
colorscheme wombat256mod
" }}}
" Language Client{{{
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }
command LCinfo call LanguageClient_textDocument_hover()
command LCdefinition  call LanguageClient_textDocument_definition()
command LCimplementation call LanguageClient_textDocument_implementation()
command LCrename call LanguageClient_textDocument_rename()
command LCsymbols call LanguageClient_textDocument_documentSymbol()
command LCreferences call LanguageClient_textDocument_references()
command LCformat call LanguageClient_textDocument_formatting()
" command LCformat call LanguageClient_textDocument_rangeFormatting()
" command LCsymbols LanguageClient_workspace_symbol()
" }}}
let g:deoplete#enable_at_startup = 1
" Non-plugin settings {{{
if !has('nvim')
  set ttymouse=xterm2
endif
set mouse=a
" }}}
