require('indent_blankline').setup {
  char = '¦',
  buftype_exclude = { 'terminal' },
  filetype_exclude = { 'gitcommit', 'fugitive', 'help', 'packer', 'lsp-installer', 'mason.nvim' },
  show_current_context = true,
  context_char = '¦',
}
