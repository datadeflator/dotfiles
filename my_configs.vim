" ~/.vim_runtime/my_configs.vim for: https://github.com/amix/vimrc

" I actually like backslash over comma for leader
let mapleader="\\"

" redefined from vimrcs/filetypes.vim due to switching buffers resetting folding
function! JavaScriptFold()
endfunction

" <leader>t instead of <c-f> so latter can page down
let g:ctrlp_map = '<leader>t'
" https://github.com/kien/ctrlp.vim/issues/58#issuecomment-42743551
let g:ctrlp_custom_ignore = '\v[\/](node_modules)|(\.(DS_Store|git|coffee|beam))$'
" restore <c-b> for page up
unmap <c-b>

" https://stackoverflow.com/questions/21945700/vim-autocommand-on-buffer-load-file-open
autocmd BufReadPre,FileReadPre * :set showtabline=0

" stop highlighting search matches
nnoremap <leader><space> :nohlsearch<CR>

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

let g:syntastic_java_checkers=['']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exec = './node_modules/.bin/eslint'
let g:syntastic_typescript_checkers=['eslint']
let g:syntastic_typescript_eslint_exec = './node_modules/.bin/eslint'

" git blame
map <leader>g :Gblame<CR>

" https://github.com/itchyny/lightline.vim/issues/87
let g:lightline = {
  \ 'active': {
  \   'left': [['mode', 'paste'], ['fugitive', 'readonly', 'relativepath', 'modified']],
  \   'right': [['lineinfo'], ['percent']]
  \ },
  \ 'component_function': {
  \   'fugitive': 'fugitive#head'
  \ }
  \ }


" Plugins to clone into ~/.vim_runtime/my_plugins
" https://github.com/ekalinin/Dockerfile.vim
" https://github.com/elixir-editors/vim-elixir
" https://github.com/ludovicchabant/vim-gutentags
" https://github.com/weynhamz/vim-plugin-minibufexpl
