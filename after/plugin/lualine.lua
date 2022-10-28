require('lualine').setup({
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'searchcount', 'encoding', 'fileformat', 'filetype' },
  },
})
