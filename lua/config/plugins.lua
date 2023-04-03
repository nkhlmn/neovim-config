local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
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
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.diagnostics.gitlint,
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.diagnostics.yamllint,
          null_ls.builtins.diagnostics.jsonlint,
          null_ls.builtins.code_actions.eslint_d,
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.formatting.prettierd,
        },
      })
    end,
  },

  -- Completion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-calc' },
  { 'hrsh7th/cmp-vsnip' },
  { 'hrsh7th/vim-vsnip' },
  { 'hrsh7th/vim-vsnip-integ' },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = 'nvim-lua/plenary.nvim',
  },
  { 'nvim-telescope/telescope-file-browser.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- Misc
  { 'SmiteshP/nvim-navic', dependencies = 'neovim/nvim-lspconfig' },
  { 'stevearc/dressing.nvim' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons' } },
  {
    'akinsho/bufferline.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
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
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end,
  },
  { 'mattn/emmet-vim' },
  { 'chrisbra/csv.vim' },
  { 'sbdchd/neoformat' },
  { 'danymat/neogen', dependencies = 'nvim-treesitter/nvim-treesitter', config = true },

  -- tpope
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-unimpaired' },
  { 'tpope/vim-abolish' },
  { 'kristijanhusak/vim-dadbod-ui', dependencies = 'tpope/vim-dadbod' },

  -- Colorschemes
  { 'sainnhe/gruvbox-material' },
  { 'sainnhe/everforest' },
  { 'sainnhe/sonokai' },
  { 'rebelot/kanagawa.nvim' },

  -- Personal
  { 'nkhlmn/spectur.nvim' },
  { 'nkhlmn/gore.nvim' },
  { 'nkhlmn/contemplate.nvim' },
}

local local_plugins = vim.g.local_plugins
if local_plugins ~= nil then
  vim.list_extend(plugins, local_plugins)
end

require('lazy').setup(plugins)
