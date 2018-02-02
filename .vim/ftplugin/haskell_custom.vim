" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:ycm_semantic_triggers = {'haskell' : ['.']}
" Too slow to be tolerable everytime you type.
" let g:ycm_semantic_triggers = {'haskell' : ['.', 're!\s\w', 're!^\w']}
let g:necoghc_enable_detailed_browse = 1

nnoremap <silent> <leader>ht :GhcModType<cr>
nnoremap <silent> <leader>hw :GhcModTypeInsert<cr>
nnoremap <silent> <leader><cr> :noh<cr>:GhcModTypeClear<cr>
nnoremap <silent> <leader>hs :GhcModSplitFunCase<cr>
