vim.api.nvim_create_augroup('yank', { clear = true })
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  group = 'yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_augroup('file-change', { clear = true })
vim.api.nvim_create_autocmd({ 'FileChangedShellPost' }, {
  group = 'file-change',
  pattern = '*',
  callback = function()
    vim.notify('File was modified. Buffer reloaded.', vim.log.levels.INFO)
  end,
})

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  group = 'file-change',
  pattern = '*',
  callback = function()
    if not vim.fn.bufexists('[Command Line]') then
      vim.cmd('checktime')
    end
  end,
})

vim.api.nvim_create_augroup('macro-recording', { clear = true })
vim.api.nvim_create_autocmd({ 'RecordingEnter' }, {
  group = 'macro-recording',
  pattern = '*',
  callback = function()
    local message = 'Recording @' .. vim.fn.reg_recording()
    vim.notify(message, vim.log.levels.INFO, {
      timeout = 5,
      render = 'minimal',
      keep = function()
        return vim.fn.reg_recording() ~= ''
      end
    })
  end,
})
