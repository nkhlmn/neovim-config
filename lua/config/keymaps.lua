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
  { 'n', '<leader>s', ':new<CR>' }, -- horizontal split
  { 'n', '<leader>v', ':vnew<CR>' }, -- vertical split

  -- buffers --
  { 'n', '<C-S>', ':w<CR>', {} }, -- write/save buffer
  { 'n', 'ZB', '<cmd>bd!<cr>' }, -- close buffer
  { 'n', '<leader>b', ':enew<CR>' }, -- open new buffer

  -- tabs --
  { 'n', '<leader>t', ':tabnew<CR>' }, -- open new tab
  { 'n', '[t', ':tabprevious<CR>' }, -- previous tab
  { 'n', ']t', ':tabnext<CR>' }, -- next tab
  { 'n', '[T', ':execute "silent! tabmove " . (tabpagenr()-2)<CR>' }, -- move tab left
  { 'n', ']T', ':execute "silent! tabmove " . (tabpagenr()+1)<CR>' }, -- move tab right

  -- yanking --
  { 'n', '<leader>y', ':%y<CR>', {} }, -- yank entire buffer
  { 'n', 'Y', 'y$' }, -- Yank till end of line with Y (instead of yanking entire line)
  { 'n', 'y^', 'mzy^`z' }, -- Leave cursor where it is after yanking
  { 'n', 'ygg', 'mzygg`z' }, -- Leave cursor where it is after yanking
  { 'n', ',p', '"0p', { silent = true } }, -- Paste (after cursor) last thing yanked
  { 'n', ',P', '"0P', { silent = true } }, -- Paste (before cursor) last thing yanked

  -- Create undo break points when hitting certain characters in insert mode (allows for more granular undos)
  { 'i', ',', ',<c-g>u' },
  { 'i', '.', '.<c-g>u' },
  { 'i', '!', '!<c-g>u' },
  { 'i', '?', '?<c-g>u' },

  -- Custom functions
  { 'n', '\\d', utils.toggle_diff }, -- Toggle diff
  { 'n', '\\w', utils.toggle_whitespace }, -- Toggle whitespace

  -- plugins
  ---- gitsigns
  { 'n', '[g', ':Gitsigns prev_hunk<CR>' },
  { 'n', ']g', ':Gitsigns next_hunk<CR>' },

  ---- telescope (global)
  { 'n', '<C-t><C-t>', ':Telescope<cr>' },
  { 'n', '<leader>p', utils.open_telescope_find_files_with_hidden },
  { 'n', '<C-g>', require('telescope.builtin').git_status },
  { 'n', '<C-b>', require('telescope.builtin').buffers },
  { 'n', '<C-p>', require('telescope.builtin').find_files },
  { 'n', '<C-f>', require('telescope.builtin').live_grep },
  { 'n', '<C-h>', require('telescope.builtin').help_tags },
  { 'n', '<leader>-', utils.open_telescope_file_browser_with_hidden },
  { 'n', '<leader>ok', require('telescope.builtin').keymaps },
  { 'n', '<leader>oc', require('telescope.builtin').colorscheme },
  { 'n', '<leader>ol', require('telescope.builtin').loclist },
  { 'n', '<leader>oq', require('telescope.builtin').quickfix },
  { 'n', '<leader>oo', require('telescope.builtin').vim_options },
  { 'n', '<leader>oh', require('telescope.builtin').highlights },
  { 'n', '<leader>od', require('telescope.builtin').diagnostics },
  { 'n', '-', ':Telescope file_browser<cr>' },
  { 'n', '\\d', ':Telescope diagnostics<cr>' },
}

-- Set global keymaps
local default_options = { noremap = true, silent = true }
for _, val in pairs(keymaps) do
  local success, error = pcall(vim.keymap.set, val[1], val[2], val[3], val[4] or default_options)
  if not success then
    vim.notify(error, vim.log.levels.ERROR)
  end
end

-- Define lsp keymaps (set in lsp on_attach function)
local lsp_keymaps = {
  defaults = {
    { 'n', 'gD', vim.lsp.buf.declaration },
    { 'n', 'gd', vim.lsp.buf.definition },
    { 'n', 'gh', vim.lsp.buf.hover },
    { 'n', 'gs', vim.lsp.buf.signature_help },
    { 'n', '<leader>rn', vim.lsp.buf.rename },
    { 'n', '<leader>ca', vim.lsp.buf.code_action },
    { 'n', ']d', vim.diagnostic.goto_next },
    { 'n', '[d', vim.diagnostic.goto_prev },
    { 'n', '<leader>f', vim.lsp.buf.format },

    -- telescope (lsp)
    { 'n', 'gr', require('telescope.builtin').lsp_references },
    { 'n', '<leader>d', require('telescope.builtin').lsp_definitions },
    { 'n', '<leader>i', require('telescope.builtin').lsp_implementations },

    -- misc
    { 'n', '<leader>fn', '<Cmd>Neoformat<CR>' },
    { 'n', '<leader>d', require('config.utils').toggle_diagnostics },
  },

  rust_analyzer = {
    { 'n', '[e', '<Cmd>RustMoveItemUp<CR>' },
    { 'n', ']e', '<Cmd>RustMoveItemDown<CR>' },
  },
}

return {
  lsp_keymaps = lsp_keymaps,
}
