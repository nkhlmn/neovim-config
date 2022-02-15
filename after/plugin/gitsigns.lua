require('gitsigns').setup()

vim.api.nvim_set_keymap('n', '[g', ':Gitsigns prev_hunk<CR>', { silent = true })
vim.api.nvim_set_keymap('n', ']g', ':Gitsigns next_hunk<CR>', { silent = true })
