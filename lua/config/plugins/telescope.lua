return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = 'nvim-lua/plenary.nvim',
  },
  { 'nvim-telescope/telescope-file-browser.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}
