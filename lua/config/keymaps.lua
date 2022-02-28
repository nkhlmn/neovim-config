local api = vim.api
local g = vim.g

api.nvim_set_keymap('n', '*', '*N', {}) -- keep cursor on first match when searching for word under cursor
api.nvim_set_keymap('n', '<C-S>', ':w<CR>', {}) -- save buffer
api.nvim_set_keymap('n', 'Q', '<Nop>', {}) -- prevent going into ex mode
api.nvim_set_keymap('n', '<leader>y', ':%y<CR>', {}) -- yank entire buffer
api.nvim_set_keymap('n', '<ESC><ESC>', ':let @/ = ""<cr>', { noremap = true, silent = true }) -- clear search by pressing esc twice
api.nvim_set_keymap('n', 'ZB', '<cmd>bd!<cr>', { noremap = true, silent = true })

api.nvim_set_keymap('n', '<leader>b', ':enew<CR>', { silent = true }) -- open new buffer
api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', { silent = true }) -- open new tab
api.nvim_set_keymap('n', '<leader>T', ':Texplore<CR>', { silent = true }) -- open new tab with netrw
api.nvim_set_keymap('n', '<leader>s', ':new<CR>', { silent = true }) -- open horizontal split
api.nvim_set_keymap('n', '<leader>S', ':Sexplore<CR>', { silent = true }) -- open horizontal split with netrw
api.nvim_set_keymap('n', '<leader>v', ':vnew<CR>', { silent = true }) -- open vertical split
api.nvim_set_keymap('n', '<leader>V', ':vnew<bar>Explore<CR>', { silent = true }) -- open vertical split with netrw

-- navigate tabs
api.nvim_set_keymap('n', '[t', ':tabprevious<CR>', { silent = true, noremap = true })
api.nvim_set_keymap('n', ']t', ':tabnext<CR>', { silent = true, noremap = true })

-- navigate tabs
api.nvim_set_keymap('n', '[T', ':execute "silent! tabmove " . (tabpagenr()-2)<CR>', { silent = true, noremap = true }) -- move tab left
api.nvim_set_keymap('n', ']T', ':execute "silent! tabmove " . (tabpagenr()+1)<CR>', { silent = true, noremap = true }) -- move tab right


api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true, silent = true }) -- Yank till end of line with Y (instead of yanking entire line)

-- Leave cursor where it is after yanking
api.nvim_set_keymap('n', 'y^', 'mzy^`z', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'ygg', 'mzygg`z', { noremap = true, silent = true })

-- Keep things centered when jumping and joining lines ('zz' centers cursor, 'zv' opens folds)
api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'J', 'mzJ`z', { noremap = true, silent = true })

-- Create undo break points when hitting certain characters in insert mode (allows for more granular undos)
api.nvim_set_keymap('i', ',', ',<c-g>u', { noremap = true, silent = true })
api.nvim_set_keymap('i', '.', '.<c-g>u', { noremap = true, silent = true })
api.nvim_set_keymap('i', '!', '!<c-g>u', { noremap = true, silent = true })
api.nvim_set_keymap('i', '?', '?<c-g>u', { noremap = true, silent = true })

-- Open current file with default program
api.nvim_set_keymap('n', '<F5>', ':!open %<CR>', { silent = true })

-- Paste last thing yanked
api.nvim_set_keymap('n', ',p', '"0p', { silent = true })
api.nvim_set_keymap('n', ',P', '"0P', { silent = true })

-- Toggle diff
api.nvim_set_keymap('n', '<leader>d', '<cmd>lua require("config.utils").toggle_diff()<cr>', {})

-- Toggle whitespace
api.nvim_set_keymap('n', '<F2>', '<cmd>lua require("config.utils").toggle_whitespace()<cr>', {})

api.nvim_set_keymap('', '<leader>`', ':tabnew $MYVIMRC<CR>', { noremap = true, silent = true }) -- open init.lua
