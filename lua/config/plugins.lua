local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local function on_startup(use)
  use({
    -- Packer
    { 'wbthomason/packer.nvim' },
    { 'lewis6991/impatient.nvim' },

    -- LSP
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'simrat39/rust-tools.nvim' },
    { 'nanotee/sqls.nvim' },
    {
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
        local null_ls = require('null-ls')
        null_ls.setup({
          sources = {
            null_ls.builtins.diagnostics.selene,
          },
        })
      end,
    },

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
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },

    -- Misc
    { 'SmiteshP/nvim-navic', requires = 'neovim/nvim-lspconfig' },
    { 'stevearc/dressing.nvim' },
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } },
    {
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('bufferline').setup()
      end,
    },
    { 'lewis6991/gitsigns.nvim' },
    { 'lukas-reineke/indent-blankline.nvim' },
    {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup()
      end,
    },
    {
      'kylechui/nvim-surround',
      config = function()
        require('nvim-surround').setup()
      end,
    },
    {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end,
    },
    {
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('trouble').setup()
      end,
    },
    {
      'folke/which-key.nvim',
      config = function()
        require('which-key').setup()
      end,
    },
    {
      'rcarriga/nvim-notify',
      config = function()
        vim.notify = require('notify')
      end,
    },
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

    -- Personal
    { 'nkhlmn/spectur.nvim' },
    {
      'nkhlmn/gore.nvim',
      config = function()
        require('gore').setup({
          categories = vim.g.local_gore_categories or {},
        })
      end,
    },
    {
      'nkhlmn/contemplate.nvim',
      config = function()
        require('contemplate').setup({
          temp_folder = '~/development/sandbox/',
          entries = vim.g.local_contemplate_entries or {},
        })
      end,
    },
  })

  local local_plugins = vim.g.local_plugins
  if local_plugins ~= nil then
    for _, val in ipairs(local_plugins) do
      use({ val })
    end
  end

  if packer_bootstrap then
    require('packer').sync()
  end
end

return require('packer').startup(on_startup)
