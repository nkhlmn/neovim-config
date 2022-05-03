local vim = vim
local api = vim.api

local function str_to_table(inputstr, sep)
  if sep == nil then
    sep = '%s'
  end
  local t = {}
  for str in string.gmatch(inputstr, '([^' .. sep .. ']+)') do
    table.insert(t, str)
  end
  return t
end

local function split_url_components(url)
  url = string.gsub(url, '%%5B', '[')
  url = string.gsub(url, '%%5b', '[')
  url = string.gsub(url, '%%5D', ']')
  url = string.gsub(url, '%%5d', ']')
  url = string.gsub(url, '%%2F', '/')
  url = string.gsub(url, '%%2f', '/')
  url = string.gsub(url, '?', '\n\n?\n')
  url = string.gsub(url, '#', '\n\n#\n')
  url = string.gsub(url, '&', '\n\n&\n')
  return url
end

local function parse_url_under_cursor()
  local current_line = api.nvim_get_current_line()
  local formatted_line = split_url_components(current_line)
  local output_table = str_to_table(formatted_line, '\n')
  -- local cursor_position = api.nvim_win_get_cursor(0)
  -- local current_row = cursor_position[1]
  local insert_row_start = 0
  local insert_row_end = insert_row_start + #output_table
  vim.cmd([[tabnew]])
  local current_buffer = api.nvim_win_get_buf(0)
  api.nvim_buf_set_lines(current_buffer, insert_row_start, insert_row_end, false, output_table)
  require('notify')('URL parsed')
end

local function parse_url(url)
  local formatted_line = split_url_components(url)
  local output_table = str_to_table(formatted_line, '\n')
  local current_row = 0
  local insert_row_start = current_row + 3
  local insert_row_end = insert_row_start + #output_table + 2
  vim.cmd([[tabnew]])
  local current_buffer = api.nvim_win_get_buf(0)
  api.nvim_buf_set_lines(current_buffer, 0, 0, false, { url })
  api.nvim_buf_set_lines(current_buffer, 2, insert_row_end, false, output_table)
  require('notify')('URL parsed')
end

vim.cmd([[command! ParseUrlUnderCursor lua require("config.utils").parse_url_under_cursor()]])
vim.cmd([[command! -nargs=* ParseUrl lua require("config.utils").parse_url(<f-args>)]])

local function get_attached_lsp_servers()
  local attached_servers = vim.lsp.get_active_clients()
  local server_names = {}

  for _, value in pairs(attached_servers) do
    table.insert(server_names, value.name)
  end

  return table.concat(server_names, ' ')
end

local function toggle_whitespace()
  vim.o.list = not vim.o.list
end

local function toggle_diff()
  local action = (vim.o.diff == true and 'off' or 'this')
  vim.cmd('windo diff' .. action)
end


return {
  get_attached_lsp_servers = get_attached_lsp_servers,
  parse_url = parse_url,
  parse_url_under_cursor = parse_url_under_cursor,
  toggle_whitespace = toggle_whitespace,
  toggle_diff = toggle_diff,
}
