return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
      require('nvim-treesitter.configs').setup({
        highlight = {
          enable = true,
        },
        refactor = {
          highlight_definitions = {
            enable = true,
            clear_on_cursor_move = false, -- Set to false if you have an `updatetime` of ~100.
          },
        },
      })
    end
  },

  { 'nvim-treesitter/nvim-treesitter-context', config = true },

  { 'nvim-treesitter/nvim-treesitter-refactor' },
}
