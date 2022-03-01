local global_options = {
  mapleader = ' ',
  user_emmet_leader_key = '<C-E>', -- emmet leader key
}

local editor_options = {
  completeopt = 'menu,menuone,noselect',
  number = true,
  relativenumber = true,
  conceallevel = 0,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  mouse = 'a',
  autoread = true,
  updatetime = 100,
  laststatus = 2, -- Always show statusline,
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
}


for key, value in pairs(editor_options) do
  vim.o[key] = value
end

for key, value in pairs(global_options) do
  vim.g[key] = value
end
