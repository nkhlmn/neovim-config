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

  {
    'nvim-lualine/lualine.nvim',
    config = function ()
      require('lualine').setup({
        options = {
          icons_enabled = false,
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          globalstatus = true,
        },
        winbar = {
          lualine_c = { { 'filename', path = 3 } },
        },
        inactive_winbar = {
          lualine_c = { { 'filename', path = 3 } },
        },
        tabline = {
          lualine_c = { 'buffers' },
          lualine_x = { vim.loop.cwd },
          lualine_z = { 'tabs' }
        }
      })
    end
  },
}
