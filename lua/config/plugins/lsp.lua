return {
  -- LSP
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim', build = ':MasonUpdate' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'simrat39/rust-tools.nvim' },
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.selene,
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.diagnostics.gitlint,
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.diagnostics.yamllint,
          null_ls.builtins.diagnostics.jsonlint,
          null_ls.builtins.code_actions.eslint_d,
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.yamlfmt,
        },
      })
    end,
  },
}
