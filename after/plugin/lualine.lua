local utils = require('config.utils')

require('lualine').setup({
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str)
          return str:sub(1, 1)
        end,
      },
      utils.get_visual_lines_count,
    },
  },
  winbar = {
    lualine_c = { { 'filename', path = 3 } },
  },
  inactive_winbar = {
    lualine_c = { { 'filename', path = 3 } },
  },
  tabline = {
    lualine_a = { 'buffers' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'tabs' }
  }
})
