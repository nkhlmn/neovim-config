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
  use { 'wbthomason/packer.nvim' }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    'simrat39/rust-tools.nvim',
    'nanotee/sqls.nvim',
  }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-calc',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  }

  -- Misc
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'windwp/nvim-autopairs' }
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
  use { 'rcarriga/nvim-notify' }
  use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'mattn/emmet-vim' }
  use { 'chrisbra/csv.vim' }
  use { 'sbdchd/neoformat' }
  use { 'akinsho/nvim-toggleterm.lua' }
  use { 'kristijanhusak/vim-dadbod-ui', requires = 'vim-dadbod' }

  -- tpope
  use {
    'tpope/vim-fugitive',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'tpope/vim-unimpaired',
  }

  -- Colorschemes
  use {
    'sainnhe/gruvbox-material',
    'sainnhe/everforest',
    'sainnhe/sonokai',
    'ajh17/Spacegray.vim',
    'rebelot/kanagawa.nvim',
  }

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end

require('packer').startup(on_startup)
