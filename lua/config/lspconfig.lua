local vim = vim

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- setup keymappings
  local keymap_opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', keymap_opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', keymap_opts)
  buf_set_keymap('n', '<leader>ca', '<Cmd>Telescope lsp_code_actions<CR>', keymap_opts)
  buf_set_keymap('n', '<leader>gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', keymap_opts)
  buf_set_keymap('n', '<leader>gs', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', keymap_opts)
  buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', keymap_opts)
  buf_set_keymap('n', '[e', '<Cmd>lua vim.diagnostic.get_next()<CR>', keymap_opts)
  buf_set_keymap('n', ']e', '<Cmd>lua vim.diagnostic.get_prev()<CR>', keymap_opts)
  buf_set_keymap('n', '<leader>d', '<Cmd>lua vim.diagnostic.open_float()<CR>', keymap_opts)
  buf_set_keymap('n', '<leader>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', keymap_opts)
  buf_set_keymap('n', '<leader>fn', '<Cmd>Neoformat<CR>', keymap_opts)

  -- setup sqls.nvim plugin
  if client.name == 'sqls' then
    require('sqls').on_attach(client, bufnr)
  end

  -- Enable documentHighlight for certain language servers
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
