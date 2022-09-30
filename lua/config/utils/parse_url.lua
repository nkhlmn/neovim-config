local api = vim.api

local M = {}

function M.str_to_table(inputstr, sep)
  if sep == nil then
    sep = '%s'
  end
  local t = {}
  for str in string.gmatch(inputstr, '([^' .. sep .. ']+)') do
    table.insert(t, str)
  end
  return t
end

function M.split_url_components(url)
  url = string.gsub(url, '%%5[Bb]', '[')
  url = string.gsub(url, '%%5[Dd]', ']')
  url = string.gsub(url, '%%2[Ff]', '/')
  url = string.gsub(url, '?', '\n\n?\n')
  url = string.gsub(url, '#', '\n\n#\n')
  url = string.gsub(url, '&', '\n\n&\n')
  return url
end

function M.parse_url_under_cursor()
  local current_line = api.nvim_get_current_line()
  local formatted_line = M.split_url_components(current_line)
  local output_table = M.str_to_table(formatted_line, '\n')
  local insert_row_start = 0
  local insert_row_end = insert_row_start + #output_table
  vim.cmd([[tabnew]])
  local current_buffer = api.nvim_win_get_buf(0)
  api.nvim_buf_set_lines(current_buffer, insert_row_start, insert_row_end, false, output_table)
  require('notify')('URL parsed')
end

function M.parse_url(url)
  local formatted_line = M.split_url_components(url)
  local output_table = M.str_to_table(formatted_line, '\n')
  local current_row = 0
  local insert_row_start = current_row + 3
  local insert_row_end = insert_row_start + #output_table + 2
  vim.cmd([[tabnew]])
  local current_buffer = api.nvim_win_get_buf(0)
  api.nvim_buf_set_lines(current_buffer, 0, 0, false, { url })
  api.nvim_buf_set_lines(current_buffer, 2, insert_row_end, false, output_table)
  require('notify')('URL parsed')
end

api.nvim_create_user_command('ParseUrl', function(args) M.parse_url(args.fargs[1]) end, { nargs = 1})
api.nvim_create_user_command('ParseUrlUnderCursor', M.parse_url_under_cursor, {})

return M
