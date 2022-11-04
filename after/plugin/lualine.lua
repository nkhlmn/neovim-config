local utils = require('config.utils')

require('lualine').setup({
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode', utils.get_visual_lines_count },
    lualine_c = {
      'filename',
      '%=',
      utils.get_attached_lsp_servers,
    },
    lualine_x = { 'searchcount', 'encoding', 'fileformat', 'filetype' },
  },
  winbar = {
    lualine_b = { require('nvim-navic').get_location },
    lualine_y = { { 'filename', path = 1 } },
  },
  inactive_winbar = {
    lualine_b = { require('nvim-navic').get_location },
    lualine_y = { { 'filename', path = 1 } },
  },
})

