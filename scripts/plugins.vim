call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'sainnhe/everforest'
Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }
Plug 'navarasu/onedark.nvim'
Plug 'folke/which-key.nvim'
Plug 'github/copilot.vim'
"Plug 'luozhiya/fittencode.nvim'
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
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope-dap.nvim'
"Plug 'puremourning/vimspector'
Plug 'preservim/nerdtree'
Plug 'tell-k/vim-autopep8'
Plug 'psliwka/vim-smoothie'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ggandor/leap.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'ActivityWatch/aw-watcher-vim'
Plug 'folke/todo-comments.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'
" Unit test
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-neotest/nvim-nio'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'nvim-neotest/neotest-go'
Plug 'nvim-neotest/neotest-python'
Plug 'nvim-neotest/neotest-plenary'
Plug 'alfaix/neotest-gtest'
Plug 'alepez/vim-gtest'
Plug 'nvim-neotest/neotest-vim-test'
" Debug DAP
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-dap-python'
Plug 'leoluz/nvim-dap-go'
" Go func
Plug 'buoto/gotests-vim'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'hiphish/rainbow-delimiters.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'APZelos/blamer.nvim'
" LeetCode
" kawre/leetcode.nvim
Plug 'kawre/leetcode.nvim', { 'do': ':TSUpdate html' }

" Dependencies
Plug 'MunifTanjim/nui.nvim'

" Optional dependencies
Plug 'rcarriga/nvim-notify'
Plug 'nvim-tree/nvim-web-devicons'
" Yazi Config
Plug 'mikavilpas/yazi.nvim'
call plug#end()

