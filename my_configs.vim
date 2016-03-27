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

" https://github.com/vim-airline/vim-airline#smarter-tab-line
let g:airline#extensions#tabline#enabled = 1
" configure whether buffer numbers should be shown
let g:airline#extensions#tabline#buffer_nr_show = 1

autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
