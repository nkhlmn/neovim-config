require('config.plugins')
require('config.colorscheme')
require('config.treesitter')
require('config.lspconfig')

local vim = vim
local o = vim.o
local wo = vim.wo
local bo = vim.bo


vim.cmd[[
source ~/.config/nvim/lightline.vim
source ~/.config/nvim/custom_functions.vim
source ~/.config/nvim/autocmd.vim
source ~/.config/nvim/remap.vim
source ~/.config/nvim/telescope.vim
source ~/.config/nvim/nvim-compe.vim
source ~/.config/nvim/lspsaga.vim

syntax on
filetype plugin on
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
-- nnoremap * *N

o.foldlevelstart = 99


-- NETRW
-- o.netrw_liststyle = 3
o.splitbelow = true
o.splitright = true
