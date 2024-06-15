local M = {}

--[[ GET ATTACHED LSP SERVER NAMES ]]
function M.get_attached_lsp_servers()
  local attached_servers = vim.lsp.get_clients()
  local server_names = {}

  for _, value in pairs(attached_servers) do
    table.insert(server_names, value.name)
  end

  return table.concat(server_names, ' | ')
end

--[[ TOGGLE WHITESPACE ]]
function M.toggle_whitespace()
  vim.o.list = not vim.o.list
end

--[[ TOGGLE DIFF ]]
function M.toggle_diff()
  local action = (vim.o.diff == true and 'off' or 'this')
  vim.cmd('windo diff' .. action)
end

--[[ TOGGLE DIAGNOSTICS ]]
function M.toggle_diagnostics()
  if vim.diagnostic.is_enabled() then
    vim.notify('Disable diagnostics', vim.log.levels.INFO)
    vim.diagnostic.enable(false)
  else
    vim.notify('Enable diagnostics', vim.log.levels.INFO)
    vim.diagnostic.enable()
  end
end

--[[ TOGGLE INLAY HINTS ]]
function M.toggle_inlay_hints()
  local is_enabled = vim.lsp.inlay_hint.is_enabled({})
  vim.lsp.inlay_hint.enable(not is_enabled)
end

function M.open_telescope_find_files_with_hidden()
  require('telescope.builtin').find_files({ no_ignore = true, hidden = true })
end

function M.open_telescope_file_browser_with_hidden()
  require('telescope').extensions.file_browser.file_browser({ respect_gitignore = false, hidden = true })
end

return M
