local vim = vim
local api = vim.api

--[[ PARSE URL ]]
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
  url = string.gsub(url, '%%5[Bb]', '[')
  url = string.gsub(url, '%%5[Dd]', ']')
  url = string.gsub(url, '%%2[Ff]', '/')
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

--[[ GET ATTACHED LSP SERVER NAMES ]]
local function get_attached_lsp_servers()
  local attached_servers = vim.lsp.get_active_clients()
  local server_names = {}

  for _, value in pairs(attached_servers) do
    table.insert(server_names, value.name)
  end

  return table.concat(server_names, ' ')
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

--[[ OPEN SCRATCHPAD ]]
local function split_lines(contents)
  local lines = {}
  for line in string.gmatch(contents, '(.-)\n') do
    table.insert(lines, line)
  end
  return lines
end

local function get_file_contents(file_path)
  if file_path == nil then
    return ''
  end

  local file = io.open(vim.fn.stdpath('config') .. '/templates/' .. file_path)
  if file ~= nil then
    return file:read('a')
  else
    return ''
  end
end

local function get_file_lines(file_path)
  local file_contents = get_file_contents(file_path)
  return split_lines(file_contents)
end

local function is_filename(arg)
  return arg:match('%.%a+$')
end

--- Open a new scratchpad buffer
-- Accepts an options object with the following keys
-- @param arg: string specifying filetype or path to template
local function open_new_scratchpad(arg)
  local buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_win_set_buf(0, buf)

  if is_filename(arg) then
    vim.filetype.match(arg, buf)
    local lines = get_file_lines(arg)
    vim.api.nvim_buf_set_lines(buf, 0, 0, false, lines)
  else
    vim.api.nvim_buf_set_option(buf, 'ft', arg)
  end
end

--- Open a telescope picker with a set of results provided
-- @param results: the options the picker will display. Should be an array of strings that are either a filetype or the name of a template
-- @param opts: options for the telescope picker
-- Example: require('config.utils').open_scratchpad_picker({ 'scratch.js', 'javascript', 'lua','markdown' })
local open_scratchpad_picker = function(results, opts)
  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local conf = require('telescope.config').values
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')
  local dropdown = require('telescope.themes').get_dropdown({})

  opts = vim.tbl_deep_extend('force', dropdown, opts or {})
  pickers
    .new(opts, {
      prompt_title = 'open scratchpad',
      finder = finders.new_table({ results = results }),
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr, _)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          require('config.utils').open_new_scratchpad(selection[1])
        end)
        return true
      end,
    })
    :find()
end

return {
  get_attached_lsp_servers = get_attached_lsp_servers,
  parse_url = parse_url,
  parse_url_under_cursor = parse_url_under_cursor,
  toggle_whitespace = toggle_whitespace,
  toggle_diff = toggle_diff,
  open_new_scratchpad = open_new_scratchpad,
  open_scratchpad_picker = open_scratchpad_picker,
}
