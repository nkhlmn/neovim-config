local M = {}

--[[ GET ATTACHED LSP SERVER NAMES ]]
function M.get_attached_lsp_servers()
  local attached_servers = vim.lsp.get_active_clients()
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

return M

