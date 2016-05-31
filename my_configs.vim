" ~/.vim_runtime/my_configs.vim for: https://github.com/amix/vimrc

" I actually like backslash over comma for leader
let mapleader="\\"

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
" :t - Tail of the file name (last component of the name) - :help filename-modifiers
let g:airline#extensions#tabline#fnamemod = ':t'

" switching to the previously edited buffer
map <leader>1 :b#<CR>
au FileType python map <buffer> <leader>1 :b#<CR>
" switch to previous buffer
map <leader>2 :bprev<CR>
au FileType python map <buffer> <leader>2 :bprev<CR>
" switch to next buffer
map <leader>3 :bnext<CR>
" delete buffer
map <leader>4 :bd<CR>

" display line numbers
set number
" toggle line numbers
nmap <C-N><C-N> :set invnumber<CR>

autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
