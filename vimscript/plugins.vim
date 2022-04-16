call plug#begin('~/.nvim/plugged')
Plug 'Yggdroot/indentLine'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'       
Plug 'vim-airline/vim-airline-themes' "airline 的主题
Plug 'luochen1990/rainbow'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug '907th/vim-auto-save'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'akinsho/toggleterm.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'kdheepak/lazygit.nvim'
Plug 'folke/which-key.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'puremourning/vimspector'
Plug 'michaelb/sniprun'
Plug 'navarasu/onedark.nvim'
Plug 'thinca/vim-quickrun'
Plug 'github/copilot.vim'
Plug 'tibabit/vim-templates'
call plug#end()

