noremap <F3> :NERDTreeToggle<CR> 
let g:mapleader=" "
let g:floaterm_keymap_toggle ='<F1>'
let g:floaterm_keymap_prev ='<F2>'
map <leader>wh <c-w>h
map <leader>wl <c-w>l
map <leader>wj <c-w>j
map <leader>wk <c-w>k
map <leader>wc :bd<cr>
"nnoremap <silent> <Leader>b :Buffers<CR>
"nnoremap <silent> <Leader>f :Files<CR>
set mouse=a
map <leader>f :Files<cr>
map <silent><leader>ww :vertical resize+10 <cr>
map <silent><leader>wn :vertical resize-10 <cr>
map <silent><leader>wsd :vertical resize+60 <cr>
"win<<silent> size default
map <silent><leader>vs :vsp <cr> 
map <leader>rc :call Codeforces() <cr>
map <leader>rdc :call DbgCpp()<cr> <Plug>VimspectorContinue() <cr>
map <leader>rpi :call Pyrun()<cr>
map <leader>rpn :call PyrunNoinput()<cr>

map <silent><leader>tc :tabclose<cr>
map <silent><leader>ssss :source ~/.config/nvim/init.vim<cr>

nmap <silent><Leader>db <Plug>VimspectorBreakpoints
nmap <Leader>di <Plug>VimspectorBalloonEval
xmap <Leader>di <Plug>VimspectorBalloonEval
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

nmap <leader>ta :TagbarToggle<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
