local vim = vim
local o = vim.opt
local g = vim.g

-- General options
o.termguicolors = true
o.background = 'dark'

local colorscheme_name

-- Check if a local config file (not source controlled) exists
local has_local_config = pcall(require, 'config.local')
if has_local_config then
	local local_config = require('config.local').get_local_config()
	colorscheme_name = local_config.colorscheme
else
	colorscheme_name = 'gruvbox-material'
end

-- Theme specific config options
if(colorscheme_name == 'gruvbox-material') then
	g.gruvbox_material_background = 'hard'
	g.gruvbox_material_sign_column_background = 'none'
	g.gruvbox_material_diagnostic_text_highlight = true
	g.gruvbox_material_diagnostic_line_highlight = true
	g.gruvbox_material_diagnostic_virtual_text = 'colored'
	g.gruvbox_material_enable_bold = true
	g.gruvbox_material_better_performance = true
	-- g.gruvbox_material_disable_italic_comment = true
elseif(colorscheme_name == 'everforest') then
	g.everforest_background = 'hard'
	g.everforest_sign_column_background = 'none'
	g.everforest_diagnostic_text_highlight = true
	g.everforest_diagnostic_line_highlight = true
	g.everforest_diagnostic_virtual_text = 'colored'
	-- g.everforest_disable_italic_comment = true
end

-- Set the colorscheme
vim.cmd('colorscheme ' .. colorscheme_name)
