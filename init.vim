source ~/.config/nvim/vimscript/plugins.vim
source ~/.config/nvim/vimscript/tagbar.vim
source ~/.config/nvim/vimscript/keymap.vim
source ~/.config/nvim/vimscript/rainbow.vim
source ~/.config/nvim/vimscript/NerdTree.vim
source ~/.config/nvim/vimscript/coc.vim
source ~/.config/nvim/vimscript/codeforces.vim
source ~/.config/nvim/vimscript/autowindowsize.vim 
source ~/.config/nvim/vimscript/dbg.vim
source ~/.config/nvim/vimscript/pyrun.vim
source ~/.config/nvim/vimscript/templates.vim

colo onedark

let g:mapleader = "\<Space>"
let g:maplocalleader = ","


lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
   -- refer to the configuration section below
  }
EOF

set nu
let g:closer_no_mappings=0
set relativenumber
set so=5
set timeoutlen=500 "for leader key
set autoread
set updatetime=200
au CursorHold * checktime  
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime



"Floaterm
let g:floaterm_autoinsert=1
let g:auto_save = 1 
let g:auto_save_silent = 1
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

"Lazygit
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
