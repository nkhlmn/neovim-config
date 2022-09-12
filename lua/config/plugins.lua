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
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'simrat39/rust-tools.nvim' },
    { 'nanotee/sqls.nvim' },
    { 'glepnir/lspsaga.nvim', branch = 'main', config = function() require'lspsaga'.init_lsp_saga() end },

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
    { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },

    -- Misc
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } },
    { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons', config = function() require'bufferline'.setup() end },
    { 'lewis6991/gitsigns.nvim' },
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'windwp/nvim-autopairs', config = function() require'nvim-autopairs'.setup() end },
    { 'kylechui/nvim-surround', config = function() require'nvim-surround'.setup() end },
    { 'numToStr/Comment.nvim', config = function() require'Comment'.setup() end },
    { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons', config = function() require'trouble'.setup() end },
    { 'rcarriga/nvim-notify' },
    { 'mattn/emmet-vim' },
    { 'chrisbra/csv.vim' },
    { 'sbdchd/neoformat' },

    -- tpope
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-repeat' },
    { 'tpope/vim-unimpaired' },
    { 'tpope/vim-abolish' },
    { 'kristijanhusak/vim-dadbod-ui', requires = 'tpope/vim-dadbod' },

    -- Colorschemes
    { 'sainnhe/gruvbox-material' },
    { 'sainnhe/everforest' },
    { 'sainnhe/sonokai' },
    { 'ajh17/Spacegray.vim' },
    { 'rebelot/kanagawa.nvim' },
  }

  local local_plugins = vim.g.local_plugins
  if local_plugins ~= nil then
    for _, val in ipairs(local_plugins) do
      use { val }
    end
  end

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end

require('packer').startup(on_startup)
