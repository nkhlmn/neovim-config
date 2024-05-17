return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-lua/plenary.nvim' }
    },
    config = function ()
      local telescope = require('telescope')

      -- Configuration
      telescope.setup({
        defaults = {
          layout_config = { prompt_position = 'top' },
          sorting_strategy = 'ascending',
          dynamic_preview_title = true,
          mappings = {
            n = {
              ['<C-w>'] = 'delete_buffer'
            },
          }
        },
      })

      telescope.load_extension('fzf')
      telescope.load_extension('contemplate')
      telescope.load_extension('gore')
    end
  },
}
