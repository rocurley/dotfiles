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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'w0rp/ale'

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
Plug 'inkarkat/vim-ingo-library'
Plug 'xolox/vim-misc'
Plug 'inkarkat/vim-AdvancedDiffOptions'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
Plug 'lbrayner/vim-rzip'
Plug 'jparise/vim-graphql'
Plug 'vim-latex/vim-latex', {'for': ['latex', 'tex']}
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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> <C-k> :call CocAction('diagnosticNext')<cr>
nmap <silent> <C-j> :call CocAction('diagnosticPrevious')<cr>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']
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
" Clipboard {{{
if exists('$TMUX')
  autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '+' | OSCYankReg + | endif
endif
" }}}
" Non-plugin settings {{{
set shiftwidth=2
set tabstop=2
set softtabstop=2
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
" if has('nvim-0.3.2') || has("patch-8.1.0360")
  " set diffopt=filler,internal,algorithm:histogram,indent-heuristic
" endif
set hlsearch
set nu
" }}}
if filereadable(expand("~/.vim/work.vimrc"))
  source ~/.vim/work.vimrc
endif
