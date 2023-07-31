return {
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        char = '¦',
        buftype_exclude = {
          'terminal',
          'nofile',
          'quickfix',
        },
        filetype_exclude = {
          'gitcommit',
          'git',
          'fugitive',
          'help',
          'packer',
          'lazy',
          'lsp-installer',
          'mason',
          'lspsagafinder',
          'lspinfo',
          'checkhealth',
          'man',
          'prompt',
          '',
        },
        show_current_context = true,
        show_current_context_start = true,
        context_char = '¦',
      })
    end,
  },

  { 'stevearc/dressing.nvim' },

  { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons' } },

  {
    'rcarriga/nvim-notify',
    config = function()
      local notify = require('notify')
      notify.setup({
        stages = 'static'
      })
      vim.notify = notify
    end,
  },

  {
    'akinsho/bufferline.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup()
    end,
  },
}
