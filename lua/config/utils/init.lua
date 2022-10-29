--[[ GET ATTACHED LSP SERVER NAMES ]]
local function get_attached_lsp_servers()
  local attached_servers = vim.lsp.get_active_clients()
  local server_names = {}

  for _, value in pairs(attached_servers) do
    table.insert(server_names, value.name)
  end

  return table.concat(server_names, ' | ')
end

--[[ TOGGLE WHITESPACE ]]
local function toggle_whitespace()
  vim.o.list = not vim.o.list
end

--[[ TOGGLE DIFF ]]
local function toggle_diff()
  local action = (vim.o.diff == true and 'off' or 'this')
  vim.cmd('windo diff' .. action)
end

return {
  get_attached_lsp_servers = get_attached_lsp_servers,
  toggle_whitespace = toggle_whitespace,
  toggle_diff = toggle_diff,
}

