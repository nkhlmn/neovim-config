return {
  -- Misc
  { 'chrisbra/csv.vim' },

  {
    'stevearc/oil.nvim',
    opts = {},
    config = function ()
      require('oil').setup()
    end
  },

  -- Personal
  { 'nkhlmn/spectur.nvim', dev = true },
  { 'nkhlmn/gore.nvim', dev = true },
  { 'nkhlmn/contemplate.nvim', dev = true },
}

