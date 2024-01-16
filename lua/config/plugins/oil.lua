return {
  {
    'stevearc/oil.nvim',
    opts = {
      columns = { 'permissions', 'size', 'mtime' },
      keymaps = {
        ['<C-s>'] = false,
        ['<C-h>'] = false,
        ['<C-t>'] = false,
        ['<C-p>'] = false,
        ['<leader>v'] = 'actions.select_vsplit',
        ['<leader>s'] = 'actions.select_split',
        ['<leader>t'] = 'actions.select_tab',
        ['<leader>p'] = 'actions.preview',
      }
    },
  }
}
