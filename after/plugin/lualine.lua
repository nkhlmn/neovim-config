require('lualine').setup {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  },
  sections = {
    lualine_c = { require('config.utils').get_attached_lsp_servers },
  },
}
