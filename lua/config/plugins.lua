local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end

local function on_startup(use)
  use {
    -- Packer
    { 'wbthomason/packer.nvim' },

    -- LSP
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/nvim-lsp-installer' },
    { 'simrat39/rust-tools.nvim' },
    { 'nanotee/sqls.nvim' },

    -- Completion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-calc' },
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },
    { 'hrsh7th/vim-vsnip-integ' },

    -- Telescope
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },

    -- Misc
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } },
    { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' },
    { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' },
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'windwp/nvim-autopairs' },
    { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end, },
    { 'rcarriga/nvim-notify' },
    { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' },
    { 'mattn/emmet-vim' },
    { 'chrisbra/csv.vim' },
    { 'sbdchd/neoformat' },
    { 'akinsho/nvim-toggleterm.lua' },

    -- tpope
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-repeat' },
    { 'tpope/vim-surround' },
    { 'tpope/vim-unimpaired' },
    { 'tpope/vim-dadbod' },
    { 'kristijanhusak/vim-dadbod-ui', requires = 'tpope/vim-dadbod' },

    -- Colorschemes
    { 'sainnhe/gruvbox-material' },
    { 'sainnhe/everforest' },
    { 'sainnhe/sonokai' },
    { 'ajh17/Spacegray.vim' },
    { 'rebelot/kanagawa.nvim' },
  }

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end

require('packer').startup(on_startup)
