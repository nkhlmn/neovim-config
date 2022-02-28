local api = vim.api

local keymaps = {
  -- misc --
  { '', '<leader>`', ':tabnew $MYVIMRC<CR>' }, -- open init.lua
  { 'n', '<leader>xx', ':w|so%<CR>' }, -- source current file
  { 'n', '<F5>', ':!open %<CR>' }, -- Open current file with default program
  { 'n', 'Q', '<Nop>', {} }, -- prevent going into ex mode

  -- searching --
  { 'n', '*', '*N', {} }, -- keep cursor on first match when searching for word under cursor
  { 'n', '<ESC><ESC>', ':let @/ = ""<cr>' }, -- clear search by pressing esc twice

  -- splits --
  { 'n', '<leader>s', ':new<CR>' }, -- open horizontal split
  { 'n', '<leader>v', ':vnew<CR>' }, -- open vertical split

  -- buffers --
  { 'n', '<C-S>', ':w<CR>', {} }, -- write/save buffer
  { 'n', 'ZB', '<cmd>bd!<cr>' }, -- close buffer
  { 'n', '<leader>b', ':enew<CR>' }, -- open new buffer

  -- tabs --
  { 'n', '<leader>t', ':tabnew<CR>' }, -- open new tab
  -- navigate tabs
  { 'n', '[t', ':tabprevious<CR>' },
  { 'n', ']t', ':tabnext<CR>' },
  -- move tabs
  { 'n', '[T', ':execute "silent! tabmove " . (tabpagenr()-2)<CR>' }, -- move tab left
  { 'n', ']T', ':execute "silent! tabmove " . (tabpagenr()+1)<CR>' },-- move tab right

  -- yanking --
  { 'n', '<leader>y', ':%y<CR>', {} }, -- yank entire buffer
  { 'n', 'Y', 'y$' }, -- Yank till end of line with Y (instead of yanking entire line)
  -- Leave cursor where it is after yanking
  { 'n', 'y^', 'mzy^`z' },
  { 'n', 'ygg', 'mzygg`z' },
  -- Paste last thing yanked
  { 'n', ',p', '"0p', { silent = true } },
  { 'n', ',P', '"0P', { silent = true } },

  -- Keep things centered when jumping and joining lines ('zz' centers cursor, 'zv' opens folds)
  { 'n', 'n', 'nzzzv' },
  { 'n', 'N', 'Nzzzv' },
  { 'n', 'J', 'mzJ`z' },

  -- Create undo break points when hitting certain characters in insert mode (allows for more granular undos)
  { 'i', ',', ',<c-g>u' },
  { 'i', '.', '.<c-g>u' },
  { 'i', '!', '!<c-g>u' },
  { 'i', '?', '?<c-g>u' },

  -- custom functions
  { 'n', '<leader>d', '<cmd>lua require("config.utils").toggle_diff()<cr>' }, -- Toggle diff
  { 'n', '<F2>', '<cmd>lua require("config.utils").toggle_whitespace()<cr>' }, -- Toggle whitespace
}

local default_options = { noremap = true, silent = true }
for _, val in pairs(keymaps) do
  api.nvim_set_keymap(val[1], val[2], val[3], val[4] or default_options)
end

local lsp_keymaps = {
  { 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>' },
  { 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>' },
  { 'n', '<leader>ca', '<Cmd>Telescope lsp_code_actions<CR>' },
  { 'n', '<leader>gh', '<Cmd>lua vim.lsp.buf.hover()<CR>' },
  { 'n', '<leader>gs', '<Cmd>lua vim.lsp.buf.signature_help()<CR>' },
  { 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>' },
  { 'n', '[e', '<Cmd>lua vim.diagnostic.get_next()<CR>' },
  { 'n', ']e', '<Cmd>lua vim.diagnostic.get_prev()<CR>' },
  { 'n', '<leader>d', '<Cmd>lua vim.diagnostic.open_float()<CR>' },
  { 'n', '<leader>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>' },
  { 'n', '<leader>fn', '<Cmd>Neoformat<CR>' },
}

return {
  lsp_keymaps = lsp_keymaps
}
