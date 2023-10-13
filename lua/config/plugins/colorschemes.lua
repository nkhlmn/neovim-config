return {
  { 'sainnhe/gruvbox-material' },

  { 'sainnhe/everforest' },

  { 'sainnhe/sonokai' },

  {
    'rebelot/kanagawa.nvim',
    config = function ()
      require('kanagawa').setup({
        overrides = function(colors)
          return {
            NormalFloat = { bg = colors.palette.dragonBlack4 }
          }
        end,
      })
    end
  },
}
