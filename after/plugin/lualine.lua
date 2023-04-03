local utils = require('config.utils')
local navic = require('nvim-navic')

local navic_component = {
  function()
    return navic.get_location()
  end,
  cond = function()
    return navic.is_available()
  end,
}

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
    lualine_c = {
      '%=',
      navic_component,
    },
    lualine_x = { 'searchcount', 'encoding', 'fileformat', 'filetype' },
  },
  winbar = {
    lualine_c = { { 'filename', path = 3 } },
  },
  inactive_winbar = {
    lualine_c = { { 'filename', path = 3 } },
  },
})
