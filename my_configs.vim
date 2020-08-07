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

autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2

" git blame
" https://stackoverflow.com/a/53481161
function! s:ToggleGblame()
  if &l:filetype ==# 'fugitiveblame'
    close
  else
    Gblame
  endif
endfunction
map <leader>b :call <SID>ToggleGblame()<CR>

" https://github.com/itchyny/lightline.vim/issues/87
" https://github.com/maximbaz/lightline-ale#integration
let g:lightline = {
  \ 'active': {
  \   'left': [['mode', 'paste'], ['fugitive', 'readonly', 'relativepath', 'modified']],
  \   'right': [['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'], ['lineinfo'], ['percent']]
  \ },
  \ 'component_expand' :{
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_infos': 'lightline#ale#infos',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok'
  \ },
  \ 'component_function': {
  \   'fugitive': 'fugitive#head'
  \ },
  \ 'component_type': {
  \   'linter_checking': 'right',
  \   'linter_infos': 'right',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'right'
  \ }
  \ }


" https://www.rockyourcode.com/developing-with-elixir-in-vim/
let g:ale_elixir_elixir_ls_release = $HOME . '/workspace/elixir-ls/release'

let g:ale_linters = {
\   'elixir': ['elixir-ls'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}
let g:ale_fixers = {
\   'elixir': ['mix_format'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\}
let g:ale_elixir_elixir_ls_config = {
\   'elixirLS': {
\     'dialyzerEnabled': v:false,
\   },
\}

let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

noremap <Leader>s :ALEDetail<CR>
noremap <Leader>d :ALEHover<CR>
noremap <Leader>f :ALEFindReferences<CR>
noremap <Leader>g :ALEGoToDefinition<CR>
" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>


" https://medium.com/@chamilad/haproxy-config-syntax-highlighting-987fd9ca56be
au BufRead,BufNewFile haproxy* set ft=haproxy


" Plugins to clone into ~/.vim_runtime/my_plugins
" https://github.com/ekalinin/Dockerfile.vim
" https://github.com/elixir-editors/vim-elixir
" https://github.com/hashivim/vim-terraform
" https://github.com/jremmen/vim-ripgrep
" https://github.com/ludovicchabant/vim-gutentags (brew install ctags)
" https://github.com/maximbaz/lightline-ale
" https://github.com/pearofducks/ansible-vim
" https://github.com/tpope/vim-endwise
" https://github.com/weynhamz/vim-plugin-minibufexpl
