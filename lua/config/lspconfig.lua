local vim = vim

local on_attach = function(client, bufnr)
  -- setup keymappings
  local default_keymap_opts = { noremap = true, silent = true }
  local lsp_keymaps = require('config.keymaps').lsp_keymaps
  for _, val in pairs(lsp_keymaps) do
    vim.api.nvim_buf_set_keymap(bufnr, val[1], val[2], val[3], val[4] or default_keymap_opts)
  end

  -- setup sqls.nvim plugin
  if client.name == 'sqls' then
    require('sqls').on_attach(client, bufnr)
  end

  -- Enable documentHighlight specified certain language servers
  local enable_highlight_servers = {
    'sumneko_lua',
    'rust_analyzer',
    'tsserver',
  }

  for _, server_name in pairs(enable_highlight_servers) do
    if server_name == client.name then
      vim.cmd([[
        autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      ]])
    end
  end

end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local function on_ready(server)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if server.name == 'rust_analyzer' then
    require('rust-tools').setup {
      tools = {
        inlay_hints = { highlight = 'DiagnosticSignHint' },
      },
      server = {
        on_attach = on_attach,
      },
    }
    return
  elseif server.name == 'sumneko_lua' then
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    }
  end

  server:setup(opts) -- This is the same as lspconfig's setup function.
end

require('nvim-lsp-installer').on_server_ready(on_ready)
