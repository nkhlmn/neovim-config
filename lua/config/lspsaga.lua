local vim = vim
local api = vim.api

local saga = require 'lspsaga'
saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc<cr>', { silent = true, noremap = true })
api.nvim_set_keymap('n', 'gs', ':Lspsaga signature_help<cr>', { silent = true, noremap = true })
api.nvim_set_keymap('n', 'gh', ':Lspsaga lsp_finder<cr>', { silent = true, noremap = true })
api.nvim_set_keymap('n', 'gd', ':Lspsaga preview_definition<cr>', { silent = true, noremap = true })
api.nvim_set_keymap('n', 'gr', ':Lspsaga rename<cr>', { silent = true, noremap = true })
api.nvim_set_keymap('n', '<leader>cd', ':Lspsaga show_line_diagnostics<cr>', { silent = true, noremap = true })
api.nvim_set_keymap('n', '<leader>cc', ':Lspsaga show_cursor_diagnostics<cr>', { silent = true, noremap = true })
api.nvim_set_keymap('n', '[e', ':Lspsaga diagnostic_jump_prev<cr>', { silent = true, noremap = true })
api.nvim_set_keymap('n', ']e', ':Lspsaga diagnostic_jump_next<cr>', { silent = true, noremap = true })
