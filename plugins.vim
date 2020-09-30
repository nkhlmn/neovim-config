" Install vimplug if it isn't already
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged') " Start loading plugins

"---------- LSP -----------"
Plug 'neovim/nvim-lspconfig' " Collection of common configurations for the Nvim LSP client
Plug 'tjdevries/lsp_extensions.nvim' " Extensions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/completion-nvim' " Autocompletion framework for built-in LSP
Plug 'nvim-lua/diagnostic-nvim' " Diagnostic navigation and settings for built-in LSP

"---------- Misc ----------"
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'chrisbra/csv.vim' 
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"---------- tpope ----------"
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

"------ Colorschemes ------"
Plug 'ajh17/Spacegray.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'nanotech/jellybeans.vim' 
Plug 'ayu-theme/ayu-vim' 

call plug#end() " End loading plugins
