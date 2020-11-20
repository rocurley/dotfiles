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
" Plug 'ap/vim-css-color' " unaccpetable performence degredation with large
" folds

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
Plug 'w0rp/ale'

Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'cespare/vim-toml'

Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'psf/black', { 'branch': 'stable' }
Plug 'fatih/vim-go'
Plug 'briancollins/vim-jst'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()
" }}}
" ALE {{{
let g:ale_linter_aliases = {'scratch': 'python'}
let g:ale_sign_column_always = 1
let g:ale_linters = {
      \'python': ['flake8'],
      \'javascript': ['flow'],
      \'sql': ['sqlint'],
      \ }
let ale_go_golangci_lint_options = '--fast'
let  g:ale_go_golangci_lint_package = 1
" This is swapped from what I'd like, but FZF will only use quickfix.
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}
" Javascript {{{
let g:javascript_plugin_flow = 1
" }}}
" Python {{{
autocmd BufWritePre *.py execute ':Black'
" }}}
" Colorscheme {{{
set t_Co=256
colorscheme wombat256mod
" }}}
" Language Client{{{
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rust-analyzer'],
    \ 'python': ['pyls'],
    \ 'go': ['gopls'],
    \ 'ruby': ['solargraph', 'stdio'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'typescriptreact': ['javascript-typescript-stdio'],
    \ 'haskell': ['hie-wrapper'],
    \ }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_diagnosticsEnable = 1
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_diagnosticsList = "Location"
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log') 
let g:LanguageClient_settingsPath = "~/.vim/settings.json"
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
" Deoplete {{{
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', {
\ 'go': '[^. *\t]\.\w*',
\})
" }}}
" FzF {{{
" let g:fzf_command_prefix = 'Fz'
" }}}
" Prettier {{{
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
" }}}
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" EasyAlign {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" Non-plugin settings {{{
set shiftwidth=2
set tabstop=2
set expandtab
set ai
syntax on
if has('nvim')
  set inccommand=split
endif
if !has('nvim')
  set ttymouse=xterm2
endif
set mouse=a
let g:python3_host_prog = '/usr/bin/python3'
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set guicursor=
au BufRead,BufNewFile *.avsc setfiletype json
if has('nvim-0.3.2') || has("patch-8.1.0360")
  set diffopt=filler,internal,algorithm:histogram,indent-heuristic
endif
set hlsearch
" }}}
if filereadable(expand("~/.vim/work.vimrc"))
  source ~/.vim/work.vimrc
endif
