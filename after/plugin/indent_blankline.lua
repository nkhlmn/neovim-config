require('indent_blankline').setup({
  char = '¦',
  buftype_exclude = { 'terminal' },
  filetype_exclude = { 'gitcommit', 'git', 'fugitive', 'help', 'packer', 'lsp-installer', 'mason', 'lspsagafinder' },
  show_current_context = true,
  context_char = '¦',
})
