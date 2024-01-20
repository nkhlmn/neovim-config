-- bootstrap lazy.nvim if it isn't already installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

-- add lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- setup lazy.nvim
local opts = {
  dev = {
    path = '~/development',
    fallback = true,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
}
require('lazy').setup('config.plugins', opts)
