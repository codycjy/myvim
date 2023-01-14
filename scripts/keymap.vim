set rnu
set nu
let g:mapleader=" "
set colorcolumn=80

" let g:floaterm_keymap_new    = '<F6>'
" let g:floaterm_keymap_prev   = '<F7>'
" let g:floaterm_keymap_next   = '<F8>'
let g:floaterm_keymap_toggle = '<F2>'

" nnoremap   <silent>   <F6>    :FloatermNew<CR>
" tnoremap   <silent>   <F6>    <C-\><C-n>:FloatermNew<CR>
" nnoremap   <silent>   <F7>    :FloatermPrev<CR>
" tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermPrev<CR>
" nnoremap   <silent>   <F8>    :FloatermNext<CR>
" tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F2>   :FloatermToggle<CR>
tnoremap   <silent>   <F2>   <C-\><C-n>:FloatermToggle<CR>

set mouse=a

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ft <cmd>TodoTelescope keywords=TODO,FIX<cr>

" Tagbar
" nmap <F7> :TagbarToggle<CR> "Disable because startup too long


" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" vim-go
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_variable_assignments =1
" let g:go_highlight_variable_declarations =1
" let g:go_highlight_types= 1
" let g:go_highlight_function_parameters = 1
" let g:go_highlight_build_constraints = 1





" everforest
let g:everforest_background = 'hard'

" vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" nerdtree
nnoremap <silent> <F3> :NERDTreeToggle<CR>

"Autopep8
autocmd FileType python noremap <buffer> <leader>fp :call Autopep8()<CR>
let g:autopep8_disable_show_diff=1

"fzf
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right,50%', 'ctrl-/']

" Preview window is hidden by default. You can toggle it with ctrl-/.
" It will show on the right with 50% width, but if the width is smaller
" than 70 columns, it will show above the candidate list
let g:fzf_preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []

" leam.nvim
lua require('leap').add_default_mappings()


" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(12)<CR>
inoremap <A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>


" todo-comments
lua << EOF
  require("todo-comments").setup {
  }
EOF

set guifont=DroidSansMono\ Nerd\ Font\ 11
let g:airline_powerline_fonts = 1
