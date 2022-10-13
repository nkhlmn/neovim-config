require('impatient')

-- Check if a lua/config/local.lua file with overrides exists
vim.g.has_local_config = pcall(require, 'config.local')

require('config.globals')
require('config.plugins')
require('config.colorscheme')
require('config.utils')
require('config.options')
require('config.keymaps')
require('config.autocmds')
require('config.lspconfig')
