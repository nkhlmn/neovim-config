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
    lualine_z = { 'tabs' }
  }
})
