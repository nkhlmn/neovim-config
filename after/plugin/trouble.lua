local map = vim.api.nvim_set_keymap

require"trouble".setup{}

map('n', '<leader>gt', ':TroubleToggle<cr>', { silent = true, noremap = true })
