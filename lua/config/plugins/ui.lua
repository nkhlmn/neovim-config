return {
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function ()
      require('ibl').setup({
        indent = {
          char = '¦',
        },
        exclude = {
          filetypes = {
            'lspinfo',
            'packer',
            'checkhealth',
            'help',
            'man',
            'gitcommit',
            'git',
            'TelescopePrompt',
            'TelescopeResults',
            'fugitive',
            'lazy',
            'mason',
            'lspsagafinder',
            'prompt',
            '',
          },
        },
      })
    end,
  },

  { 'stevearc/dressing.nvim' },

  { 'nvim-lualine/lualine.nvim' },

  {
    'rcarriga/nvim-notify',
    config = function ()
      local notify = require('notify')
      notify.setup({
        stages = 'static',
        render = 'minimal'
      })
      vim.notify = notify
    end,
  },
}
