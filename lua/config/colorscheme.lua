local vim = vim
local o = vim.opt
local g = vim.g

-- COLORSCHEME
-- General options
o.termguicolors = true
o.background = 'dark'

 -- Specify colorscheme name here
-- local colorscheme_name = 'spacegray'
-- local colorscheme_name = 'everforest'
local colorscheme_name = 'gruvbox-material'
-- local colorscheme_name = 'sonokai'
-- local colorscheme_name = 'edge'

-- Theme specific config options
if(colorscheme_name == 'gruvbox-material') then
	g.gruvbox_material_background = 'hard'
	g.gruvbox_material_sign_column_background = 'none'
	g.gruvbox_material_diagnostic_text_highlight = true
	g.gruvbox_material_diagnostic_line_highlight = true
	g.gruvbox_material_diagnostic_virtual_text = 'colored'
  -- g.gruvbox_material_disable_italic_comment = true
elseif(colorscheme_name == 'everforest') then
	g.everforest_background = 'hard'
	g.everforest_sign_column_background = 'none'
	g.everforest_diagnostic_text_highlight = true
	g.everforest_diagnostic_line_highlight = true
	g.everforest_diagnostic_virtual_text = 'colored'
	-- g.everforest_disable_italic_comment = true
elseif(colorscheme_name == 'edge') then
	g.edge_disable_italic_comment = true
end

-- Set the colorscheme
vim.cmd('colorscheme ' .. colorscheme_name)

-- LIGHTLINE
local lightline_theme_mapping = {
	['ayu'] = 'ayu',
	['gruvbox-material'] = 'gruvbox_material',
	['sonokai'] = 'sonokai',
	['everforest'] = 'everforest',
	['spacegray'] = 'darcula',
	['onedark'] = 'onedark',
	['edge'] = 'edge',
}

vim.cmd[[
function! GetActiveLspClients()
	try
		return luaeval('require("config.lsp").get_attached_lsp_servers()')
	catch
		return ''
	endtry
endfunction

function! GetGitHead()
	try
		return b:gitsigns_head
	catch
		return ''
	endtry
endfunction

function! GetGitStatus()
	try
		return b:gitsigns_status
	catch
		return ''
	endtry
endfunction
]]

g.lightline = {
	colorscheme = lightline_theme_mapping[g.colors_name],
	active = {
		left = {
			{ 'mode', 'paste' },
			{ 'gitbranch', 'gitstatus' },
			{ 'readonly', 'filename', 'modified', 'active_lsp_clients' },
		}
	},
	component_function = {
		gitbranch = 'GetGitHead',
		gitstatus = 'GetGitStatus',
		active_lsp_clients = 'GetActiveLspClients',
	},
}

