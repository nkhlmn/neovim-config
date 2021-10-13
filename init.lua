require('config.plugins')
require('config.colorscheme')
require('config.treesitter')
require('config.lspconfig')
require('config.toggleterm')
require('config.telescope')
require('config.lspsaga')
require('config.nvim-compe')
require('config.nvim-autopairs')

local vim = vim
local api = vim.api
local o = vim.o
local g = vim.g
-- local wo = vim.wo
-- local bo = vim.bo

o.completeopt = 'menuone,noselect'
o.number = true
o.relativenumber = true
o.conceallevel = 0
o.expandtab = true
o.shiftwidth = 2
o.softtabstop = 2
o.mouse = 'a'
o.autoread = true
o.updatetime = 100
o.laststatus = 2 -- Always show statusline
o.showmode = true -- Hides default status text for current mode
o.showcmd = true -- Show incomplete commands
o.clipboard = 'unnamedplus' -- Copy text from outside vim
o.hidden = true
-- o.path+=** -- Search down into subfolders/Enables tabbing
o.wildmenu = true -- Command line completion
o.wildoptions = 'pum'
o.ignorecase = true -- Make search case insensitive
o.hlsearch = true -- make search highlight all matches
o.incsearch = true -- start search immediately after typing
o.diffopt = 'internal,filler,closeoff,vertical'
o.foldlevelstart = 99


-- NETRW
g.netrw_liststyle = 3
o.splitbelow = true
o.splitright = true

-- Highlight on yank
vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank()]]

-- Mappings
vim.g.mapleader = ' '
api.nvim_set_keymap('n', '*', '*N', {}) -- keep cursor on first match when searching for word under cursor
api.nvim_set_keymap('', '<C-S>', ':w<CR>', {}) -- save buffer
api.nvim_set_keymap('n', 'Q', '<Nop>', {}) -- prevent going into ex mode
-- api.nvim_set_keymap('', '<leader>n', ':set number!<CR>', {})
api.nvim_set_keymap('n', '<leader>y', ':%y<CR>', {}) -- yank entire buffer
api.nvim_set_keymap('n', '<ESC><ESC>', ':let @/ = ""<cr>', { noremap = true, silent = true }) -- clear search by pressing esc twice

api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', { silent = true }) -- open new tab
api.nvim_set_keymap('n', '<leader>T', ':Texplore<CR>', { silent = true }) -- open new tab with netrw
api.nvim_set_keymap('n', '<leader>s', ':new<CR>', { silent = true }) -- open horizontal split
api.nvim_set_keymap('n', '<leader>S', ':Sexplore<CR>', { silent = true }) -- open horizontal split with netrw
api.nvim_set_keymap('n', '<leader>v', ':vnew<CR>', { silent = true }) -- open vertical split
api.nvim_set_keymap('n', '<leader>V', ':vnew<bar>Explore<CR>', { silent = true }) -- open vertical split with netrw


api.nvim_set_keymap('n', '[t', ':tabprevious<CR>', { silent = true, noremap = true }) -- prev tab
api.nvim_set_keymap('n', ']t', ':tabnext<CR>', { silent = true, noremap = true }) -- next tab
api.nvim_set_keymap('n', '[T', ':execute "silent! tabmove " . (tabpagenr()-2)<CR>', { silent = true, noremap = true }) -- move tab left
api.nvim_set_keymap('n', ']T', ':execute "silent! tabmove " . (tabpagenr()+1)<CR>', { silent = true, noremap = true }) -- move tab right

api.nvim_set_keymap('', '<leader>`', ':tabnew $MYVIMRC<CR>', { noremap = true, silent = true }) -- open init.lua

api.nvim_set_keymap('n', ' ', 'za', { noremap = true, silent = true })

g.user_emmet_leader_key = '<C-E>'

-- Highlight on yank
vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank()]]

-- Yank till end of line with Y (instead of yanking entire line)
api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true, silent = true })

-- Leave cursor where it is after yanking
api.nvim_set_keymap('n', 'y^', 'mzy^`z', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'ygg', "mzygg`z", { noremap = true, silent = true })

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
function _G.toggle_diff()
  local action = (vim.o.diff == true and 'off' or 'this')
  vim.cmd('windo diff' .. action)
end

api.nvim_set_keymap('n', '<leader>d', '<cmd>lua toggle_diff()<cr>', {})

-- Show highlight group under cursor
vim.cmd[[
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
]]

-- Toggle whitespace
vim.cmd[[
" https://stackoverflow.com/questions/9104706/how-can-i-convert-spaces-to-tabs-in-vim-or-linux
function! ToggleWhitespace()
  setlocal lcs=tab:>-,trail:-,eol:$ list! list?
  if &list
    match ErrorMsg /\s\+$/
  else
    match none
  endif
endfunction

nnoremap <F2> :call ToggleWhitespace()<CR>
]]

-- Parse URL
vim.cmd[[
function! ParseURL()
  execute "%s/#/\r#\r/ge"
  execute "%s/?/\r?\r/ge"
  execute "%s/&/\r&\r/ge"
  execute "%s/%5B/[/ge"
  execute "%s/%5D/]/ge"
  execute "%s!%2F!/!ge"
endfunction
]]

vim.cmd[[
" Trigger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | endif
" Notification after file change
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]]
