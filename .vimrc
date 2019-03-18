filetype plugin indent on
set nocompatible

" vim-plug {{{
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/wombat256.vim'

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/vim-easy-align'
Plug 'wsdjeg/vim-fetch'

Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'w0rp/ale', {'for': 'javascript'}

Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }

Plug 'cespare/vim-toml'

Plug 'rust-lang/rust.vim', {'for': 'rust'}

Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}

Plug 'pangloss/vim-javascript'
Plug 'briancollins/vim-jst'
Plug 'mxw/vim-jsx'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()
" }}}

" ALE {{{
let g:ale_linter_aliases = {'scratch': 'python'}
let g:ale_sign_column_always = 1
let g:ale_linters = {
      \'python': ['flake8'],
      \'javascript': ['flow']
      \ }
"let g:ale_set_quickfix = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}

" Javascript {{{
let g:javascript_plugin_flow = 1
" }}}

" Colorscheme {{{
set t_Co=256
colorscheme wombat256mod
" }}}
" Language Client{{{
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'python': ['pyls'],
    \ }
"\ 'javascript': ['/home/rcurley/.yarn/bin/flow-language-server', '--stdio'],
"\ 'javascript.jsx': ['/home/rcurley/.yarn/bin/flow-language-server', '--stdio'],
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
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Non-plugin settings {{{
set shiftwidth=2
set tabstop=2
set expandtab
set ai
syntax on
if !has('nvim')
  set ttymouse=xterm2
endif
set mouse=a
let g:python3_host_prog = '/home/rcurley/.pyenv/versions/3.6.7/bin/python'
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set guicursor=
" }}}
source ~/.vim/work.vimrc

