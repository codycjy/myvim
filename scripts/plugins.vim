call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'sainnhe/everforest'
Plug 'navarasu/onedark.nvim'
Plug 'folke/which-key.nvim'
Plug 'github/copilot.vim'
Plug 'voldikss/vim-floaterm'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'fatih/vim-go'
" Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug '907th/vim-auto-save'
Plug 'vim-airline/vim-airline'       
Plug 'vim-airline/vim-airline-themes' "airline 的主题
Plug 'majutsushi/tagbar'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'puremourning/vimspector'
Plug 'preservim/nerdtree'
Plug 'tell-k/vim-autopep8'
Plug 'psliwka/vim-smoothie'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ggandor/leap.nvim'
Plug 'airblade/vim-gitgutter'
"Plug 'ActivityWatch/aw-watcher-vim' " cannot use in wsl
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'ryanoasis/vim-devicons'
call plug#end()

