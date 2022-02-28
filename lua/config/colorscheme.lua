local vim = vim
local o = vim.opt
local g = vim.g

-- General options
o.termguicolors = true
o.background = 'dark'

local colorscheme = vim.g.local_colorscheme or 'gruvbox-material'

-- Theme specific config options
if colorscheme == 'gruvbox-material' then
  g.gruvbox_material_background = 'hard'
  g.gruvbox_material_sign_column_background = 'none'
  g.gruvbox_material_diagnostic_text_highlight = true
  g.gruvbox_material_diagnostic_line_highlight = true
  g.gruvbox_material_diagnostic_virtual_text = 'colored'
  g.gruvbox_material_enable_bold = true
  g.gruvbox_material_better_performance = true
  -- g.gruvbox_material_disable_italic_comment = true
elseif colorscheme == 'everforest' then
  g.everforest_background = 'hard'
  g.everforest_sign_column_background = 'none'
  g.everforest_diagnostic_text_highlight = true
  g.everforest_diagnostic_line_highlight = true
  g.everforest_diagnostic_virtual_text = 'colored'
  -- g.everforest_disable_italic_comment = true
elseif colorscheme == 'sonokai' then
  g.sonokai_style = 'shusia'
  -- g.sonokai_diagnostic_text_highlight = true
  g.sonokai_diagnostic_line_highlight = true
  g.sonokai_diagnostic_virtual_text = 'colored'
  -- g.sonokai_disable_italic_comment = true
end

-- Set the colorscheme
vim.cmd('colorscheme ' .. colorscheme)
