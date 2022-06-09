local utils = require('config.utils')

-- Define global keymaps
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
  { 'n', '\\d', utils.toggle_diff }, -- Toggle diff
  { 'n', '<F2>', utils.toggle_whitespace }, -- Toggle whitespace

  -- Terminal
  { 't', '<ESC><ESC>', [[<C-\><C-n>]] },
  { 't', '<C-p>', '<UP>' },
  { 't', '<C-n>', '<DOWN>' },
}

-- Set global keymaps
local default_options = { noremap = true, silent = true }
for _, val in pairs(keymaps) do
  vim.keymap.set(val[1], val[2], val[3], val[4] or default_options)
end

-- Define mappings that will get set by lsp on_attach function
local lsp_keymaps = {
  { 'n', 'gD', vim.lsp.buf.declaration },
  { 'n', 'gd', vim.lsp.buf.definition },
  { 'n', '<leader>gh', vim.lsp.buf.hover },
  { 'n', '<leader>gs', vim.lsp.buf.signature_help },
  { 'n', '<leader>rn', vim.lsp.buf.rename },
  { 'n', '[e', vim.diagnostic.get_next },
  { 'n', ']e', vim.diagnostic.get_prev },
  { 'n', '<leader>d', vim.diagnostic.open_float },
  { 'n', '<leader>f', vim.lsp.buf.formatting },
  { 'n', '<leader>ca', vim.lsp.buf.code_action },
  { 'n', '<leader>fn', '<Cmd>Neoformat<CR>' },
}

return {
  lsp_keymaps = lsp_keymaps
}
