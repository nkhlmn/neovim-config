local default_options = { silent = true, noremap = true }
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>xx', ':SqlsExecuteQuery<CR>', default_options)
