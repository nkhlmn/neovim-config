-- function to attach completion and diagnostics
-- when setting up lsp
local on_attach = function(client)
  print("LSP started.");
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end

local nvim_lsp = require'nvim_lsp'

nvim_lsp.rust_analyzer.setup{ on_attach=on_attach }
nvim_lsp.tsserver.setup{ on_attach=on_attach }
nvim_lsp.html.setup{ on_attach=on_attach }
nvim_lsp.jsonls.setup{ on_attach=on_attach }
nvim_lsp.cssls.setup{ on_attach=on_attach }
nvim_lsp.sqlls.setup{ on_attach=on_attach }
nvim_lsp.vimls.setup{ on_attach=on_attach }
nvim_lsp.bashls.setup{ on_attach=on_attach }
nvim_lsp.clangd.setup{ on_attach=on_attach }
nvim_lsp.cmake.setup{ on_attach=on_attach }
