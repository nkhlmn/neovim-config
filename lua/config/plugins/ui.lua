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
            'prompt',
            '',
          },
        },
        scope = { show_start = false, show_end = false }
      })
    end,
  },

  { 'stevearc/dressing.nvim' },

  { 'nvim-lualine/lualine.nvim' },
}
