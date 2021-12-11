local vim = vim
local api = vim.api

local function split_str_to_table(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

local function split_url_components(url)
  url = string.gsub(url, "%%5B", "[")
  url = string.gsub(url, "%%5D", "]")
  url = string.gsub(url, "%%2F", "/")
  url = string.gsub(url, "?", "\n\n?\n")
  url = string.gsub(url, "#", "\n\n#\n")
  url = string.gsub(url, "&", "\n\n&\n")
  return url
end

function _G.parse_url_under_cursor()
  local current_line = api.nvim_get_current_line()
  local formatted_line = split_url_components(current_line)
  local output_table = split_str_to_table(formatted_line, "\n")
  local cursor_position = api.nvim_win_get_cursor(0)
  local current_row = cursor_position[1]
  local insert_row_start = current_row + 5
  local insert_row_end = insert_row_start + #output_table + 2
  local current_buffer = api.nvim_win_get_buf(0)
  api.nvim_buf_set_lines(current_buffer, insert_row_start, insert_row_end, false, output_table)
  require('notify')("URL parsed")
end

function _G.parse_url(url)
  local formatted_line = split_url_components(url)
  local output_table = split_str_to_table(formatted_line, "\n")
  local current_row = 0
  local insert_row_start = current_row + 3
  local insert_row_end = insert_row_start + #output_table + 2
  vim.cmd[[tabnew]]
  local current_buffer = api.nvim_win_get_buf(0)
  api.nvim_buf_set_lines(current_buffer, 0, 0, false, {url})
  api.nvim_buf_set_lines(current_buffer, 2, insert_row_end, false, output_table)
  require('notify')("URL parsed")
end


-- Nktest()
