-- Define global options
local global_options = {
  mapleader = ' ',
  user_emmet_leader_key = '<C-E>', -- emmet leader key
}

-- Define editor options
local editor_options = {
  completeopt = 'menu,menuone,noselect',
  number = true,
  -- relativenumber = true,
  signcolumn = 'yes',
  conceallevel = 0,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  mouse = 'a',
  autoread = true,
  updatetime = 100,
  showmode = false, -- Hides default status text for current mode,
  showcmd = true, -- Show incomplete commands,
  clipboard = 'unnamedplus', -- Copy text from outside vim,
  hidden = true,
  wildmenu = true, -- Command line completion,
  wildoptions = 'pum',
  ignorecase = true, -- Make search case insensitive,
  hlsearch = true, -- make search highlight all matches,
  incsearch = true, -- start search immediately after typing,
  diffopt = 'internal,filler,closeoff,vertical',
  foldlevelstart = 99,
  list = true,
  listchars = 'trail:·,tab:  ',
  splitbelow = true,
  splitright = true,
  cmdheight = 0,
  foldmethod = 'indent'
}

-- Set global options defined above
for key, value in pairs(global_options) do
  vim.g[key] = value
end

-- Set editor options defined above
for key, value in pairs(editor_options) do
  vim.o[key] = value
end
