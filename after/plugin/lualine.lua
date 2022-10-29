require('lualine').setup({
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_c = { '%=', require('config.utils').get_attached_lsp_servers },
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
