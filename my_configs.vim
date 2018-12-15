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

" git blame
map <leader>g :Gblame<CR>

" https://github.com/flowtype/vim-flow/issues/24
" https://github.com/flowtype/vim-flow/issues/60
"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

" https://github.com/flowtype/vim-flow
let g:flow#enable = 1
let g:flow#autoclose = 1

" flow coverage for current file
map <leader>f :echo system("./node_modules/.bin/flow coverage " . expand("%:p"))<CR>

" NOTE: using danihodovic's fix-error-format branch (https://github.com/flowtype/vim-flow/issues/11) + below patch
" diff --git i/plugin/flow.vim w/plugin/flow.vim
" index 208040b..67ef4b5 100644
" --- i/plugin/flow.vim
" +++ w/plugin/flow.vim
" @@ -85,14 +85,16 @@ function! Format_json_error_msg(error)
"         \)
"   " The error message is most informative when all the message.descr are concatenated
"   for message in a:error.message
"     let str .= {+message.context . ' ' .+} message.descr . ' '
"   endfor
"   return str
" endfunction
" 
" " Main interface functions.
" function! flow#typecheck()
"   let {+command = g:flow#flowpath . ' --json'+}
" {+  let output = system(command)+}
" {+  "let+} output = system('flow --json')
"   let dict = json_decode(output)
" 
"   let lines = []
" @@ -119,6 +121,8 @@ function! flow#typecheck()
"     endif
" 
"     let &errorformat = old_errorformat
"   {+else+}
" {+    cclose+}
"   endif
" endfunction

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


" Plugins to clone into ~/.vim_runtime/sources_non_forked
" https://github.com/danihodovic/vim-flow/
" https://github.com/weynhamz/vim-plugin-minibufexpl
