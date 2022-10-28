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
    require('notify')('File changed on disk. Buffer reloaded.')
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
