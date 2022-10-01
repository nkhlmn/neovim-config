local M = {}

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

  local file = io.open(file_path)
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
function M.create_contemplate_buf(arg)
  local buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_win_set_buf(0, buf)

  if is_filename(arg) then
    local filetype = vim.filetype.match({ filename = arg })
    local file_path = vim.fn.stdpath('config') .. '/templates/' .. arg
    local lines = get_file_lines(file_path)
    vim.api.nvim_buf_set_lines(buf, 0, 0, false, lines)
    vim.api.nvim_buf_set_option(buf, 'ft', filetype)
  else
    vim.api.nvim_buf_set_option(buf, 'ft', arg)
  end
end

--- Open a telescope picker with a set of results provided
-- @param results: the options the picker will display. Should be an array of strings that are either a filetype or the name of a template
-- @param opts: options for the telescope picker
-- Example: require('config.utils').open_contemplate_picker({ 'scratch.js', 'javascript', 'lua','markdown' })
function M.open_contemplate_picker(results, opts)
  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local conf = require('telescope.config').values
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')
  local dropdown = require('telescope.themes').get_dropdown({})

  if (results == nil) then
    results = {}
  end
  local contemplate_entries = vim.g.contemplate_entries

  if (contemplate_entries ~= nil and type(contemplate_entries) == 'table') then
    results = vim.list_extend(results, contemplate_entries)
  end

  opts = vim.tbl_deep_extend('force', dropdown, opts or {})
  pickers
    .new(opts, {
      prompt_title = 'Contemplate',
      finder = finders.new_table({
        results = results,
        entry_maker = function(entry)
          if (type(entry) == 'string') then
            return { value = entry, display = entry, ordinal = entry }
          elseif (type(entry) == 'table') then
            return { value = entry[1], display = entry[2], ordinal = entry[2] }
          end
        end,
      }),
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr, _)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local entry = action_state.get_selected_entry()
          M.create_contemplate_buf(entry.value)
        end)
        return true
      end,
    })
    :find()
end

return M
