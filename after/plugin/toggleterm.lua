require('toggleterm').setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    --[[

    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  ]]
    return vim.o.lines - 4
  end,
  open_mapping = [[<c-\><c-t>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  float_opts = {
    -- The border key is *almost* the same as 'nvim_win_open'
    -- see :h nvim_win_open for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'single', -- other options supported by win open
    width = vim.o.columns - 8,
    height = vim.o.lines - 6,
    highlights = {
      border = 'Identifier',
      background = 'Directory',
    },
  },
}
