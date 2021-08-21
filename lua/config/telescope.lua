local vim = vim
local api = vim.api

api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>h', ':Telescope help_tags<cr>', { noremap = true })
api.nvim_set_keymap('n', '<C-b>', ':Telescope file_browser<cr>', { noremap = true })
api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<cr>', { noremap = true })
api.nvim_set_keymap('n', '<C-f>', ':Telescope live_grep<cr>', { noremap = true })

