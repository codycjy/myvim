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
autocmd filetype cpp map <buffer> <leader>rr :call Codeforces() <cr>
autocmd filetype cpp map <buffer> <leader>rd :call DbgCpp()<cr> <Plug>VimspectorContinue() <cr>
autocmd filetype python map <buffer> <leader>rr :sp<cr> <c-w>j :resize -10<cr> :term python3 % <cr>

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


" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Optimize
nnoremap gg gg^
nnoremap <leader>xa ggdG
" Using Lua functions
"nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
"nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
