require('config.plugins')
require('config.colorscheme')
require('config.treesitter')
require('config.lspconfig')
require('config.toggleterm')
require('config.telescope')
require('config.lspsaga')

local vim = vim
local api = vim.api
local o = vim.o
local g = vim.g
-- local wo = vim.wo
-- local bo = vim.bo


vim.cmd[[
source ~/.config/nvim/lightline.vim
source ~/.config/nvim/custom_functions.vim
source ~/.config/nvim/autocmd.vim
source ~/.config/nvim/nvim-compe.vim
]]

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
o.clipboard = 'unnamed' -- Copy text from outside vim
o.hidden = true
-- o.path+=** -- Search down into subfolders/Enables tabbing
o.wildmenu = true -- Command line completion
o.wildoptions = 'pum'
o.ignorecase = true -- Make search case insensitive
o.hlsearch = true -- make search highlight all matches
o.incsearch = true -- start search immediately after typing
o.diffopt = 'internal,filler,closeoff,vertical'
api.nvim_set_keymap('n', '*', '*N', {})
o.foldlevelstart = 99


-- NETRW
g.netrw_liststyle = 3
o.splitbelow = true
o.splitright = true


-- Mappings
api.nvim_set_keymap('', '<C-S>', ':w<CR>', {})
api.nvim_set_keymap('', 'Q', '<Nop>', {})
api.nvim_set_keymap('', '<leader>n', ':set number!<CR>', {})
api.nvim_set_keymap('n', '<leader>y', ':%y<CR>', {})
api.nvim_set_keymap('n', '<ESC><ESC>', ':let @/ = ""<cr>', { noremap = true, silent = true })

api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', { silent = true })
api.nvim_set_keymap('n', '<leader>T', ':Texplore<CR>', { silent = true })
api.nvim_set_keymap('n', '<leader>s', ':new<CR>', { silent = true })
api.nvim_set_keymap('n', '<leader>S', ':Sexplore<CR>', { silent = true })
api.nvim_set_keymap('n', '<leader>v', ':vnew<CR>', { silent = true })
api.nvim_set_keymap('n', '<leader>V', ':vnew<bar>Explore<CR>', { silent = true })


api.nvim_set_keymap('n', '[t', ':tabprevious<CR>', { silent = true, noremap = true })
api.nvim_set_keymap('n', ']t', ':tabnext<CR>', { silent = true, noremap = true })
api.nvim_set_keymap('n', '[T', ':execute "silent! tabmove " . (tabpagenr()-2)<CR>', { silent = true, noremap = true })
api.nvim_set_keymap('n', ']T', ':execute "silent! tabmove " . (tabpagenr()+1)<CR>', { silent = true, noremap = true })

api.nvim_set_keymap('', '<leader>`', ':tabnew $MYVIMRC<CR>', { noremap = true, silent = true })

api.nvim_set_keymap('n', ' ', 'za', { noremap = true, silent = true })

g.user_emmet_leader_key = '<C-E>'
