local vim = vim
local g = vim.g

-- Check if a lua/config/local.lua file with overrides exists
g.has_local_config = pcall(require, 'config.local')

require('config.globals')
require('config.plugins')
require('config.colorscheme')
require('config.lspconfig')
require('config.utils')
require('config.options')
require('config.keymaps')
require('config.autocmds')
