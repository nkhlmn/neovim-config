vim.cmd[[

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged') " Start loading plugins

"---------- LSP -----------"
Plug 'neovim/nvim-lspconfig'            " Collection of common configurations for the Nvim LSP client
Plug 'hrsh7th/nvim-compe'               " Autocompletion framework for built-in LSP
Plug 'kabouzeid/nvim-lspinstall'          " Auto install language servers
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/rust-tools.nvim'

"---------- Misc ----------"
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'            " Status line customization
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'             " Collection of language packs 
Plug 'chrisbra/csv.vim' 
Plug 'sbdchd/neoformat'                 " Run code formatting for various languages
Plug 'jiangmiao/auto-pairs'             " Auto insert brackets and quotes
Plug 'akinsho/nvim-toggleterm.lua'

"---------- tpope ----------"
Plug 'tpope/vim-commentary'             " Toggle commenting out lines
Plug 'tpope/vim-fugitive'               " Git wrapper
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'                " Netrw improvements

"------ Colorschemes ------"
Plug 'ajh17/Spacegray.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'ayu-theme/ayu-vim' 
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

call plug#end() " End loading plugins
]]
