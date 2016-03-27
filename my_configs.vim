" ~/.vim_runtime/my_configs.vim for: https://github.com/amix/vimrc

" redefined from vimrcs/filetypes.vim due to switching buffers resetting folding
function! JavaScriptFold()
endfunction

" <leader>t instead of <c-f> so latter can page down
let g:ctrlp_map = '<leader>t'
" restore <c-b> for page up
unmap <c-b>

" stop highlighting search matches
nnoremap <leader><space> :nohlsearch<CR>
