return {
  { 'stevearc/dressing.nvim' },

  {
    'nvim-lualine/lualine.nvim',
    opts = {
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
      },
    },
  },
}
